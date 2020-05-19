import 'package:expensemanagement/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatefulWidget {
  final List<Transaction> transactions;

  TransactionList({this.transactions});

  @override
  _TransactionListState createState() => _TransactionListState();
}

class _TransactionListState extends State<TransactionList> {
  @override
  Widget build(BuildContext context) {
    final formatterDate = DateFormat.yMMMMEEEEd();

    return Container(
      height: 300,
      child: ListView.builder(
          itemCount: widget.transactions.length,
          itemBuilder: (context, index) {
            return Card(
              child: Row(
                children: <Widget>[
                  Container(
                    child: Center(
                      child: Text(
                        '${widget.transactions[index].amount.toStringAsFixed(2)}€',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 10,
                          fontFamily: 'SFPro',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    height: 60,
                    width: 60,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.transparent),
                      borderRadius: BorderRadius.all(
                        Radius.circular(80),
                      ),
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        '${widget.transactions[index].title}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontFamily: 'SFPro'),
                      ),
                      Text(
                          '${formatterDate.format(widget.transactions[index].dateTransaction)}'),
                    ],
                  ),
                ],
              ),
            );
          }),
    );
  }
}
