import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {
  final Function handlerAddTransaction;

  NewTransaction({this.handlerAddTransaction});

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final TextEditingController _transactionController = TextEditingController();

  final TextEditingController _amountController = TextEditingController();

  void submitTransaction() {
    if (_transactionController.text.isEmpty ||
        _amountController.text.isEmpty) {}
    widget.handlerAddTransaction(
        _transactionController.text, double.parse(_amountController.text));

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    const Color buttonCustomColor = Colors.indigoAccent;

    return Column(
      children: <Widget>[
        Card(
          child: Container(
            height: MediaQuery.of(context).size.height / 4,
            width: MediaQuery.of(context).size.width / 1.35,
            padding: EdgeInsets.all(25),
            child: Column(
              children: <Widget>[
                TextField(
                  onSubmitted: (_) => submitTransaction,
                  controller: _transactionController,
                  decoration: InputDecoration(
                    labelText: 'Name transaction',
                  ),
                ),
                TextField(
                  onSubmitted: (_) => submitTransaction,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  controller: _amountController,
                  decoration: InputDecoration(
                    labelText: 'Amount',
                  ),
                ),
              ],
            ),
          ),
        ),
        RaisedButton(
          onPressed: submitTransaction,
          textColor: Colors.white,
          child: Text('Add'),
        ),
      ],
    );
  }
}
