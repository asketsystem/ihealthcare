import 'package:flutter/material.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: Center(
        child: Container(
          child: Text('Faq'),
        ),
      ),
    );
  }
}
