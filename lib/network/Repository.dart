import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:go_away_covid19/models/RpLatest.dart';
import 'package:go_away_covid19/models/RpUserCountry.dart';
import 'package:go_away_covid19/network/ApiProvider.dart';

class Repository {
  var apiProvider = ApiProvider();

  Future<RpLatest> getGloballyLatestData() => apiProvider.getGloballyLatestData();
  Future<List<Country>> getAllCountriesData() => apiProvider.getAllCountriesData();
  Future<RpUserCountryData> getUserCountryData(String countryCode) => apiProvider.getUserCountryData(countryCode);
}
