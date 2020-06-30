import 'package:flutter/material.dart';


class FLOOD extends StatefulWidget {
  @override
  _FLOODState createState() => _FLOODState();
}

class _FLOODState extends State<FLOOD> {
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 170,
                  width: 170,
                  child: Image.asset('assets/images/sos/floodreal.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                'FLOOD',
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
                    ' - Turn off gas valves fed to appliances, water valves and the electricity on the main fuse box.',
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
                    ' - To prevent sewage backups, put sandbags in the toilet and obstructions on drain holes.',
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
                    ' - Sop up and extract intruding waters when possible.',
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
                    ' - Strong ropes and a well equipped First Aid Kit can greatly enhance rescue efforts.',
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
                    '- Don’t use open flames in the presence of gas, propane or natural gas. Use flashlights.',
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
                    ' - Watch out for and don’t approach downed power lines.',
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
                    ' - Touching or approaching wet, plugged-in electronics can lead to electrocution.',
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
                    ' - Don’t drive through floodwaters. If stuck, exit the car and move to higher ground.',
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
