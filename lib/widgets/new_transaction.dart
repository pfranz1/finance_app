import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final Function addController;

  NewTransaction(this.addController);

  void _submitCalled() {
    print(priceController.text);
    addController(nameController.text, double.parse(priceController.text));
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
