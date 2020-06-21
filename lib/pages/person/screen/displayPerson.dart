import 'package:flutter/material.dart';


class DisplayPerson extends StatelessWidget {
  String name;
  String age;
  DisplayPerson({this.name, this.age});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10, bottom: 10, left: 20, right: 10),
        child: ListView(
          children: <Widget>[
            Text(this.name, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 35), textAlign: TextAlign.center,),
            SizedBox(height: 30),
            Text(this.age, style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 25), textAlign: TextAlign.left,),
          ],
        ),
      )
    );
  }
}
