import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:rahat/model/people.dart';
import 'package:rahat/pages/profile/screens/editPeople.dart';

class ViewPeople extends StatefulWidget {
  final String id;
  ViewPeople(this.id);
  @override
  _ViewPeopleState createState() => _ViewPeopleState(id);
}

class _ViewPeopleState extends State<ViewPeople> {
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String id;
  _ViewPeopleState(this.id);
  People _people;
  bool isLoading = true;

  getPeople(id) async {
    _databaseReference.child(id).onValue.listen((event) {
      setState(() {
        _people = People.fromSnapshot(event.snapshot);
        isLoading = false;
      });
    });
  }

  navigateToLastScreen() {
    Navigator.of(context).pop();
  }

  navigateToEditScreen(id) {
    Navigator.of(context).push(MaterialPageRoute(builder: (context) {
      return EditScreen(id);
    }));
  }

  deletePeople() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Do you want to delete?'),
            content: Text("Delete Contact"),
            actions: <Widget>[
              FlatButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel')),
              FlatButton(
                  onPressed: () async {
                    Navigator.of(context).pop();
                    await _databaseReference.child(id).remove();
                    navigateToLastScreen();
                  },
                  child: Text('Delete')),
            ],
          );
        });
  }

  @override
  void initState() {
    super.initState();
    this.getPeople(id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("View People"),
        centerTitle: true,
      ),
      body: Container(
          child: isLoading
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(children: <Widget>[
                  // Image
                  Container(
                      height: 200.0,
                      child: Image(
                        image: _people.photoUrl == "empty"
                            ? AssetImage("assets/images/mascot.png")
                            : NetworkImage(_people.photoUrl),
                        fit: BoxFit.contain,
                      )),
                  //Name
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.perm_identity),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              "${_people.name}",
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  //Age
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.view_agenda),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              _people.age,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  //Medial Condition
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.local_hospital),
                            Container(
                              width: 10.0,
                            ),
                            Text(
                              _people.medical,
                              style: TextStyle(fontSize: 20.0),
                            ),
                          ],
                        )),
                  ),
                  //Edit and Delete
                  Card(
                    elevation: 2.0,
                    child: Container(
                        margin: EdgeInsets.all(20.0),
                        width: double.maxFinite,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.edit),
                              color: Colors.blue,
                              onPressed: () {
                                navigateToEditScreen(id);
                              },
                            ),
                            IconButton(
                              iconSize: 30.0,
                              icon: Icon(Icons.delete),
                              color: Colors.blue,
                              onPressed: () {
                                deletePeople();
                              },
                            )
                          ],
                        )),
                  )
                ])),
    );
  }
}
