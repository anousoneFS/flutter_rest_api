import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CovidPage extends StatefulWidget {
  @override
  _CovidPageState createState() => _CovidPageState();
}

class _CovidPageState extends State<CovidPage> {

  // List<MyType> myData = [
  //   MyType(name: "my laos", temp: 30, people: 1000),
  // ];
  List<Map<String, dynamic>> myMap = [{"date": "2020-1-22", "confirmed": "0", "deaths": 0, "recovered": 0},];

  Future<void> getData() async {
    String url = "https://pomber.github.io/covid19/timeseries.json";
    var response = await http.get(url);
    List<dynamic> convert2json = json.decode(response.body)["Laos"];
    print(convert2json[4].runtimeType);
    print(convert2json.length);
    print(convert2json.runtimeType);
    for (var i = 0; i < convert2json.length; i++) {
      var subMap = convert2json[i];
      myMap.insert(0, subMap);
    }
    setState(() {
      print("hi");
      // print(myMap);
    });
    // print(myData);
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("covid 19 Tracker"),
        ),
        body: ListView.builder(itemCount: myMap.length, itemBuilder: (context, index) {
          String name = myMap[index]["confirmed"].toString();
          String date = myMap[index]["date"].toString();
          return myCard(name, date);
        })
    );
  }
}


Container myCard(String confirmed, String date) {
  return Container(
    height: 100,
    margin: EdgeInsets.only(top: 10),
    child: Card(
      elevation: 5,
      child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            child: FittedBox(child: Text(confirmed)),
          ),
          title: Text("laos", style: TextStyle(fontSize: 20),),
          subtitle: Text(date),
    ),
  ),);
}

class MyType {
  String name;
  double temp;
  int people;

  MyType({this.name, this.temp, this.people});

}