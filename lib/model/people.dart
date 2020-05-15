import 'package:firebase_database/firebase_database.dart';

class People {
  String _id;
  String _name;
  String _phone;
  String _age;
  String _photoUrl;

  People(this._name, this._phone, this._age, this._photoUrl);
  People.withId(this._id, this._name, this._phone, this._age, this._photoUrl);

  //Adding getters
  String get id => this._id;
  String get name => this._name;
  String get phone => this._phone;
  String get age => this._age;
  String get photoUrl => this._photoUrl;

  //Adding Setters
  set firstName(String name) {
    this._name = name;
  }

  set phone(String phone) {
    this._phone = phone;
  }

  set address(String age) {
    this._age = age;
  }

  set photoUrl(String photoUrl) {
    this._photoUrl = photoUrl;
  }

  People.fromSnapshot(DataSnapshot snapshot) {
    this._id = snapshot.key;
    this._name = snapshot.value['name'];
    this._phone = snapshot.value['phone'];
    this._age = snapshot.value['age'];
    this._photoUrl = snapshot.value['photoUrl'];
  }

  Map<String, dynamic> toJson() {
    return {
      "name": _name,
      "phone": _phone,
      "age": _age,
      "photoUrl": _photoUrl,
    };
  }
}
