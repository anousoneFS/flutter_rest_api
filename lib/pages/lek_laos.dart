import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rest_api/models/weathercity.dart';
import 'dart:convert';

class LekLaosPage extends StatefulWidget {
  @override
  _LekLaosPageState createState() => _LekLaosPageState();
}

class _LekLaosPageState extends State<LekLaosPage> {
  // WeatherCity _getWeather;
  Map<String, dynamic> lekLaosInfoMap = Map();
  var isLoading = false;

  void initState() {
    super.initState();
    _getLekLaos();
  }

  Future<void> _getLekLaos() async {
    setState(() {
      isLoading = true;
    });
    var getUrl = 'https://retechsole.com/lekdet_api/public/api/lek-lao';
    var response = await http.get(getUrl);
    // _getWeather = weatherCityFromJson(response.body);
    if (response.statusCode == 200) {
      lekLaosInfoMap = json.decode(response.body);
      print("weatherMap = ${lekLaosInfoMap}");
      setState(() {
        isLoading = false;
      });
    } else {
      throw Exception('Failed to load photos');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Data JSON"),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: RaisedButton(
          child: new Text("Fetch Data"),
          onPressed: _getLekLaos,
        ),
      ),
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : Container(
        height: 300,
        width: double.infinity,
        child: Card(
          margin: EdgeInsets.all(10),
          elevation: 5,
          child: Column(
            children: [
              Text("${lekLaosInfoMap['date']}"),
              Text("${lekLaosInfoMap['sixdigit']}"),
              Text("${lekLaosInfoMap['fiveDigit']}"),
              Text("${lekLaosInfoMap['fourDigit']}"),
              Text("${lekLaosInfoMap['threeDigit']}"),
              Text("${lekLaosInfoMap['twoDigit']}"),
            ],
          )
        ),
      )
    );
  }
}
