import 'package:flutter/material.dart';


class EARTHQUAKE extends StatefulWidget {
  @override
  _EARTHQUAKEState createState() => _EARTHQUAKEState();
}

class _EARTHQUAKEState extends State<EARTHQUAKE> {
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
      body: Container(
        color: Colors.grey,
        child: Column(
          children: <Widget>[
            Center(
              child: Container(
                  height: 190,
                  width: 190,
                  child: Image.asset('assets/images/sos/earthquakereal1.png')),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                'EARTHQUAKE',
                style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 20,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 328.0),
                  child: Text(
                    'DO\'S :-',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    ' - Take cover by getting under a sturdy table or other piece of furnitures.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 40.0, left: 3.0),
                  child: Text(
                    ' - Stay away from glass, windows, outside doors and walls.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 3.0, right: 115.0),
                  child: Text(
                    ' - Hold on and protect your head with a pillow.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 3.0,
                    right: 110.0,
                  ),
                  child: Text(
                    ' - Move away from tall building, trees and utility wires.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, right: 300.0),
                  child: Text(
                    'DONT\'S :-',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 3.0),
                  child: Text(
                    '- Don\'t run around here and there, coming out of your houses, building.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 40.0, left: 3.0),
                  child: Text(
                    ' - Never near a tree, or a building or a structure that might collapse.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 6.0, left: 3.0, right: 115.0),
                  child: Text(
                    ' - If trapped under debris, do not light a match .',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8.0,
                    left: 3.0,
                    right: 110.0,
                  ),
                  child: Text(
                    ' - Don\'t be on the stairs, or under them in a quake.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
