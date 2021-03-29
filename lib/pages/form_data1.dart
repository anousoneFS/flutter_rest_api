import 'package:flutter/material.dart';

class FormData1 extends StatefulWidget {
  @override
  _FormData1State createState() => _FormData1State();
}

class _FormData1State extends State<FormData1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("this is from"),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "title",
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
            TextFormField(
              autofocus: true,
              decoration: InputDecoration(
                hintText: "amount",
                contentPadding: EdgeInsets.only(left: 10),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
