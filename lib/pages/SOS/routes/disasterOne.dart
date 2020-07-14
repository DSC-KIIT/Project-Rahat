import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DisasterOne extends StatefulWidget {
  DisasterOne({this.uid});

  final String uid;
  @override
  _DisasterOneState createState() => _DisasterOneState();
}

class _DisasterOneState extends State<DisasterOne> {
  bool _isChecked = true;
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1.0,
          title: appLogo,
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: widget.uid == null
              ? Center(child: Text('Loading...'))
              : Container(
                  child: StreamBuilder(
                      stream: Firestore.instance
                          .collection("users")
                          .document(widget.uid)
                          .collection("person")
                          .snapshots(),
                      builder: (context, snapshot) {
                        return ListView.builder(
                            itemCount: snapshot.data.documents.length,
                            itemBuilder: (context, index) {
                              DocumentSnapshot details =
                                  snapshot.data.documents[index];
                              return details == null
                                  ? Center(child: Text("Loading..."))
                                  : CheckboxListTile(
                                      value: _isChecked,
                                      onChanged: (val) {
                                        setState(() {
                                          _isChecked = val;
                                        });
                                      },
                                      title: Text(
                                        details["name"],
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 20),
                                      ),
                                    );
                            });
                      }),
                ),
        ));
  }
}
