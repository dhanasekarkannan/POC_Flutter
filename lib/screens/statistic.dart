import 'package:flutter/material.dart';
import 'package:hdfc_vendor/model/transaction.dart';
import 'package:hdfc_vendor/widgets/chart.dart';
import 'package:hdfc_vendor/widgets/transation_list.dart';

import '../widgets/main_drawer.dart';

class Statistics extends StatelessWidget {
  final List<Transaction> _recentTransactions = [
    new Transaction(
      id: 'Day1',
      date: DateTime.now().subtract( Duration(days: 6)),
      hours: 8.45,
    ),new Transaction(
      id: 'Day2',
      date: DateTime.now().subtract(Duration(days: 5)),
      hours: 9.45,
    ),new Transaction(
      id: 'Day3',
      date: DateTime.now().subtract(Duration(days: 4)),
      hours: 5.45,
    ),new Transaction(
      id: 'Day4',
      date: DateTime.now().subtract(Duration(days: 3)),
      hours: 6.20,
    ),new Transaction(
      id: 'Day4',
      date: DateTime.now().subtract(Duration(days: 2)),
      hours: 7.45,
    ),new Transaction(
      id: 'Day4',
      date: DateTime.now().subtract(Duration(days: 1)),
      hours: 8.45,
    ),new Transaction(
      id: 'Day5',
      date: DateTime.now(),
      hours: 6.45,
    )

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(child: Column(
        children: <Widget>[
          Chart(_recentTransactions),
          TransactionList(_recentTransactions),
        ],
      )),
    );
  }
}
