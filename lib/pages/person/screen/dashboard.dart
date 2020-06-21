import 'package:flutter/material.dart';

import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:rahat/custom_widgets/google_add.dart';
import 'package:rahat/model/person.dart';
import 'package:rahat/pages/person/screen/personTile.dart';
import 'package:rahat/pages/person/screen/addPerson.dart';
import 'package:rahat/pages/person/screen/displayPerson.dart';

class MeetingNotePage extends StatefulWidget {
  MeetingNotePage({this.uid});

  String uid;

  @override
  _MeetingNotePageState createState() => new _MeetingNotePageState();
}

class _MeetingNotePageState extends State<MeetingNotePage> {
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
    Stream<QuerySnapshot> snapshots = Firestore.instance.collection("users").document(widget.uid).collection("notes").getDocuments().asStream();
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
        print(items);
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
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: StaggeredGridView.countBuilder(
          primary: false,
          mainAxisSpacing: 6.0,
          crossAxisSpacing: 6.0,
          crossAxisCount: 4,
          itemCount: items.length,
          itemBuilder: (context, index) => GestureDetector(
            onLongPress: (){
              _showCustomMenu(items[index], index);
            },
            onTapDown: _storePosition,
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => DisplayPerson(
                    name: items[index].name,
                    age: items[index].age,
                  )));
            },
            child: MyTile(
              name: items[index].name,
              age: items[index].age,
              color: colors[index % colors.length],
            ),
          ),
          staggeredTileBuilder: (index) => StaggeredTile.fit(2),
        ),
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

  void _deleteNote(BuildContext context, Person person, int position) async {
    final TransactionHandler deleteTransaction = (Transaction tx) async {
      final DocumentSnapshot ds = await Firestore.instance.collection("user").document(widget.uid).collection("notes").document(person.id).get();
      await tx.delete(ds.reference);
      return {'deleted' : true};
    };
    Firestore.instance.runTransaction(deleteTransaction).then((result){
      print(result);
    }).catchError((error){
      print("Error : $error");
    });
    setState(() {
      items.removeAt(position);
    });
  }

  void _navigateToUpdatePerson(BuildContext context, Person person) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(person, widget.uid)),
    ).then((value){
      populatePerson();
    });
  }

  void _createNewPerson(BuildContext context) async {
    await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NoteScreen(Person(null, '', '', ''), widget.uid)),
    ).then((value){
      populatePerson();
    });
  }

  var _tapPosition;

  void _showCustomMenu(Person person, int index) async {
    final RenderBox overlay = Overlay.of(context).context.findRenderObject();
    int delta = await showMenu(
      context: context,
      position: RelativeRect.fromRect(
        _tapPosition & Size(20,20),
        Offset.zero & overlay.semanticBounds.size,
      ),
      items: <PopupMenuEntry<int>>[
        PopupMenuItem(child: Icon(Icons.edit), value: 1),
        PopupMenuItem(child: Icon(Icons.delete), value: 2),
      ],
    );
    if(delta == null){
      return;
    }
    navigateToPage(context, person, delta, index);
  }

  void navigateToPage(BuildContext context, Person person, int value, int index){
    if(value == 1){
      _navigateToUpdatePerson(context, person);
    }else{
      print(index);
      _deleteNote(context, person, index);
    }
  }

  void _storePosition(TapDownDetails details) {
    _tapPosition = details.globalPosition;
  }
}
