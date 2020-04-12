import 'package:flutter/cupertino.dart';

class Transaction {
  final int id;
  final String title;
  final double amount;
  final DateTime dateTransaction;

  Transaction({
    @required this.id,
    @required this.title,
    @required this.amount,
    @required this.dateTransaction,
  });
}
