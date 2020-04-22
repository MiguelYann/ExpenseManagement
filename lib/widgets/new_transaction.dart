import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {
  final Function handlerAddTransaction;

  NewTransaction({this.handlerAddTransaction});

  final TextEditingController _transactionController = TextEditingController();
  final TextEditingController _amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color _BUTTON_COLOR = Colors.indigoAccent;

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
                  controller: _transactionController,
                  decoration: InputDecoration(
                    labelText: 'Name transaction',
                  ),
                ),
                TextField(
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
          onPressed: () {
            handlerAddTransaction(_transactionController.text,
                double.parse(_amountController.text));
          },
          textColor: Colors.white,
          color: _BUTTON_COLOR,
          child: Text('Add'),
        ),
      ],
    );
  }
}
