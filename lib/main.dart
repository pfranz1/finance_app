import 'package:finance_app/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

import './models/transaction.dart';
import './widgets/new_transaction.dart';

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

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List transactions = <Transaction>[
    Transaction(
        id: "t1", name: "New Shoes", price: 10.50, date: DateTime.now()),
    Transaction(id: "t2", name: "New Hat", price: 100.00, date: DateTime.now()),
  ];

  final nameController = TextEditingController();

  final priceController = TextEditingController();

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

  void _startAddNewTransaction(BuildContext ctx) {
    showModalBottomSheet(
      context: ctx,
      builder: (bCtx) {
        return NewTransaction(_addNewTransaction);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => _startAddNewTransaction(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Card(
              child: Text('Chart'),
            ),
            TransactionList(_transactions),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context),
      ),
    );
  }
}
