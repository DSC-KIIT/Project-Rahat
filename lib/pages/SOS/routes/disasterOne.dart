import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rahat/custom_widgets/google_add.dart';

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

  // ignore: avoid_init_to_null
  int _selectedIndex = null;
  bool selected = false;

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  List<DocumentSnapshot> people = <DocumentSnapshot>[];

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
                            for (var i = 1;
                                i < snapshot.data.documents.length;
                                i++) people.add(snapshot.data.documents[i]);
                            return details == null
                                ? Center(child: Text("Loading..."))
                                // : Container(
                                //     color: _selectedIndex != null &&
                                //             _selectedIndex == index
                                //         ? Colors.red
                                //         : Colors.white,
                                //     child: ListTile(
                                //       title: Text(
                                //         details["name"],
                                //         style: TextStyle(color: Colors.black),
                                //       ),
                                //       onTap: () => _onSelected(index),
                                //     ),
                                //   );
                                : ListTile(
                                    onTap: () {
                                      setState(() {
                                        people[index].selected =
                                            !people[index].selected;
                                      });
                                    },
                                    selected: people[index].selected,
                                    title: Text(details["name"]),
                                    trailing: (people[index].selected)
                                        ? Icon(Icons.check_box)
                                        : Icon(Icons.check_box_outline_blank),
                                  );
                          });
                    }),
              ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_forward),
        onPressed: () {},
      ),
    );
  }
}

class People {
  bool selected = false;
}
