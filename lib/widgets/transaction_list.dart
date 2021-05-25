import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> _transactions;
  final Function _removeController;

  TransactionList(this._transactions, this._removeController);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (ctx, constraints) {
      return _transactions.isEmpty
          ? Column(
              children: [
                Text(
                  'No input recived yet',
                  style: Theme.of(context).textTheme.headline4,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: constraints.maxHeight * 0.5,
                  child: Image.asset(
                    './assets/images/waiting.png',
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            )
          : ListView.builder(
              itemCount: _transactions.length,
              itemBuilder: (context, index) {
                return Card(
                    elevation: 3,
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        child: FittedBox(
                            child: Text('\$${_transactions[index].price}')),
                      ),
                      title: Text(
                        '${_transactions[index].name}',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      subtitle: Text(
                          '${DateFormat.yMMMd().format((_transactions[index].date))}'),
                      trailing: MediaQuery.of(context).size.width > 450
                          ? ElevatedButton.icon(
                              onPressed: () {
                                _removeController(_transactions[index].id);
                              },
                              icon: Icon(
                                Icons.delete,
                              ),
                              label: Text('Delete'),
                              style: ElevatedButton.styleFrom(
                                primary: Theme.of(context).errorColor,
                              ),
                            )
                          : IconButton(
                              onPressed: () {
                                _removeController(_transactions[index].id);
                              },
                              color: Theme.of(context).errorColor,
                              icon: Icon(
                                Icons.delete,
                              ),
                            ),
                    ));
              });
    });
  }
}
