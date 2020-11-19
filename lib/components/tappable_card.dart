import 'package:flutter/material.dart';

class TappableCard extends StatelessWidget {
  String title;
  IconData icon;
  String themeMode = 'light';
  Color _cardBorder = Colors.black;
  Widget routeTo;
  TappableCard(
      {Key key,
      @required this.title,
      @required this.icon,
      this.themeMode,
      @required this.routeTo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        height: 200,
        width: 200,
        child: Card(
            semanticContainer: true,
            shape: RoundedRectangleBorder(
                side: BorderSide(color: _cardBorder),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(2),
                  bottomLeft: Radius.circular(2),
                  bottomRight: Radius.circular(30),
                )),
            elevation: 2,
            child: Center(
                child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 30),
                ),
                Icon(
                  icon,
                  color: Color(0xFF53B883),
                  size: 100,
                ),
                Text(title),
              ],
            ))),
      ),
      onTap: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => routeTo),
      ),
    );
  }
}
