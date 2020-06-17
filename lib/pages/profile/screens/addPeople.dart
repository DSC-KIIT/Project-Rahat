import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahat/model/people.dart';

class AddPeople extends StatefulWidget {
  @override
  _AddPeopleState createState() => _AddPeopleState();
}

class _AddPeopleState extends State<AddPeople> {
  FirebaseUser user;
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  String _name = '';
  String _medical = '';
  String _age = '';
  String _photoUrl = "empty";

  savePeople(BuildContext context) async {
    if (_name.isNotEmpty && _age.isNotEmpty) {
      People people =
          People(this._name, this._medical, this._age, this._photoUrl);

      await _databaseReference.push().set(people.toJson());
      navigateToLastScreen(context);
    } else {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Empty Fields"),
              content: Text("Please fill all the fields"),
              actions: <Widget>[
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    }
  }

  navigateToLastScreen(context) {
    Navigator.of(context).pop();
  }

  Future pickImage() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200.0,
      maxWidth: 200.0,
    );
    String fileName = basename(file.path);
    uploadImage(file, fileName);
  }

  void uploadImage(File file, String fileName) async {
    StorageReference storageReference =
        FirebaseStorage.instance.ref().child(fileName);
    storageReference.putFile(file).onComplete.then((firebaseFile) async {
      var downloadUrl = await firebaseFile.ref.getDownloadURL();

      setState(() {
        _photoUrl = downloadUrl;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add People'),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: ListView(
            children: <Widget>[
              //Image
              Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: GestureDetector(
                    onTap: () => this.pickImage(),
                    child: Center(
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    image: _photoUrl == "empty"
                                        ? AssetImage("assets/images/mascot.png")
                                        : NetworkImage(_photoUrl),
                                    fit: BoxFit.cover)))),
                  )),
              //Name
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _name = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Name of the person',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              //Age
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _age = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Age',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              //Medical Condition
              Container(
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      _medical = value;
                    });
                  },
                  decoration: InputDecoration(
                      labelText: 'Medical Condition (if any)',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))),
                ),
              ),
              // Button - To Add
              Container(
                padding: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                  onPressed: () {
                    savePeople(context);
                  },
                  color: Colors.blue,
                  child: Text('Add',
                      style: TextStyle(fontSize: 20.0, color: Colors.white)),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
