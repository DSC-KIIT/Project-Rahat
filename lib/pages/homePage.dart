import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahat/auth/googleAuth.dart';
import 'package:rahat/weather/weather.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseUser user;
  bool isSignedIn = false;

  //Weather Fetching
  WeatherModel weather = WeatherModel();
  int temperature;
  String weatherIcon;
  String cityName;

  void updateUI(dynamic weatherData) async {
    setState(() {
      if (weatherData == null) {
        temperature = 0;
        weatherIcon = 'error';
        cityName = '';
        return;
      }
      temperature = weatherData['main']['temp'];
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
    });
  }

  checkAuthentication() async {
    _auth.onAuthStateChanged.listen((user) {
      if (user == null) {
        Navigator.of(context)
            .pushReplacement(MaterialPageRoute(builder: (context) {
          return GoogleAuth();
        }));
      }
    });
  }

  getUser() async {
    FirebaseUser firebaseUser = await _auth.currentUser();
    await firebaseUser?.reload();
    firebaseUser = await _auth.currentUser();

    if (firebaseUser != null) {
      setState(() {
        this.user = firebaseUser;
        this.isSignedIn = true;
      });
    }
  }

  signOut() async {
    _auth.signOut();
  }

  @override
  void initState() {
    super.initState();
    this.checkAuthentication();
    this.getUser();
    var weatherData = weather.getLocationWeather();
    updateUI(weatherData);
  }

  Image appLogo = new Image(
      image: new ExactAssetImage("assets/rahatori.png"),
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
      drawer: Drawer(
          child: !isSignedIn
              ? CircularProgressIndicator()
              : ListView(
                  children: <Widget>[
                    UserAccountsDrawerHeader(
                      accountName: Text(
                        '${user.displayName}',
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                      accountEmail: Text(
                        '${user.email}',
                        style: TextStyle(fontSize: 13, color: Colors.white),
                      ),
                      decoration: BoxDecoration(color: Color(0xFF183E8D)),
                      currentAccountPicture: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          radius: 50,
                          backgroundImage: user.photoUrl != null
                              ? NetworkImage(user.photoUrl)
                              : AssetImage("assets/rahatori.png")),
                    ),
                    ListTile(
                      title: Text("Profile"),
                      trailing: Icon(FontAwesomeIcons.user),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("NASA Portal"),
                      trailing: Icon(FontAwesomeIcons.rocket),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("News"),
                      trailing: Icon(FontAwesomeIcons.newspaper),
                      onTap: () {},
                    ),
                    ListTile(
                      title: Text("Logout"),
                      trailing: Icon(FontAwesomeIcons.signOutAlt),
                      onTap: () => signOut(),
                    ),
                    Divider(),
                    ListTile(
                      title: Text("Close"),
                      trailing: Icon(Icons.close),
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                )),
      body: !isSignedIn
          ? Center(child: CircularProgressIndicator())
          : Container(
              child: Text(
                "$temperature °C",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Roboto",
                  fontSize: 40,
                ),
              ),
            ),
    );
  }
}
