import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:credenstore/components/tappable_card.dart';

void main() => runApp(Credenstore());

class Credenstore extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return App();
  }
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  Icon themeIcon = Icon(Icons.brightness_4);
  String themeMode = 'light';
  ThemeMode _themeMode = ThemeMode.light;

  // custom functions
  MaterialColor _createMaterialColor(Color color) {
    List strengths = <double>[.05];
    Map swatch = <int, Color>{};
    final int r = color.red, g = color.green, b = color.blue;

    for (int i = 1; i < 10; i++) {
      strengths.add(0.1 * i);
    }
    strengths.forEach((strength) {
      final double ds = 0.5 - strength;
      swatch[(strength * 1000).round()] = Color.fromRGBO(
        r + ((ds < 0 ? r : (255 - r)) * ds).round(),
        g + ((ds < 0 ? g : (255 - g)) * ds).round(),
        b + ((ds < 0 ? b : (255 - b)) * ds).round(),
        1,
      );
    });
    return MaterialColor(color.value, swatch);
  }

  void _launchPaypal() async {
    const url = 'https://paypal.me/shrinathprabhu';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _toggleTheme() {
    setState(() {
      if (themeMode == 'light') {
        themeMode = 'dark';
        themeIcon = Icon(Icons.brightness_7);
        _themeMode = ThemeMode.dark;
      } else {
        themeMode = 'light';
        themeIcon = Icon(Icons.brightness_4);
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Credenstore',
      themeMode: _themeMode,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: _createMaterialColor(Color(0xFF35495E)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: _createMaterialColor(Color(0xFF35495E)),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Row(children: <Widget>[
            Padding(
                padding: EdgeInsets.only(right: 10),
                child: Image(
                  image: AssetImage("assets/images/logo.png"),
                  height: 25,
                )),
            Text("Credenstore"),
          ]),
          actions: <Widget>[
            Tooltip(
              message: "Buy me a coffee",
              child: IconButton(
                icon: Icon(Icons.payments),
                color: Colors.white,
                onPressed:
                    _launchPaypal, // This trailing comma makes auto-formatting nicer for build methods.
              ),
            ),
            Tooltip(
              message: "Change theme",
              child: IconButton(
                icon: themeIcon,
                color: Colors.white,
                onPressed:
                    _toggleTheme, // This trailing comma makes auto-formatting nicer for build methods.
              ),
            ),
          ],
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TappableCard(title: "Store", icon: Icons.lock),
              Padding(
                padding: EdgeInsets.only(top: 30),
              ),
              TappableCard(title: "Retrieve", icon: Icons.vpn_key)
            ],
          ),
        ),
      ),
    );
  }
}
