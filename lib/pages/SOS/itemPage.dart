import 'package:flutter/material.dart';
import 'package:rahat/pages/emergency.dart';

class ItemPage extends StatefulWidget {
  @override
  _ItemPageState createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  Image appLogo = new Image(
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);
  Color _iconColor = Colors.red;

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
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 15.0, bottom: 10.0),
            child: Container(
                alignment: Alignment.center,
                child: Text(
                  'LIST OF ITEMS',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.bold),
                )),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.018,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'BASIC',
                  style: TextStyle(fontSize: 20),
                )),
          ),
          Divider(thickness: 2.0),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                    child: Text(
                  'NAME',
                  style: TextStyle(fontSize: 15),
                )),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.45),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Text('QTY', style: TextStyle(fontSize: 15))),
              ),
            ],
          ),
          Divider(thickness: 2.0),
          Row(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Water'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Food'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Batteries'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Local Map'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Basic KIT'),
                    ),
                  ]),
              SizedBox(width: MediaQuery.of(context).size.width * 0.45),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('2'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('2'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('6'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('2'),
                    ),
                  ]),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  )
                ],
              )
            ],
          ),
          Divider(thickness: 2),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Container(
                alignment: Alignment.topLeft,
                child: Text('MEDICAL KIT', style: TextStyle(fontSize: 20))),
          ),
          Divider(thickness: 2.0),
          Row(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: Container(
                    child: Text(
                  'NAME',
                  style: TextStyle(fontSize: 15),
                )),
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.45),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    child: Text('QTY', style: TextStyle(fontSize: 15))),
              ),
            ],
          ),
          Divider(thickness: 2.0),
          Row(
            children: <Widget>[
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Water'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Food'),
                    ),
                  ]),
              SizedBox(width: MediaQuery.of(context).size.width * 0.52),
              Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('1'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('1'),
                    ),
                  ]),
              SizedBox(width: MediaQuery.of(context).size.width * 0.15),
              Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: GestureDetector(
                        onTap: () {
                          setState(() {
                            if (_iconColor == Colors.red)
                              _iconColor = Colors.green;
                            else
                              _iconColor = Colors.red;
                          });
                        },
                        child: Icon(
                          Icons.done,
                          size: 18.0,
                          color: _iconColor,
                        )),
                  )
                ],
              )
            ],
          ),
          Divider(
            thickness: 2.0,
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return EMERGENCY();
          }));
        },
      ),
    );
  }
}
