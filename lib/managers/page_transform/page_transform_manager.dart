import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/pages/localize_list/localized_liat_page.dart';
import 'package:flutter_app_bloc_dio/pages/menu_page/menu_page.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_page.dart';

class PageTransManager {
  static final PageTransManager _pageTransManager =
  PageTransManager._internal();

  factory PageTransManager() {
    return _pageTransManager;
  }

  PageTransManager._internal();

  pushToPhotoListPage(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) {
      return PhotoListPage();
    }));
  }

  pushToLocalizedListPage(BuildContext context) {
    Future.microtask(() => Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return LocalizedListPage();
    }))
    );
  }

  pushReplacementToMenuPage(BuildContext context) {
    Future.microtask(() => Navigator.of(context)
        .pushReplacement(new MaterialPageRoute(builder: (context) {
      return MenuPage();
    }))
    );
  }


}