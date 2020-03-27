import 'package:flutter/material.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';
import 'package:go_away_covid19/util/StyleUtil.dart';

class FaqPage extends StatefulWidget {
  @override
  _FaqPageState createState() => _FaqPageState();
}

class _FaqPageState extends State<FaqPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {},
            child: getSingleFaqView('How it spreads?',
                'Learn how Covid-19 spreads', 'images/faq_howitspreads.png'),
          ),
          InkWell(
            onTap: () {},
            child: getSingleFaqView('Symptoms',
                'Learn Covid-19 symptoms', 'images/faq_symptoms.png'),
          ),
          InkWell(
            onTap: () {},
            child: getSingleFaqView('Protect yourself',
                'Learn to protect others', 'images/faq_protectyourself.png'),
          ),
          InkWell(
            onTap: () {},
            child: getSingleFaqView('Media resources',
                'Visit to get the resources', 'images/faq_mediaresources.png'),
          ),
          InkWell(
            onTap: () {},
            child: getSingleFaqView('Myth busters',
                'WHO advice for public', 'images/faq_mythbusters.png'),
          ),
        ],
      ),
    );
  }

  Widget getSingleFaqView(String title, String subtitle, String imageSrc) {
    return Container(
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      height: 100,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 15.0,
            ),
          ]),
      child: Row(
        children: <Widget>[
          SizedBox(
            width: 30,
          ),
          Container(
            width: 60,
            height: 60,
            child: Image.asset(
              imageSrc,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          Container(
            height: 40,
            child: Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    title,
                    textAlign: TextAlign.left,
                    style: getFaqTitleStyle(),
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    subtitle,
                    style: getFaqSubtitleStyle(),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
