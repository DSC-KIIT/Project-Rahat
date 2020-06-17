import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rahat/custom_widgets/google_add.dart';
import 'package:rahat/pages/profile/screens/addPeople.dart';
import 'package:rahat/pages/profile/screens/viewPeople.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';

class AccountsPage extends StatefulWidget {
  @override
  _AccountsPageState createState() => _AccountsPageState();
}

class _AccountsPageState extends State<AccountsPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignedIn = false;
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

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

  @override
  void initState() {
    super.initState();
    this.getUser();
  }

  navigateToAddPeople() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddPeople();
    }));
  }

  navigateToViewPeople(id) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return ViewPeople(id);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        centerTitle: true,
      ),
      body: Container(
        child: FirebaseAnimatedList(
            query: _databaseReference,
            itemBuilder: (BuildContext context, DataSnapshot snapshot,
                Animation<double> animation, int index) {
              return GestureDetector(
                onTap: () {
                  navigateToViewPeople(snapshot.key);
                },
                child: Card(
                    color: Colors.white,
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(10.0),
                        child: Row(
                          children: <Widget>[
                            Container(
                              height: 50.0,
                              width: 50.0,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      image:
                                          snapshot.value['photoUrl'] == "empty"
                                              ? AssetImage(
                                                  "assets/images/mascot.png")
                                              : NetworkImage(
                                                  snapshot.value['photoUrl']))),
                            ),
                            Container(
                              margin: EdgeInsets.all(10.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    "${snapshot.value['name']}",
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Roboto"),
                                  ),
                                  SizedBox(height: 4),
                                  Text("${snapshot.value['age']}")
                                ],
                              ),
                            )
                          ],
                        ))),
              );
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          onPressed: navigateToAddPeople,
          child: CustomPaint(
            child: Container(),
            foregroundPainter: FloatingPainterGButton(),
          )),
    );
  }
}
