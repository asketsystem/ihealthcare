import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:sentry_flutter/sentry_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ihealthcare/ui/countryselection/SelectCountry.dart';
import 'package:ihealthcare/ui/home/HomePage.dart';
// ignore: unused_import
import 'package:ihealthcare/util/ColorUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ui/countryselection/SelectCountry.dart';

Future<void> main() async {
  await SentryFlutter.init(
    (options) {
      options.dsn =
          'https://8d4b7a0c3a61468088136bb680b43620@o528379.ingest.sentry.io/5645701';
    },
    appRunner: () => runApp(MyApp()),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    return MaterialApp(
      title: 'ihealthcare',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration(seconds: 3),
      () {
        decideWhichPageToGo();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 100,
          child: Hero(
            tag: "ihealthcare",
            child: Image.asset('images/ihealthcare.png'),
          ),
        ),
      ),
    );
  }

  void decideWhichPageToGo() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    if (preferences.containsKey('userCountry')) {
      gotoHomePage();
    } else {
      gotoSelectCountryPage();
    }
  }

  void gotoHomePage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (
          _,
          __,
          ___,
        ) =>
            HomePage(),
      ),
    );
  }

  void gotoSelectCountryPage() {
    Navigator.pushReplacement(
      context,
      PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 800),
        pageBuilder: (
          _,
          __,
          ___,
        ) =>
            SelectCountry(),
      ),
    );
  }
}
