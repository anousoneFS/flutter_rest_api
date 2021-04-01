import 'dart:convert';

import 'package:flutter/material.dart';
import 'final_covid_card.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<dynamic> myData;

  Future<void> getData() async {
    String url = "https://pomber.github.io/covid19/timeseries.json";
    var response = await http.get(url);
    myData = json.decode(response.body)["Laos"].reversed.toList();


    setState(() {
      print(myData[0]);
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
        title: Text(
          "Laos Covid-19 Tracker",
          style: TextStyle(fontSize: 24),
        ),
        backgroundColor: Color(0xFFFF8748),
      ),
      body: myData == null
          ? Center(child: CircularProgressIndicator())
          : Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: myData.length,
                    // itemCount: 10,
                    itemBuilder: (context, index) {
                      List dateArray = myData[index]["date"].toString().split('-');
                      String date = dateArray[2] + '-' + dateArray[1] + '-' + dateArray[0];
                      return MyCard(
                        date: date,
                        numInfected: myData[index]["confirmed"],
                        numDeaths: myData[index]["deaths"],
                        numRecovered: myData[index]["recovered"],
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 50,
                )
              ],
            ),
    );
  }
}

