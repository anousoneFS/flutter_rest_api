import 'package:flutter/material.dart';

Card myCard({String date, String confirmed, String deaths, String recovered}) {
  return Card(
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    child: Container(
      width: double.infinity,
      height: 180,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Container(
            height: 50,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Center(
                child: Text(
              date,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            )),
          ),
          Container(
            width: double.infinity,
            height: 130,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 10,
                ),
                mySubCard("confirmed", confirmed),
                SizedBox(
                  width: 10,
                ),
                mySubCard("deaths", deaths),
                SizedBox(
                  width: 10,
                ),
                mySubCard("recovered", recovered),
                SizedBox(
                  width: 10,
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Expanded mySubCard(String name, String value) {
  return Expanded(
    child: Container(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Center(child: Text(name)),
          ),
          Container(
            width: double.infinity,
            height: 70,
            child: Center(child: Text(value)),
          ),
        ],
      ),
    ),
  );
}
