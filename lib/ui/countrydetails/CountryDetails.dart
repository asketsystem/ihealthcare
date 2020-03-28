import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_away_covid19/models/RpUserCountry.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';
import 'package:go_away_covid19/util/StyleUtil.dart';

class CountryDetails extends StatefulWidget {

  RpUserCountryData userCountryData;

  CountryDetails({this.userCountryData});

  @override
  _CountryDetailsState createState() => _CountryDetailsState();
}

class _CountryDetailsState extends State<CountryDetails> {

  RpUserCountryData userCountryData;

  @override
  void initState() {
    super.initState();
    userCountryData = widget.userCountryData;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        brightness: Brightness.light,
        iconTheme: IconThemeData(
          color: getPrimaryColor(),
        ),
        backgroundColor: getPageBackgroundColor(),
        title: Text('${userCountryData.country.toUpperCase()}', style: getPageTitleTextStyle(14),),
      ),
      body: Column(
        children: <Widget>[
          getUserCountryStats()
        ],
      ),
    );
  }

 Widget getUserCountryStats() {
    return Container(
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              blurRadius: 15.0,
            ),
          ]),
      child: Column(
        children: <Widget>[
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              margin: EdgeInsets.only(left: 25, top: 16),
              child:  Container(
                height: 20,
                width: 30,
                child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    placeholder: (context, url) => Container(
                      color: Colors.grey[200],
                    ),
                    errorWidget: (context, url, error) => Container(
                        color: Colors.grey.withOpacity(0.2),
                        child: Center(
                            child: Icon(
                              Icons.broken_image,
                              size: 50.0,
                              color: Colors.grey.withOpacity(0.5),
                            ))),
                    imageUrl: "${userCountryData.countryInfo.flag}"),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 30, bottom: 20),
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 25,
                ),
                Column(
                  children: <Widget>[
                    Text(
                      '${userCountryData.cases}',
                      style: getWorldWideCountdownNumberStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Confirmed',
                      style: getConfirmedRecoveredTextStyle(),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Text(
                      '${userCountryData.recovered}',
                      style: getWorldWideCountdownNumberStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Recovered',
                      style: getConfirmedRecoveredTextStyle(),
                    ),
                  ],
                ),
                Spacer(),
                Column(
                  children: <Widget>[
                    Text(
                      '${userCountryData.deaths}',
                      style: getDeathCountdownNumberStyle(),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Death',
                      style: getDeathTitleTextStyle(),
                    ),
                  ],
                ),
                SizedBox(
                  width: 25,
                ),
              ],
            ),
          )
        ],
      ),
    );
 }
}
