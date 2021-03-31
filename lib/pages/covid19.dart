import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

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
      print(myMap);
    });
  }

  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Laos Covid19 Tracker"),
        ),
        body: ListView.builder(itemCount: myMap.length, itemBuilder: (context, index) {
          String name = myMap[index]["confirmed"].toString();
          String deaths = myMap[index]["deaths"].toString();
          String recovered = myMap[index]["recovered"].toString();
          var date = myMap[index]["date"].toString().split('-');
          String newDate = date[2] + '/' +  date[1] + '/' + date[0];
          return myNewCard(name, deaths, recovered, newDate);
        })
    );
  }
}

Card myNewCard(String confirmed, String deaths, String recovered, String date ){
  return Card(
    elevation: 5,
    child: Container(
      child: Column(
        children: [
         Row(
           mainAxisAlignment: MainAxisAlignment.spaceAround,
           children: [
             Text("date"),
            Text("confirmed"),
            Text("deaths"),
            Text("recovered"),
           ],
         ) ,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(date),
              Text(confirmed),
              Text(deaths),
              Text(recovered),
            ],
          )

        ],
      ),
    ),
  );
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
            child: FittedBox(child: Text(confirmed, style: TextStyle(fontSize: 20),)),
          ),
          title: Text("laos", style: TextStyle(fontSize: 24),),
          subtitle: Text(date, style: TextStyle(fontSize: 20, ),),
    ),
  ),);
}

class MyType {
  String name;
  double temp;
  int people;

  MyType({this.name, this.temp, this.people});

}