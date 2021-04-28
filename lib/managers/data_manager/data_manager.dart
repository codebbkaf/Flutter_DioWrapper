import 'dart:async';

import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataManager {
  static final DataManager _sADataManager = DataManager._internal();

  factory DataManager() {
    return _sADataManager;
  }

  DataManager._internal();

  Map<String, String> twLanMap = {'':''};
  Map<String, String> cnLanMap = {'':''};
  Map<String, String> enLanMap = {'':''};
  Map<String, String> jpLanMap = {'':''};

  // sharePreference Data ----
  late SharedPreferences sharedPreferences;

  Future<bool> initSharedPreferences(){
    var completer = new Completer<bool>();

    SharedPreferences.getInstance().then((value) {
      dPrint("SharedPreferences.getInstance response", StackTrace.current);
      sharedPreferences = value;
      completer.complete(true);
    });
    return completer.future;

  }

  int _selectedLanguage = 0;
  set selectedLanguage(int selected) {
    print('do set doors ${selected}');
    sharedPreferences.setInt('_selectedLanguage', selected);
    _selectedLanguage = selected;
  }

  int get selectedLanguage {
    print('do get doors ${_selectedLanguage}');
    _selectedLanguage = (sharedPreferences.getInt('_selectedLanguage') == null) ? 0 : sharedPreferences.getInt('_selectedLanguage') ?? 0;
    return _selectedLanguage;
  }

}