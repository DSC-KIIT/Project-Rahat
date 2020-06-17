import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:rahat/model/people.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

class EditScreen extends StatefulWidget {
  final String id;
  EditScreen(this.id);
  @override
  _EditScreenState createState() => _EditScreenState(id);
}

class _EditScreenState extends State<EditScreen> {
  String id;
  _EditScreenState(this.id);

  String _name = '';
  String _age = '';
  String _medical = '';
  String _photoUrl;

  //TextEdttingController
  TextEditingController _nController = TextEditingController();
  TextEditingController _aController = TextEditingController();
  TextEditingController _mController = TextEditingController();

  bool isLoading = true;

  //Helper
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  @override
  void initState() {
    super.initState();
    this.getPeople(id);
  }

  getPeople(id) async {
    People people;
    _databaseReference.child(id).onValue.listen((event) {
      people = People.fromSnapshot(event.snapshot);

      _nController.text = people.name;
      _aController.text = people.age;
      _mController.text = people.medical;

      setState(() {
        _name = people.name;
        _age = people.age;
        _medical = people.medical;
        _photoUrl = people.photoUrl;

        isLoading = false;
      });
    });
  }

  //Update Contact
  updatePeople(BuildContext context) async {
    if (_name.isNotEmpty && _age.isNotEmpty) {
      People people = People.withId(
          this.id, this._name, this._medical, this._age, this._photoUrl);

      await _databaseReference.child(id).set(people.toJson());
      navigateTolLastScreen(context);
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

  //Pick Image
  Future pickImage() async {
    File file = await ImagePicker.pickImage(
      source: ImageSource.gallery,
      maxHeight: 200.0,
      maxWidth: 200.0,
    );
    String fileName = basename(file.path);
    uploadImage(file, fileName);
  }

  //Upload Image
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

  navigateTolLastScreen(BuildContext context) {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Edit People Information"),
        centerTitle: true,
      ),
      body: Container(
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Padding(
                padding: EdgeInsets.all(20.0),
                child: ListView(
                  children: <Widget>[
                    //image view
                    Container(
                        margin: EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            this.pickImage();
                          },
                          child: Center(
                            child: Container(
                                width: 100.0,
                                height: 100.0,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.cover,
                                      image: _photoUrl == "empty"
                                          ? AssetImage(
                                              "assets/images/mascot.png")
                                          : NetworkImage(_photoUrl),
                                    ))),
                          ),
                        )),
                    // Name
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _name = value;
                          });
                        },
                        controller: _nController,
                        decoration: InputDecoration(
                          labelText: 'Name',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // Age
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _age = value;
                          });
                        },
                        controller: _nController,
                        decoration: InputDecoration(
                          labelText: 'Age',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // Medical Condition
                    Container(
                      margin: EdgeInsets.only(top: 20.0),
                      child: TextField(
                        onChanged: (value) {
                          setState(() {
                            _medical = value;
                          });
                        },
                        controller: _mController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          labelText: 'Medical Condition (if any)',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)),
                        ),
                      ),
                    ),
                    // Update Button
                    Container(
                      padding: EdgeInsets.only(top: 20.0),
                      child: RaisedButton(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 100.0, 20.0),
                        onPressed: () {
                          updatePeople(context);
                        },
                        color: Colors.blue,
                        child: Text(
                          "Update",
                          style: TextStyle(
                            fontSize: 20.0,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
