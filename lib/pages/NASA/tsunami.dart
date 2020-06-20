import 'package:flutter/material.dart';
import 'package:rahat/pages/profile/services/account.dart';

class TSUNAMI extends StatefulWidget {
  @override
  _TSUNAMIState createState() => _TSUNAMIState();
}

class _TSUNAMIState extends State<TSUNAMI> {
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
                  child: Image.asset('assets/images/sos/tsunamireal.jpg'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                'TSUNAMI',
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
                  padding: const EdgeInsets.only(left: 2.0, right: 100.0),
                  child: Text(
                    ' - Know where the nearest tsunami escape route is.',
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
                    ' - Move in an orderly, calm and safe manner to the evacuation site .',
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
                    ' - Listen to radio or Television to get latest emergency information.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 5.0,
                    left: 3.0,
                    right: 110.0,
                  ),
                  child: Text(
                    ' - If you hear a tsunami warning, move at once to higher ground.',
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
                  padding: const EdgeInsets.only(
                    left: 3.0,
                    right: 100.0,
                  ),
                  child: Text(
                    ' - Do not Rush to the beach to see the big wave.',
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
                    ' - Stop to pack your most cherished possessions to take with you.',
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
                    ' - Do not Hop in your car to get to higher ground.',
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
                    ' - Do not eat food that has come in contact with flood water, it may be contaminated.',
                    style: TextStyle(
                      fontSize: 14.1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                SizedBox(height: 8.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 5.0),
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AccountsPage()));
                          {}
                        },
                        child: Container(
                          color: Colors.orange,
                          height: 45.0,
                          width: 320.0,
                          child: Center(
                            child: Text(
                              'NEXT',
                              style: TextStyle(
                                fontSize: 25.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
