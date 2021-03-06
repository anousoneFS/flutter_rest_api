import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:rest_api/pages/components/my_final_card.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';

class FinalCovid extends StatefulWidget {
  @override
  _FinalCovidState createState() => _FinalCovidState();
}

class _FinalCovidState extends State<FinalCovid> {
  List<dynamic> myData;

  Future<void> getData() async {
    String url = "https://pomber.github.io/covid19/timeseries.json";
    var response = await http.get(url);
    myData = json.decode(response.body)["Laos"].reversed.toList();
    setState(() {
      print(myData);
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
        backgroundColor: Colors.red,
        elevation: 0,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              color: Colors.red,
              child: Center(
                child: Text(
                  "ຕິດຕາມຜູ້ຕິດເຊື່ອ covid19 ໃນລາວ",
                  style: TextStyle(fontSize: 30, fontFamily: "NotoSansLao")
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            myData == null
                ? Expanded(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      // reverse: true,
                      // shrinkWrap: false,
                      itemCount: myData.length,
                      itemBuilder: (context, index) {
                        String date = myData[index]['date'].toString();
                        String confirmed =
                            myData[index]['confirmed'].toString();
                        String deaths = myData[index]['deaths'].toString();
                        String recovered =
                            myData[index]['recovered'].toString();
                        return myCard(
                          date: date,
                          confirmed: confirmed,
                          deaths: deaths,
                          recovered: recovered,
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
