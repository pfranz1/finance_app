import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

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
                  print(nameController.text);
                  print(priceController.text);
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
