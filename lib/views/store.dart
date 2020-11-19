import 'package:flutter/material.dart';
import 'package:credenstore/components/material_app_custom.dart';

class Store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget _body = Text("new body store");
    return MaterialAppCustom(body: _body);
  }
}