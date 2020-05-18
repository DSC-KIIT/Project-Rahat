class People {
  String _id;
  String _name;
  String _phone;
  String _age;

  People(this._id, this._name, this._phone, this._age);
  People.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._phone = obj['phone'];
    this._age = obj['age'];
  }

  //Adding Getters
  String get id => _id;
  String get name => _name;
  String get phone => _phone;
  String get age => _age;

  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['phone'] = _phone;
    map['age'] = _age;
    return map;
  }

  People.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._phone = map['phone'];
    this._age = map['age'];
  }
}
