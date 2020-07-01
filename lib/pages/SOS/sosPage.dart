import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rahat/pages/SOS/routes/disasterFour.dart';
import 'package:rahat/pages/SOS/routes/disasterOne.dart';
import 'package:rahat/pages/SOS/routes/disasterThree.dart';
import 'package:rahat/pages/SOS/routes/disasterTwo.dart';

class SOSPage extends StatefulWidget {
  @override
  _SOSPageState createState() => _SOSPageState();
}

class _SOSPageState extends State<SOSPage> {
  FirebaseUser user;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);

  
  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    this.getUser();
  }
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
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DisasterOne(uid: user.uid);
                            }));
                          },
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
                                        'assets/images/sos/earthquake.jpg')),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Text('EARTHQUAKE'),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context)
                                .push(MaterialPageRoute(builder: (context) {
                              return DisasterTwo(uid: user.uid);
                            }));
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DisasterThree(uid: user.uid);
                          }));
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
                        onTap: () {
                          Navigator.of(context)
                              .push(MaterialPageRoute(builder: (context) {
                            return DisasterFour(uid: user.uid);
                          }));
                        },
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
