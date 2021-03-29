import 'package:flutter/material.dart';
import 'package:rest_api/models/transactions1.dart';
import 'package:rest_api/pages/form_data1.dart';
import 'package:intl/intl.dart';

class HomeData1 extends StatefulWidget {
  @override
  _HomeData1State createState() => _HomeData1State();
}

class _HomeData1State extends State<HomeData1> {
  List<Transactions1> transactions1 = [
    Transactions1(title: "car", amount: 1000, date: DateTime.now()),
    Transactions1(title: "house", amount: 500, date: DateTime.now()),
    Transactions1(title: "super car", amount: 100, date: DateTime.now()),
    Transactions1(title: "house 2", amount: 1111, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("learn 1"),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return FormData1();
                }));
              })
        ],
      ),
      body: ListView.builder(itemCount: 3,itemBuilder: (context, index) {
        return Container(
          height: 80,
          child: Card(
            child: ListTile(
              leading: CircleAvatar(
                child: FittedBox(
                  child: Text(transactions1[index].amount.toString()),
                ),
              ),
              title: Text(transactions1[index].title, style: TextStyle(fontSize: 20),),
              subtitle: Text(DateFormat().format(transactions1[index].date)),
            ),
          ),
        );
      }),
    );
  }
}
