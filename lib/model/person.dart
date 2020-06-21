class Person {
  String _id;
  String _name;
  String _age;
  String _medical;

  Person(this._id, this._name, this._age, this._medical);

  Person.map(dynamic obj) {
    this._id = obj['id'];
    this._name = obj['name'];
    this._age = obj['age'];
    this._medical = obj['medical'];
  }
 
  String get id => _id;
  String get name => _name;
  String get age => _age;
  String get medical => _medical;
 
  Map<String, dynamic> toMap() {
    var map = new Map<String, dynamic>();
    if (_id != null) {
      map['id'] = _id;
    }
    map['name'] = _name;
    map['age'] = _age;
    map['medical'] = medical;
 
    return map;
  }
 
  Person.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._name = map['name'];
    this._age = map['age'];
    this._medical = map['medical'];
  }
}