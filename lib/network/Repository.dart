import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:go_away_covid19/network/ApiProvider.dart';

class Repository {
  var apiProvider = ApiProvider();

  Future<RpGlobal> getGlobalData() => apiProvider.getGlobalData();
  Future<RpGlobal> getUserCountryData(String countryCode) => apiProvider.getUserCountryData(countryCode);
}
