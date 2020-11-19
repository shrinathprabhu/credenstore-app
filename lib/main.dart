import 'package:flutter/material.dart';
import 'package:credenstore/components/material_app_custom.dart';
import 'package:credenstore/components/tappable_card.dart';
import 'package:credenstore/views/retrieve.dart';
import 'package:credenstore/views/store.dart';

void main() => runApp(Credenstore());

class Credenstore extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    Widget _body = Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          TappableCard(title: "Store", icon: Icons.lock, themeMode: 'light', routeTo: Store()),
          Padding(
            padding: EdgeInsets.only(top: 30),
          ),
          TappableCard(title: "Retrieve", icon: Icons.vpn_key, routeTo: Retrieve(),)
        ],
      ),
    );
    return MaterialAppCustom(body: _body);
  }
}

// class App extends StatefulWidget {
//   @override
//   _AppState createState() => _AppState();
// }
//
// class _AppState extends State<App> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
