import 'package:expensemanagement/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  Widget build(BuildContext context) {
    final formatterDate = DateFormat.yMMMMEEEEd();

    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        '${transactions[index].amount.toStringAsFixed(2)}€',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 40,
                    width: 40,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                      color: Colors.red,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${transactions[index].title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'SFPro'),
                      ),
                      Text(
                          '${formatterDate.format(transactions[index].dateTransaction)}'),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
