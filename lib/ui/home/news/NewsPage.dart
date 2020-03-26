import 'package:flutter/material.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: Container(
        child: Center(child: Text('News Page')),
      ),
    );
  }
}
