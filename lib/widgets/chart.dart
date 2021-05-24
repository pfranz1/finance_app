import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './chart_bar.dart';
import '../models/transaction.dart';

class Chart extends StatelessWidget {
  final List<Transaction> _recentTransactionList;

  Chart(this._recentTransactionList);

  List<Map<String, Object>> get groupedTransactionValues {
    return List.generate(7, (index) {
      final weekDay = DateTime.now().subtract(Duration(days: index));

      double toatalSum = 0;

      _recentTransactionList.forEach((element) {
        if (element.date.day == weekDay.day &&
            element.date.month == weekDay.month &&
            element.date.year == weekDay.year) {
          toatalSum += element.price;
        }
      });

      return ({
        "day": DateFormat.E().format(weekDay).substring(0, 1),
        "sum": toatalSum
      });
    }).reversed.toList();
  }

  double get totalSpending {
    return groupedTransactionValues.fold(0.0, (value, item) {
      return value + item['sum'];
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(groupedTransactionValues.toString());
    return LayoutBuilder(
      builder: (ctx, constain) {
        return Card(
          margin: EdgeInsets.all(20),
          elevation: 6,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...groupedTransactionValues.map((info) {
                  return Flexible(
                    fit: FlexFit.tight,
                    child: ChartBar(
                        info['day'],
                        info['sum'],
                        totalSpending == 0.0
                            ? 0.0
                            : (info['sum'] as double) / (totalSpending)),
                  );
                }).toList(),
              ],
            ),
          ),
        );
      },
    );
  }
}
