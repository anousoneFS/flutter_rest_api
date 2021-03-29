import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:rest_api/models/transactions.dart';
import 'package:rest_api/pages/form_data.dart';
import 'package:rest_api/providers/transaction_providers.dart';
import 'package:intl/intl.dart';

class HomeData extends StatefulWidget {
  @override
  _HomeDataState createState() => _HomeDataState();
}

class _HomeDataState extends State<HomeData> {
  void initState() {
    super.initState();
    Provider.of<TransactionProviders>(
      context,
      listen: false,
    ).initData();
    // Provider.of<TransactionProviders>(
    //   context,
    //   listen: false,
    // ).deleteTransaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Data"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                return Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return FormDataPage();
                    },
                  ),
                );
                // SystemNavigator.pop();
                // exit(0);
              }),
        ],
      ),
      body: Consumer(
        builder: (context, TransactionProviders provider, Widget child) {
          var count = provider.transactions.length;
          if (count <= 0) {
            return Center(
              child: Text(
                "ບໍ່ພົບເຫັນຂໍ້ມູນ",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          } else {
            return ListView.builder(
              itemCount: provider.transactions.length,
              itemBuilder: (context, index) {
                Transactions data = provider.transactions[index];
                return Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: FittedBox(
                        child: Text(
                          data.amount.toString(),
                        ),
                      ),
                    ),
                    title: Text(data.title),
                    subtitle: Text(DateFormat.yMMMd().format(data.date)),
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
