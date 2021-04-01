import 'package:flutter/material.dart';

class MyCard extends StatelessWidget {
  final int numInfected;
  final int numRecovered;
  final int numDeaths;
  final String date;

  const MyCard({
    Key key,
    this.numInfected,
    this.numRecovered,
    this.numDeaths, this.date,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 5,
      child: Container(
        width: double.infinity,
        height: 200,
        padding: EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          children: [
            Expanded(
                flex: 1,
                child: Container(
                  margin: EdgeInsets.only(bottom: 10),
                  child: Center(
                    child: Text(
                      date,
                      style: TextStyle(
                        fontSize: 20,
                        color: Color(0xFF959595),
                      ),
                    ),
                  ),
                )),
            Expanded(
              flex: 3,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  myCounter(
                    title: "Infected",
                    color: Color(0xFFFF8748),
                    number: numInfected,
                  ),
                  myCounter(
                    title: "Deaths",
                    color: Color(0xFFFF4848),
                    number: numDeaths,
                  ),
                  myCounter(
                    title: "Recovered",
                    color: Color(0xFF36C12C),
                    number: numRecovered,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class myCounter extends StatelessWidget {
  final String title;
  final int number;
  final Color color;

  const myCounter({
    Key key,
    this.title,
    this.number,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(6),
          height: 25,
          width: 25,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color.withOpacity(.26),
          ),
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              // color: Colors.transparent,
              border: Border.all(
                color: color,
                width: 2,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Text(
          "$number",
          style: TextStyle(
            fontSize: 40,
            color: color,
          ),
        ),
        Text(title, style: TextStyle(fontSize: 16, color: Color(0xFF959595))),
      ],
    );
  }
}

