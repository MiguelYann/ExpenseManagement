import 'package:flutter/material.dart';

import "./new_transaction.dart";
import './transactions_list.dart';
import '../models/transaction.dart';

class UserTransaction extends StatefulWidget {
  @override
  _UserTransactionState createState() => _UserTransactionState();
}

class _UserTransactionState extends State<UserTransaction> {
  final List<Transaction> _transactions = [
    Transaction(
      title: 'iPhone Xs',
      amount: 1197,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      title: 'Shoes',
      amount: 67,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      title: 'TV',
      amount: 677,
      dateTransaction: DateTime.now(),
    ),
  ];

  void _addTransaction(String aTitleTransaction, double anAmount) {
    Transaction _aTransaction = new Transaction(
        title: aTitleTransaction,
        amount: anAmount,
        dateTransaction: DateTime.now());

    setState(() {
      _transactions.add(_aTransaction);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        NewTransaction(
          handlerAddTransaction: _addTransaction,
        ),
        TransactionList(
          transactions: _transactions,
        ),
      ],
    );
  }
}
