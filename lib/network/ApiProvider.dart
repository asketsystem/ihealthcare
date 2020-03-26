import 'dart:convert';
import 'dart:io';

import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:http/http.dart';

class ApiProvider {
  Client client = new Client();
  final _covid19DataSource = "https://coronavirus-tracker-api.herokuapp.com/v2";
  final _newsDataSource =
      "http://newsapi.org/v2/everything?q=coronavirus&apiKey=a8e98ea61ecc4aa69be04b13de6508bd";

  Future<RpGlobal> getGlobalData() async {
    print('getGlobalData()');
    var response = await client.get('$_covid19DataSource/locations',
        headers: {HttpHeaders.acceptHeader: "application/json"});

    print("global data response: ${response.body.toString()}");

    if (response.statusCode == 200) {
      return RpGlobal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get global data');
    }
  }

  Future<RpGlobal> getUserCountryData(String countryCode) async {
    print('getUserCountryData()');
    var response = await client.get('$_covid19DataSource/locations?country_code=$countryCode',
        headers: {HttpHeaders.acceptHeader: "application/json"});

    print("user country data response: ${response.body.toString()}");

    if (response.statusCode == 200) {
      return RpGlobal.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to get user country data');
    }
  }
}
