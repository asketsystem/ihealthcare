import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:go_away_covid19/models/RpLatest.dart';
import 'package:go_away_covid19/models/RpUserCountry.dart';
import 'package:go_away_covid19/network/Repository.dart';
import 'package:go_away_covid19/ui/countrydetails/CountryDetails.dart';
import 'package:go_away_covid19/ui/home/global/GlobalBloc.dart';
import 'package:go_away_covid19/util/ColorUtil.dart';
import 'package:go_away_covid19/util/ShimmerLoading.dart';
import 'package:go_away_covid19/util/StyleUtil.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GlobalPage extends StatefulWidget {
  @override
  _GlobalPageState createState() => _GlobalPageState();
}

class _GlobalPageState extends State<GlobalPage> {
  var _repository = Repository();
  var _userCountryData = RpUserCountryData();
  var _worldWideLatest = RpLatest();

  @override
  void initState() {
    super.initState();

    _repository.getGloballyLatestData().then((response) {
      setState(() {
        _worldWideLatest = response;
      });
    });

    getUserCountryFromSharedPreference();

    bloc.getGlobalData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: getPageBackgroundColor(),
      body: StreamBuilder(
        stream: bloc.globalFetcher,
        builder: (context, AsyncSnapshot<List<Country>> snapshot) {
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

  Widget buildList(List<Country> allCountryData) {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: allCountryData.length, //2 is for above list
        itemBuilder: (context, index) {
          var country = allCountryData[index];

          if (index == 0) {
            return buildGlobalView(_worldWideLatest);
          } else if (index == 1) {
            return buildUserCountryView(_userCountryData);
          } else {
            return buildSingleCountryView(country);
          }
        });
  }

  Widget buildGlobalView(RpLatest latest) {
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
                      '${latest.cases == null ? 'Loading...' : latest.cases}',
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

  Widget buildUserCountryView(RpUserCountryData userCountryData) {
    return InkWell(
      onTap: () {
        navigateToDetailsPage(userCountryData);
      },
      child: Container(
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
                child: Text(
                  '${userCountryData.country == null ? "LOADING..." : userCountryData.country.toUpperCase()}',
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
      ),
    );
  }

  Widget buildSingleCountryView(Country country) {
    print('flag: ${country.countryInfo.flag}');

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
            ]),
        child: Row(
          children: <Widget>[
            SizedBox(
              width: 25,
            ),
            Container(
              height: 35,
              width: 55,
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
                  imageUrl: "${country.countryInfo.flag}"),
            ),
            SizedBox(
              width: 25,
            ),
            Text('${getOnlyCountryName(country.country)}',
                style: getCountryNameInListStyle()),
            Spacer(),
            Center(
                child: Text(
              '${country.cases}',
              style: getCountryInListCasesStyle(),
            )),
            SizedBox(width: 25)
          ],
        ),
      ),
    );
  }

  String getOnlyCountryName(String country) {
    var splits = country.split(",");
    return splits[0];
  }

  void getUserCountryFromSharedPreference() async {
    var preference = await SharedPreferences.getInstance();
    var userCountry = await preference.getString('userCountry');
    print('user country: $userCountry');
    _repository.getUserCountryData(userCountry).then((response) {
      setState(() {
        _userCountryData = response;
      });
    });
  }

  void navigateToDetailsPage(RpUserCountryData userCountryData) {
    var countryDetails = CountryDetails(
      userCountryData: userCountryData,
    );
    Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => countryDetails),
    );
  }
}
