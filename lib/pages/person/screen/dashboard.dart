import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:rahat/custom_widgets/google_add.dart';
import 'package:rahat/model/person.dart';
import 'package:rahat/pages/person/screen/addPerson.dart';
import 'package:rahat/pages/person/services/firebase.dart';

class AccountPage extends StatefulWidget {
  AccountPage({this.uid});

  final String uid;

  @override
  _AccountPageState createState() => new _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  List<Person> items;
  StreamSubscription<QuerySnapshot> notePerson;

  List<Color> colors = [
    Color(0xFFfd6b58),
    Color(0xFF407BFE),
    Color(0xFF45C7FE),
    Color(0xFF645FB3),
    Color(0xFF7D9EE8),
    Color(0xFFFF3661),
    Color(0xFF088BA2),
    Colors.black87,
  ];

  Stream<QuerySnapshot> getPersonList({int offset, int limit}) {
    Stream<QuerySnapshot> snapshots = Firestore.instance
        .collection("users")
        .document(widget.uid)
        .collection("person")
        .getDocuments()
        .asStream();
    if (offset != null) {
      snapshots = snapshots.skip(offset);
    }
    if (limit != null) {
      snapshots = snapshots.take(limit);
    }
    return snapshots;
  }

  void populatePerson() async {
//    QuerySnapshot docs = await Firestore.instance.collection("meetings").document(widget.uid).collection("notes").getDocuments();
//    var documents = docs.documents;
//    final List<Note> notes = new List();
//    documents.forEach((element) {
//      notes.add(Note.fromMap(element.data));
//      print(element.data);
//    });
//    setState(() {
//      this.items = notes;
//    });
    notePerson = getPersonList().listen((QuerySnapshot snapshot) {
      final List<Person> notes = snapshot.documents
          .map((documentSnapshot) => Person.fromMap(documentSnapshot.data))
          .toList();

      setState(() {
        this.items = notes;
        // print(items);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    items = new List();
    notePerson?.cancel();
    populatePerson();
  }

  @override
  void dispose() {
    notePerson?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('People'),
        centerTitle: true,
      ),
      body: StreamBuilder(
        stream: Firestore.instance
            .collection("users")
            .document(widget.uid)
            .collection("person")
            .snapshots(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data.documents.length,
            itemBuilder: (context, index) {
              DocumentSnapshot details = snapshot.data.documents[index];
              return GestureDetector(
                onTap: () {},
                onLongPress: () {
                  deletePerson(snapshot.data.documents[index].documentID);
                },
                child: Card(
                  elevation: 3.0,
                  child: ListTile(
                    title: Text(
                      details["name"],
                      style: TextStyle(color: Colors.black),
                    ),
                    subtitle: Text(details["age"]),
                  ),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: CustomPaint(
            child: Container(),
            foregroundPainter: FloatingPainterGButton(),
          ),
          onPressed: () => _createNewPerson(context)),
    );
  }

  // void _deleteNote(BuildContext context, Person person, int position) async {
  //   final TransactionHandler deleteTransaction = (Transaction tx) async {
  //     final DocumentSnapshot ds = await Firestore.instance
  //         .collection("user")
  //         .document(widget.uid)
  //         .collection("notes")
  //         .document(person.id)
  //         .get();
  //     await tx.delete(ds.reference);
  //     return {'deleted': true};
  //   };
  //   Firestore.instance.runTransaction(deleteTransaction).then((result) {
  //     print(result);
  //   }).catchError((error) {
  //     print("Error : $error");
  //   });
  //   setState(() {
  //     items.removeAt(position);
  //   });
  // }

  void _navigateToUpdatePerson(BuildContext context, Person person) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => AddScreen(person, widget.uid)),
    ).then((value) {
      populatePerson();
    });
  }

  void _createNewPerson(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) =>
              AddScreen(Person(null, '', '', ''), widget.uid)),
    ).then((value) {
      populatePerson();
    });
  }

  //var _tapPosition;

  // void _showCustomMenu(Person person, int index) async {
  //   final RenderBox overlay = Overlay.of(context).context.findRenderObject();
  //   int delta = await showMenu(
  //     context: context,
  //     position: RelativeRect.fromRect(
  //       _tapPosition & Size(20, 20),
  //       Offset.zero & overlay.semanticBounds.size,
  //     ),
  //     items: <PopupMenuEntry<int>>[
  //       PopupMenuItem(child: Icon(Icons.edit), value: 1),
  //       PopupMenuItem(child: Icon(Icons.delete), value: 2),
  //     ],
  //   );
  //   if (delta == null) {
  //     return;
  //   }
  //   navigateToPage(context, person, delta, index);
  // }

  // void navigateToPage(
  //     BuildContext context, Person person, int value, int index) {
  //   if (value == 1) {
  //     _navigateToUpdatePerson(context, person);
  //   } else {
  //     print(index);
  //     _deleteNote(context, person, index);
  //   }
  // }

  // void _storePosition(TapDownDetails details) {
  //   _tapPosition = details.globalPosition;
  // }

  Future<dynamic> deletePerson(String id) async {
    final FirebaseUser user = await FirebaseAuth.instance.currentUser();
    final userid = user.uid;
    final CollectionReference myCollection = Firestore.instance
        .collection('users')
        .document(widget.uid)
        .collection('person');

    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await tx.get(myCollection.document(id));

      await tx.delete(ds.reference);
      return {'deleted': true};
    };

    return Firestore.instance
        .runTransaction(deleteTransaction)
        .then((result) => result['deleted'])
        .catchError((error) {
      print('error: $error');
      return false;
    });
  }
}
