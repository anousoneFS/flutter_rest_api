import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/models/transactions.dart';
import 'package:rest_api/providers/transaction_providers.dart';

class FormDataPage extends StatelessWidget {
  final formKey = GlobalKey<FormState>();
  var titleController = TextEditingController();
  var amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("this is Form data"),
          actions: [
            IconButton(
                icon: Icon(Icons.exit_to_app),
                onPressed: () {
                  SystemNavigator.pop();
                })
          ],
        ),
        body: Form(
          key: formKey,
          child: Column(
            children: [
              TextFormField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "title",
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                validator: (String str) {
                  if (str.isEmpty) {
                    return "press enter some text";
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: amountController,
                decoration: InputDecoration(
                  hintText: "amount",
                  contentPadding: EdgeInsets.only(left: 10),
                ),
                validator: (String str) {
                  if (str.isEmpty) {
                    return "press enter some text";
                  }
                  if (double.parse(str) <= 0) {
                    return "ກະລຸນາປ້ອນຫຼາຍກວ່າ 0";
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 10,
              ),
              FlatButton(
                onPressed: () {
                  if (formKey.currentState.validate()) {
                    var title = titleController.text;
                    var amount = amountController.text;
                    Transactions statement = Transactions(
                      title: title,
                      amount: double.parse(amount),
                      date: DateTime.now(),
                    );
                    TransactionProviders providers =
                        Provider.of<TransactionProviders>(
                      context,
                      listen: false,
                    );
                    providers.addTransactions(statement);
                    Navigator.pop(context);
                  }
                },
                child: Text(
                  "submit",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                color: Colors.blue,
              )
            ],
          ),
        ));
  }
}
