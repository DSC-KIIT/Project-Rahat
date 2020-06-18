import 'package:flutter/material.dart';

class EARTHQUAKE extends StatefulWidget {
  @override
  _EARTHQUAKEState createState() => _EARTHQUAKEState();
}

class _EARTHQUAKEState extends State<EARTHQUAKE> {
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
      
    );
  }
}
