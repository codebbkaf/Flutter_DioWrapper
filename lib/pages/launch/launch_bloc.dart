import 'package:flutter_app_bloc_dio/managers/data_manager/data_manager.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class LaunchBloc {
  final BehaviorSubject<bool> _behaviorSubject = BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<bool> get behaviorSubject => _behaviorSubject;

  initDataBase() async {
    await DotEnv.load(fileName: "lib/sensitive/.env");
    await DataManager().initSharedPreferences();
    _behaviorSubject.sink.add(true);
  }

  dispose(){
    _behaviorSubject.close();
  }
}
