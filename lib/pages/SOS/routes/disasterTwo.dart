import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rahat/pages/SOS/itemPage.dart';

class DisasterTwo extends StatefulWidget {
  DisasterTwo({this.uid});

  final String uid;
  @override
  _DisasterTwoState createState() => _DisasterTwoState();
}

class _DisasterTwoState extends State<DisasterTwo> {
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);

  Color _cardColor = Colors.black;
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
                                : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      if(_cardColor == Colors.green)
                                        _cardColor = Colors.black;
                                      else
                                        _cardColor = Colors.green;
                                    });
                                  },
                                    child: Card(
                                      color: _cardColor,
                                      elevation: 3.0,
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: ListTile(
                                          title: Text(
                                            details["name"],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 20),
                                          ),
                                          subtitle: Row(
                                            children: <Widget>[
                                              Text(details["age"],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 15))
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                          });
                    }),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return ItemPage();
          }));
        },
      ),
    );
  }
}
