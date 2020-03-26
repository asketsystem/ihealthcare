import 'package:flutter/material.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: Center(
        child: Container(
          child: Text('Map Page'),
        ),
      ),
    );
  }
}
