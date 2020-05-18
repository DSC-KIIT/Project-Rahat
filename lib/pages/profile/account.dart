import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rahat/custom_widgets/google_add.dart';
import 'package:rahat/pages/profile/screens/addPeople.dart';
import 'package:rahat/pages/profile/screens/viewPeople.dart';

class AccountsPage extends StatefulWidget {
  AccountsPage({Key key, this.name}) : super(key: key);

  final String name;

  @override
  _AccountsPageState createState() => _AccountsPageState(name);
}

class _AccountsPageState extends State<AccountsPage> {
  String name;
  _AccountsPageState(name);
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Groups/');

  navigateToAddPeople() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return AddPeople(name);
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
      body: Container(),
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
