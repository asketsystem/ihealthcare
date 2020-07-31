import 'package:ihealthcare/models/RpGlobal.dart';
import 'package:ihealthcare/models/RpLatest.dart';
import 'package:ihealthcare/models/RpNews.dart';
// ignore: unused_import
import 'package:ihealthcare/models/RpUserCountry.dart';
import 'package:ihealthcare/network/ApiProvider.dart';

class Repository {
  var apiProvider = ApiProvider();

  Future<RpLatest> getGloballyLatestData() =>
      apiProvider.getGloballyLatestData();
  Future<List<Country>> getAllCountriesData() =>
      apiProvider.getAllCountriesData();
  Future<Country> getUserCountryData(String countryCode) =>
      apiProvider.getUserCountryData(countryCode);
  Future<RpNews> getNewses() => apiProvider.getNewses();
}
