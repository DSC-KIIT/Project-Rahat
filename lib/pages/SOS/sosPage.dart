import 'package:flutter/material.dart';
import 'package:rahat/pages/NASA/earthquake.dart';
import 'package:rahat/pages/person/screen/dashboard.dart';
import 'package:rahat/pages/person/services/firebase.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: Center(
                  child: Text('CHOOSE ONE',
                      style: TextStyle(color: Colors.black, fontSize: 25))),
            ),
            SizedBox(height: 60.0),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(

                         onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EARTHQUAKE()));
                          {}
                        },
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(children: <Widget>[
                              Container(
                                  height: 110,
                                  width: 110,
                                  child: Image.asset(
                                      'assets/images/sos/earthquake.jpg')),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('EARTHQUAKE'),
                              )
                            ],),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          child: Card(
                            shape: RoundedRectangleBorder(
                              side: BorderSide(color: Colors.black, width: 1),
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Column(children: <Widget>[
                              Container(
                                  height: 110,
                                  width: 110,
                                  child: Image.asset(
                                      'assets/images/sos/tsunami.png')),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('TSUNAMI'),
                              )
                            ]),
                          ),
                        ),
                      )
                    ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(children: <Widget>[
                            Container(
                                height: 110,
                                width: 110,
                                child: Image.asset(
                                    'assets/images/sos/landslide.png')),
                            Padding(
                              padding: const EdgeInsets.all(5.0),
                              child: Text('LANDSLIDE'),
                            )
                          ]),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        child: Card(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(6),
                          ),
                          child: Column(
                            children: <Widget>[
                              Container(
                                  height: 110,
                                  width: 110,
                                  child: Image.asset(
                                      'assets/images/sos/flood.png')),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Text('FLOOD'),
                              )
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
