import 'package:flutter/material.dart';
import 'package:go_away_covid19/ui/home/HomePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Go Away Covid19',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Go Away')),
    );
  }
}
