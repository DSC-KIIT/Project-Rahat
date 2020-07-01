import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rahat/model/person.dart';
import 'package:rahat/pages/person/services/firebase.dart';

class AddScreen extends StatefulWidget {
  final Person person;
  String userUid;
  AddScreen(this.person, this.userUid);

  @override
  State<StatefulWidget> createState() => new _AddScreenState();
}

class _AddScreenState extends State<AddScreen> {
  FirebaseFirestoreService db = new FirebaseFirestoreService();

  TextEditingController _nameController;
  TextEditingController _ageController;
  TextEditingController _medicalController;

  @override
  void initState() {
    super.initState();

    _nameController = new TextEditingController(text: widget.person.name);
    _ageController = new TextEditingController(text: widget.person.age);
    _medicalController = new TextEditingController(text: widget.person.medical);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Details of Person'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            margin: EdgeInsets.all(15.0),
            alignment: Alignment.center,
            child: Column(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Name',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    minLines: 1,
                    maxLines: 100,
                    controller: _ageController,
                    decoration: InputDecoration(
                        labelText: 'Age',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: TextField(
                    minLines: 1,
                    maxLines: 100,
                    controller: _medicalController,
                    decoration: InputDecoration(
                        labelText: 'Medical Conditions (if any)',
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5.0))),
                  ),
                ),
                Padding(padding: new EdgeInsets.all(5.0)),
                Container(
                  padding: EdgeInsets.only(top: 20.0),
                  child: RaisedButton(
                    padding: EdgeInsets.fromLTRB(100, 20, 100, 20),
                    onPressed: () {
                      if (widget.person.id != null) {
                        if (widget.userUid == null) {
                          // When this page is called from notes page
                          db
                              .updatePerson(Person(
                                  widget.person.id,
                                  _nameController.text.trim(),
                                  _ageController.text.trim(),
                                  _medicalController.text.trim()))
                              .then((_) {
                            Navigator.pop(context);
                          });
                        } else {
                          // When this page is called from meeting notes page
                          Firestore.instance
                              .collection("users")
                              .document(widget.userUid)
                              .collection("person")
                              .document(widget.person.id)
                              .updateData(Person(
                                      widget.person.id,
                                      _nameController.text.trim(),
                                      _ageController.text.trim(),
                                      _medicalController.text.trim())
                                  .toMap())
                              .then((value) {
                            db
                                .updatePerson(Person(
                                    widget.person.id,
                                    _nameController.text.trim(),
                                    _ageController.text.trim(),
                                    _medicalController.text.trim()))
                                .then((retValue) {
                              if (!retValue) {
                                print(
                                    "General meeting of such id ${widget.person.id} doesnt exist");
                              }
                              Navigator.pop(context);
                            });
                          });
                        }
                      } else {
                        // Creating a new note
                        db
                            .createPerson(
                                _nameController.text.trim(),
                                _ageController.text.trim(),
                                _medicalController.text.trim())
                            .then((Person n) {
                          // The next two lines are executed when this page is called from meeting notes page as meetingUid != null then
                          if (widget.userUid != null) {
                            print(n.id);
                            Firestore.instance
                                .collection("users")
                                .document(widget.userUid)
                                .collection("person")
                                .document(n.id)
                                .setData(n.toMap());
                          }
                          Navigator.pop(context);
                        });
                      }
                    },
                    color: Color(0xFF183E8D),
                    child: (widget.person.id != null)
                        ? Text('Update',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white))
                        : Text('Add',
                            style:
                                TextStyle(fontSize: 20.0, color: Colors.white)),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0)),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
