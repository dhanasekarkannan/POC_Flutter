import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../model/transaction.dart';
import './chart_bar.dart';

class Chart extends StatelessWidget {
  final List<Transaction> recentTransactions;

  Chart(this.recentTransactions);
  List<Map<String, Object>> get generatedTransactionValues {
    return List.generate(7, (index) {
      double totalSum = 0.0;
      final weekDay = DateTime.now().subtract(Duration(days: index));
      for (var tx in recentTransactions) {
        if (tx.date.day == weekDay.day &&
            tx.date.month == weekDay.month &&
            tx.date.year == weekDay.year) {
          totalSum += tx.hours;
        }
      }
      print('total sum for  ${DateFormat.E().format(weekDay)} is $totalSum');
      return {
        'day': DateFormat.E().format(weekDay).substring(0, 1),
        'hours': totalSum,
      };
    }).reversed.toList();
  }

  double get maxSpending {
    return generatedTransactionValues.fold(0.0, (sum, item) {
      return sum + item['hours'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(15),
      child: Container(
        padding: EdgeInsets.all(10),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: generatedTransactionValues.map((data) {
          return Flexible(
            fit: FlexFit.loose,
            flex: 2,
            child: ChartBar(data['day'], data['hours'],
                (data['hours'] as double) / maxSpending),
          );
        }).toList()),
      ),
    );
  }
}
