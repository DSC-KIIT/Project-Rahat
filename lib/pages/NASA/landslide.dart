import 'package:flutter/material.dart';
import 'package:rahat/pages/person/screen/dashboard.dart';

class LANDSLIDE extends StatefulWidget {
  @override
  _LANDSLIDEState createState() => _LANDSLIDEState();
}

class _LANDSLIDEState extends State<LANDSLIDE> {
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
                  child: Image.asset('assets/images/sos/real_disaster.png'),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                'LANDSLIDE',
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
                    ' - Move away from landslide path or downstream valleys quickly without wasting time.',
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
                    ' - Stay alert, awake and active (3A\'s) during the impact or probability of impact.',
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
                    ' - Keep drains clean and keep water holes open.',
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
                    ' - Locate and go to shelters and Check for injured and trapped persons.',
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
                    '-Do not panic and loose energy by crying and go near drainage path.',
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
                    ' - Do not touch or walk over loose material and electrical wiring or pole.',
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
                    ' - Do not move an injured person without rendering first aid unless important.',
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
