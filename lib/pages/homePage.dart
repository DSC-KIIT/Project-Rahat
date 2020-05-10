import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:rahat/auth/googleAuth.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignedIn = false;

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return GoogleAuth();
        }));
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
  }

  Image appLogo = new Image(
      image: new ExactAssetImage("assets/rahatori.png"),
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
      body: !isSignedIn
          ? Center(child: CircularProgressIndicator())
          : Container(),
      floatingActionButton: FloatingActionButton(onPressed: () => signOut()),
    );
  }
}
