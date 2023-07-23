import 'dart:io';

class Expense {
  final String description;
  final double amount;

  Expense(this.description, this.amount);
}

void main() {
  Map<int, Expense> expenses = {};
  int expenseId = 1;

  bool exit = false;
  while (!exit) {
    print('---------------------------');
    print('Expense Tracker');
    print('---------------------------');
    print('1. Add Expense');
    print('2. View Expenses');
    print('3. View Total Expenses');
    print('4. Exit');
    print('Enter your choice (1/2/3/4): ');

    String choice = stdin.readLineSync()!;
    switch (choice) {
      case '1':
        addExpense(expenses, expenseId);
        expenseId++;
        break;
      case '2':
        viewExpenses(expenses);
        break;
      case '3':
        viewTotalExpenses(expenses);
        break;
      case '4':
        exit = true;
        break;
      default:
        print('Invalid choice. Try again.');
    }
  }
  print('Goodbye! Thank you for using Expense Tracker.');
}

void addExpense(Map<int, Expense> expenses, int expenseId) {
  print('Enter expense description: ');
  String description = stdin.readLineSync()!;

  print('Enter expense amount: ');
  double amount = double.parse(stdin.readLineSync()!);

  expenses[expenseId] = Expense(description, amount);
  print('Expense added successfully!');
}

void viewExpenses(Map<int, Expense> expenses) {
  if (expenses.isEmpty) {
    print('No expenses added yet.');
  } else {
    print('---------------------------');
    print('Expenses');
    print('---------------------------');
    for (int expenseId in expenses.keys) {
      Expense expense = expenses[expenseId]!;
      print(
          'ID: $expenseId | ${expense.description}: \$ ${expense.amount.toStringAsFixed(2)}');
    }
  }
}

void viewTotalExpenses(Map<int, Expense> expenses) {
  if (expenses.isEmpty) {
    print('No expenses added yet.');
  } else {
    double total = 0;
    for (int expenseId in expenses.keys) {
      total += expenses[expenseId]!.amount;
    }
    print('---------------------------');
    print('Total Expenses: \$ ${total.toStringAsFixed(2)}');
  }
}
