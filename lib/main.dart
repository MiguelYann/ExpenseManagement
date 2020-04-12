import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'models/transaction.dart';

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

class MyHomePage extends StatelessWidget {
  final List<Transaction> _transactions = [
    Transaction(
      id: 1,
      title: 'iPhone Xs',
      amount: 1197,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      id: 2,
      title: 'Shoes',
      amount: 67,
      dateTransaction: DateTime.now(),
    ),
    Transaction(
      id: 3,
      title: 'TV',
      amount: 677,
      dateTransaction: DateTime.now(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    var formatter = DateFormat.yMMMMEEEEd();
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Expense Management'),
        backgroundColor: Colors.indigoAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Card(
            elevation: 150.0,
            child: Container(
              color: Colors.indigoAccent,
              width: double.infinity,
              child: Text('First card'),
            ),
          ),
          Column(
            children: <Widget>[
              ..._transactions.map((transaction) {
                return Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        child: Center(
                            child: Text(
                              '${transaction.amount}€',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 10,
                                fontFamily: 'SFPro',
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        height: 40,
                        width: 40,
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(80)),
                            color: Colors.red),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${transaction.title}',
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'SFPro'
                            ),
                          ),
                          Text('${formatter.format(
                              transaction.dateTransaction)}'),
                        ],
                      ),
                    ],
                  ),
                );
              }).toList()
            ],
          )
        ],
      ),
    );
  }
}
