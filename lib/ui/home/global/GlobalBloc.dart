import 'package:go_away_covid19/models/RpGlobal.dart';
import 'package:go_away_covid19/network/Repository.dart';
import 'package:rxdart/rxdart.dart';

final bloc = GlobalBloc();

class GlobalBloc {
  final _repository = Repository();

  final globalFetcher = BehaviorSubject<RpGlobal>();

  Stream<RpGlobal> get allAbout => globalFetcher.stream;

  getGlobalData() async {
    RpGlobal global = await _repository.getGlobalData();
    globalFetcher.sink.add(global);
  }

  dispose() {
    globalFetcher.close();
  }
}
