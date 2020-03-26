import 'package:flutter/material.dart';
import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:go_away_covid19/network/Repository.dart';
import 'package:go_away_covid19/ui/home/global/GlobalBloc.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';
import 'package:go_away_covid19/util/ShimmerLoading.dart';
import 'package:go_away_covid19/util/StyleUtil.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  var _repository = Repository();
  var _userCountry = Location();
  var _userCountryLatest = Latest();

  @override
  void initState() {
    super.initState();
    bloc.getGlobalData();
  }

  @override
  void dispose() {
//    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _repository.getUserCountryData("BD").then((response) {
      _userCountryLatest = response.latest;
      _userCountry = response.locations[0];
    });

    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: StreamBuilder(
        stream: bloc.globalFetcher,
        builder: (context, AsyncSnapshot<RpGlobal> snapshot) {
          if (snapshot.hasData) {
            return buildList(snapshot.data);
          } else if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          }
          return getListOfLoadingShimmer();
        },
      ),
    );
  }

  Widget buildList(RpGlobal data) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: data.locations.length + 2, //2 is for above list
        itemBuilder: (context, index) {
          var country = data.locations[index];
          if (index == 0) {
            return buildGlobalView(data.latest);
          } else if (index == 1) {
            return buildUserCountryView(_userCountryLatest);
          } else {
            return buildSingleCountryView(country);
          }
        });
  }

  Widget buildGlobalView(Latest latest) {
    return Container(
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
              child: Text(
                'WORLDWIDE',
                style: getWorldWideTextStyle(18),
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
                      '${latest.confirmed}',
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
                      '${latest.recovered == 0 ? '0000' : latest.recovered}',
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
                      '${latest.deaths}',
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

  Widget buildUserCountryView(Latest userCountryLatest) {
    return Container(
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
              child: Text(
                '${_userCountry.country.toUpperCase()}',
                style: getWorldWideTextStyle(18),
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
                      '${userCountryLatest.confirmed}',
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
                      '${userCountryLatest.recovered == 0 ? '0000' : userCountryLatest.recovered}',
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
                      '${userCountryLatest.deaths}',
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

  Widget buildSingleCountryView(Location country) {
    return Padding(
      padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
      child: Container(
          height: 80,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 15.0,
                ),
              ])),
    );
  }
}
