import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var temp;
  var description;
  var current;
  var humidity;
  var windspeed;

  Future getWeather() async {
    http.Response response = await http.get(
        "http://api.openweathermap.org/data/2.5/weather?q=Lucknow&appid=306d14f15425e44b216238fbb32578e5");
    var results = jsonDecode(response.body);
    setState(() {
      this.temp = results['main']['temp'];
      this.description = results['weather'][0]['description'];
      this.current = results['weather'][0]['main'];
      this.humidity = results['main']['humidity'];
      this.windspeed = results['wind']['speed'];
    });
  }

  @override
  void initState() {
    super.initState();
    this.getWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('WEATHER'),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Container(
              height: 200,
              width: MediaQuery.of(context).size.width,
              color: Colors.blueGrey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 1.0),
                    child: Text(
                      'Currently in Lucknow',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      temp != null ? temp.toString() + '\u00B0' : 'Loading',
                      style: TextStyle(color: Colors.white, fontSize: 40.0),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(),
                    child: Text(
                      current != null ? current.toString() : 'Loading',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: ListView(
                    children: <Widget>[
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.thermometerHalf,
                        ),
                        title: Text('Temperature'),
                        trailing: Text(
                          temp != null ? temp.toString() + '\u00B0' : 'Loading',
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.cloud,
                        ),
                        title: Text('Weather'),
                        trailing: Text(
                          description != null
                              ? description.toString()
                              : 'Loading',
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.sun,
                        ),
                        title: Text('Humidity'),
                        trailing: Text(
                          humidity != null ? humidity.toString() : 'Loading',
                        ),
                      ),
                      ListTile(
                        leading: FaIcon(
                          FontAwesomeIcons.wind,
                        ),
                        title: Text('WindSpeed'),
                        trailing: Text(
                          windspeed != null ? windspeed.toString() : 'Loading',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
