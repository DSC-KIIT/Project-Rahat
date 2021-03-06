import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:rahat/auth/googleAuth.dart';
import 'package:rahat/news/newshome.dart';
import 'package:rahat/pages/NASA/nasaPage.dart';
import 'package:rahat/pages/SOS/sosPage.dart';
import 'package:rahat/pages/emergency.dart';
import 'package:rahat/pages/person/screen/dashboard.dart';
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

  // Getting the User
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
      image: new ExactAssetImage("assets/images/rahatori.png"),
      height: 100.0,
      width: 100.0,
      alignment: FractionalOffset.center);

  //UI part
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
            ? ListView(
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
                        backgroundImage:
                            AssetImage("assets/images/mascot.png")),
                  ),
                  ListTile(
                    title: Text("Profile"),
                    trailing: Icon(FontAwesomeIcons.user),
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return AccountPage(uid: user.uid);
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("NASA Portal"),
                    trailing: Icon(FontAwesomeIcons.rocket),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NasaPage();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("News"),
                    trailing: Icon(FontAwesomeIcons.newspaper),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NEWS();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Emergency'),
                    trailing: Icon(FontAwesomeIcons.firstAid),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return EMERGENCY();
                      }));
                    },
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
                  ),
                ],
              )
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
                            : AssetImage("assets/images/rahatori.png")),
                  ),
                  ListTile(
                    title: Text("Profile"),
                    trailing: Icon(FontAwesomeIcons.user),
                    onTap: () {
                      Navigator.of(context)
                          .push(new MaterialPageRoute(builder: (context) {
                        return AccountPage(uid: user.uid);
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("NASA Portal"),
                    trailing: Icon(FontAwesomeIcons.rocket),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NasaPage();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text("News"),
                    trailing: Icon(FontAwesomeIcons.newspaper),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return NEWS();
                      }));
                    },
                  ),
                  ListTile(
                    title: Text('Emergency'),
                    trailing: Icon(FontAwesomeIcons.firstAid),
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return EMERGENCY();
                      }));
                    },
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
                  ),
                ],
              ),
      ),
      body: !isSignedIn
          ? Center(child: Image.asset('assets/gif/animator.gif'))
          : Column(
              children: <Widget>[
                !isSignedIn
                    ? Center(child: CircularProgressIndicator())
                    : Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width,
                          //color: Colors.grey,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                'assets/images/weather.jpeg',
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: temperature == null
                              ? FlatButton(
                                  onPressed: () async {
                                    var weatherData =
                                        await weather.getLocationWeather();
                                    updateUI(weatherData);
                                  },
                                  child: Text(
                                    'Click to check weather',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Center(
                                  child: Text(
                                    '$temperature °C\n$cityName $weatherIcon\n${user.displayName}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                        ),
                      ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        new MaterialPageRoute(
                          builder: (BuildContext context) {
                            return NasaPage();
                          },
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 180.0,
                        width: MediaQuery.of(context).size.width,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/nasa.png',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.all(56.0),
                    child: ClipOval(
                      child: Material(
                        color: Colors.red, // button color
                        child: GestureDetector(
                          child: InkWell(
                            splashColor: Colors.red, // inkwell color
                            child: SizedBox(
                              width: 130.0,
                              height: 130.0,
                              child: Center(
                                child: Text(
                                  'SOS',
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 40.0,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                            onTap: () {
                              Navigator.of(context).push(
                                new MaterialPageRoute(
                                  builder: (BuildContext context) {
                                    return SOSPage(uid: user.uid);
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }
}
