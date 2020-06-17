import 'package:firebase_database/firebase_database.dart';

class People {
  String _id;
  String _name;
  String _medical;
  String _age;
  String _photoUrl;

  People(this._name, this._medical, this._age, this._photoUrl);
  People.withId(this._id, this._name, this._medical, this._age, this._photoUrl);

  //Adding Getters
  String get id => _id;
  String get name => _name;
  String get medical => _medical;
  String get age => _age;
  String get photoUrl => this._photoUrl;

  //Adding Setters
  set name(String name) {
    this._name = name;
  }

  set medical(String medical) {
    this._medical = medical;
  }

  set age(String age) {
    this._age = age;
  }

  set photoUrl(String photoUrl) {
    this._photoUrl = photoUrl;
  }

  People.fromSnapshot(DataSnapshot snapshot) {
    this._id = snapshot.key;
    this._name = snapshot.value['name'];
    this._medical = snapshot.value['medical'];
    this._age = snapshot.value['age'];
    this._photoUrl = snapshot.value['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "medical": _medical,
      "age": _age,
      "photoUrl": _photoUrl,
    };
  }
}
