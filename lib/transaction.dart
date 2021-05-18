import 'package:flutter/cupertino.dart';

import 'package:flutter/foundation.dart';

class Transaction {
  @required
  final double price;
  @required
  final String name;
  @required
  final String id;
  @required
  final DateTime date;

  Transaction({this.price, this.name, this.id, this.date});
}
