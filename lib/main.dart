import 'package:expensemanagement/widgets/transactions_list.dart';
import 'package:flutter/material.dart';

import 'models/transaction.dart';
import 'widgets/new_transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'SFPro'),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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

  void initNewTransaction(BuildContext aContext) {
    showModalBottomSheet(
        context: aContext,
        builder: (_) {
          return NewTransaction(
            handlerAddTransaction: _addTransaction,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => initNewTransaction(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      appBar: AppBar(
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () => initNewTransaction(context),
          )
        ],
        centerTitle: true,
        title: Text('Expense Management'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Card(
              elevation: 150.0,
              child: Container(
                color: Colors.indigoAccent,
                width: double.infinity,
                child: Text('First carsd'),
              ),
            ),
            TransactionList(
              transactions: _transactions,
            ),
          ],
        ),
      ),
    );
  }
}
