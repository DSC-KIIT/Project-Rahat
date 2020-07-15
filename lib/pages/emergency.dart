import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahat/pages/homePage.dart';

class EMERGENCY extends StatefulWidget {
  @override
  _EMERGENCYState createState() => _EMERGENCYState();
}

class _EMERGENCYState extends State<EMERGENCY> {
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
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(26.0),
              child: Container(
                child: Center(
                  child: Text(
                    'EMERGENCY NUMBERS-',
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            Text(
              'DISASTER MANAGEMENT SERVICES',
              style: TextStyle(
                fontSize: 20.0,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '108',
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Center(
              child: Text(
                'EARTHQUAKE / FLOOD / DISASTER',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '011-24363260',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'NDRF HELPLINE NUMBER',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '9711077372',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: Text(
                'NATIONAL EMERGENCY NUMBER',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: RichText(
                text: TextSpan(
                  style: Theme.of(context).textTheme.body1,
                  children: [
                    WidgetSpan(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Icon(
                          FontAwesomeIcons.phone,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                    TextSpan(
                      text: '112',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Divider(
              color: Colors.black26,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        child: Icon(Icons.arrow_forward),
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
            return HomePage();
          }));
        },
      ),
    );
  }
}
