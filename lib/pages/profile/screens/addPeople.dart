import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:path/path.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rahat/model/people.dart';

class AddPeople extends StatefulWidget {
  final String userName;
  AddPeople(this.userName);
  @override
  _AddPeopleState createState() => _AddPeopleState(userName);
}

class _AddPeopleState extends State<AddPeople> {
  String userName;
  _AddPeopleState(userName);

  FirebaseUser user;
  DatabaseReference _databaseReference =
      FirebaseDatabase.instance.reference().child('Users');

  String _name = '';
  String _phone = '';
  String _age = '';
  String _photoUrl = "empty";

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
    return Container();
  }
}
