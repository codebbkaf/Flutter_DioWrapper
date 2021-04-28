import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/data_manager/data_manager.dart';
import 'package:flutter_app_bloc_dio/managers/page_transform/page_transform_manager.dart';

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LaunchPageState();

}

class _LaunchPageState extends State<LaunchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child:
        GestureDetector(
          onTap: () {
            if (CIUtility().isIOS(context) || CIUtility().isAndroid(context)){
              DataManager().initSharedPreferences().then((value) async {
                PageTransManager().pushToPhotoListPage(context);
              });
            } else {
              PageTransManager().pushToPhotoListPage(context);
            }
          },
          child: Text("next"),
        ),),
    );
  }

}