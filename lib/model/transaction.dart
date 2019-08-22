import 'package:flutter/foundation.dart';

class Transaction {
  final String id;
  final double hours;
  final DateTime date;
  String timeIn;
  String timeOut;

  Transaction(
      {@required this.id,
      @required this.hours,
      @required this.date,
      this.timeIn,
      this.timeOut});
}
