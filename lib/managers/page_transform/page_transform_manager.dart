import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
}