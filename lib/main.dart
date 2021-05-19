import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/user_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final List transactions = <Transaction>[
    Transaction(
        id: "t1", name: "New Shoes", price: 10.50, date: DateTime.now()),
    Transaction(id: "t2", name: "New Hat", price: 100.00, date: DateTime.now()),
  ];

  final nameController = TextEditingController();
  final priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Flutter App'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Text('Chart'),
            ),
            UserTransaction(),
          ],
        ));
  }
}
