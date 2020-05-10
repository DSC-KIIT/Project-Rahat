import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:rahat/pages/homePage.dart';

final kFirebaseAnalytics = FirebaseAnalytics();

class GoogleAuth extends StatefulWidget {
  @override
  _GoogleAuthState createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {
  FirebaseUser _user;
  bool _busy = false;
  final Firestore _db = Firestore.instance;

  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((user) {
      setState(() {
        this._user = user;
      });
    });
  }

  //Google Sign In
  Future<FirebaseUser> _googleSignIn() async {
    final curUser = this._user ?? await FirebaseAuth.instance.currentUser();
    if (curUser != null && !curUser.isAnonymous) {
      return curUser;
    }

    final googleUser = await GoogleSignIn().signIn();
    final googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
        idToken: googleAuth.idToken, accessToken: googleAuth.accessToken);

    final user =
        (await FirebaseAuth.instance.signInWithCredential(credential)).user;
    kFirebaseAnalytics.logLogin();
    setState(() {
      this._user = user;
    });
    updateUserData(user);
    return user;
  }

  //Updating User
  void updateUserData(FirebaseUser user) async {
    DocumentReference ref = _db.collection('users').document(user.uid);

    return ref.setData({
      'uid': user.uid,
      'email': user.email,
      'photoURL': user.photoUrl,
      'displayName': user.displayName,
      'lastSeen': DateTime.now()
    }, merge: true);
  }

  //Pushing user to next Page
  void _showUserProfilePage(FirebaseUser user) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (BuildContext context) {
      return HomePage();
    }));
  }

  //Google SignIn Button UI
  Widget _signInButton() {
    return OutlineButton(
      splashColor: Colors.grey,
      onPressed: this._busy
          ? null
          : () async {
              setState(() => this._busy = true);
              final user = await this._googleSignIn();
              this._showUserProfilePage(user);
              setState(() => this._busy = false);
            },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      highlightElevation: 0,
      borderSide: BorderSide(color: Colors.grey),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image(image: AssetImage("assets/google_logo.png"), height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                'Sign in with Google',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.grey,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Stack(children: <Widget>[
            Align(
              alignment: Alignment.center,
              child: Image.asset('assets/rahatori.png')),
            Padding(
              padding: const EdgeInsets.only(bottom: 200.0),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: _signInButton(),
              ),
            )
          ]),
        ));
  }
}
