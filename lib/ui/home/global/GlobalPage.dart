import 'package:flutter/material.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: Container(
        child: Text('Global Page'),
      ),
    );
  }
}
