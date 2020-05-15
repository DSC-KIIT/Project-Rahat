import 'package:flutter/material.dart';

class ViewPeople extends StatefulWidget {
  final String id;
  ViewPeople(this.id);
  @override
  _ViewPeopleState createState() => _ViewPeopleState(id);
}

class _ViewPeopleState extends State<ViewPeople> {

  String id;
  _ViewPeopleState(this.id);
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
