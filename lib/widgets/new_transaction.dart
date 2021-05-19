import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  final Function addController;

  NewTransaction(this.addController);

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
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(
              child: RaisedButton(
                onPressed: () {
                  addController(
                      nameController.text, double.parse(priceController.text));
                },
                child: Text('Add Transaction'),
              ),
            )
          ],
        ),
      ),
    );
  }
}
