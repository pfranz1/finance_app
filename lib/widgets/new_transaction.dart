import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {
  final Function addController;

  NewTransaction(this.addController);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final nameController = TextEditingController();
  final priceController = TextEditingController();

  DateTime _selectedDate;

  void _submitCalled() {
    widget.addController(
        nameController.text, double.parse(priceController.text), _selectedDate);
  }

  void _displayDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(DateTime.now().year),
            lastDate: DateTime.now())
        .then((pickedDate) {
      pickedDate != null
          ? setState(() {
              _selectedDate = pickedDate;
            })
          : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: 350,
        width: double.infinity,
        child: Card(
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
                  height: 15,
                ),
                Row(
                  children: [
                    Text(_selectedDate == null
                        ? 'No Date Chosen'
                        : 'Picked Date: ${DateFormat.yMd().format(_selectedDate).toString()}'),
                    FlatButton(
                      onPressed: _displayDatePicker,
                      child: Text(
                        'Select Date',
                        style: TextStyle(
                            color: Theme.of(context).primaryColor,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
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
        ),
      ),
    );
  }
}
