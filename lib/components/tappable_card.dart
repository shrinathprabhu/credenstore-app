import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  String title;
  IconData icon;
  TappableCard({Key key, @required this.title, @required this.icon}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 200,
        width: 200,
        child: Card(
          semanticContainer: true,
            elevation: 2,
            child: Center( child: Column(
              children: [
                Padding(padding: EdgeInsets.only(top: 30),),
                Icon(icon, color: Color(0xFF53B883),size: 100,),
                Text(title),
              ],
            ))
        ),
      ),
      onTap: () => print("Tapped " + title),
    );
  }
}
