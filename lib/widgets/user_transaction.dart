import 'package:flutter/material.dart';

import './transaction_list.dart';
import './new_transaction.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List _transactions = <Transaction>[
    Transaction(
      id: "t1",
      name: "New Shoes",
      price: 10.50,
      date: DateTime.now(),
    ),
    Transaction(
      id: "t2",
      name: "New Hat",
      price: 100.00,
      date: DateTime.now(),
    ),
  ];

  void _addNewTransaction(String txName, double txAmount) {
    final newTx = new Transaction(
      name: txName,
      price: txAmount,
      id: DateTime.now().toString(),
      date: DateTime.now(),
    );

    setState(() {
      _transactions.add(newTx);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 579,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          NewTransaction(_addNewTransaction),
          TransactionList(_transactions),
        ],
      ),
    );
  }
}
