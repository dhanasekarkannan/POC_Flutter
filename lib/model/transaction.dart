import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final double hours;
  final DateTime date;

  Transaction(
      {@required this.id,
      @required this.hours,
      @required this.date});
}
