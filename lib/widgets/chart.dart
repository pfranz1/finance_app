import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import './transaction_list.dart';
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
    });
  }

  @override
  Widget build(BuildContext context) {
    print(groupedTransactionValues.toString());
    return Card(
      margin: EdgeInsets.all(20),
      elevation: 6,
      child: Row(
        children: [
          ...groupedTransactionValues.map((info) {
            return Text('${info['day']}');
          }).toList(),
        ],
      ),
    );
  }
}
