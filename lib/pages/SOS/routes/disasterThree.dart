import 'package:flutter/material.dart';

class DisasterThree extends StatefulWidget {
  DisasterThree({this.uid});

  final String uid;
  @override
  _DisasterThreeState createState() => _DisasterThreeState();
}

class _DisasterThreeState extends State<DisasterThree> {
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1.0,
        title: appLogo,
        centerTitle: true,
      ),
      body: Container(
          child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 30),
          child: Center(
              child: Text('Select People',
                  style: TextStyle(color: Colors.black, fontSize: 25))),
        ),
        SizedBox(height: 20),
      ])),
    );
  }
}
