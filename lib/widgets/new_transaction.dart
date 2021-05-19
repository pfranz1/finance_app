import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function addController;

  NewTransaction(this.addController);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();

  final priceController = TextEditingController();

  void _submitCalled() {
    print(priceController.text);
    widget.addController(
        nameController.text, double.parse(priceController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Name'),
              controller: nameController,
              onSubmitted: (_) => _submitCalled(),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
              onSubmitted: (_) => _submitCalled(),
            ),
            SizedBox(
              child: RaisedButton(
                onPressed: _submitCalled,
                child: Text('Add Transaction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
