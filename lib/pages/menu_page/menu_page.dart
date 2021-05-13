import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/page_transform/page_transform_manager.dart';

class MenuPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MenuState();
  }

}

class _MenuState extends State<MenuPage> {

  @override
  void dispose() {
    dPrint("dispose", StackTrace.current);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Menu Page")),
      body: Column(
        children: [
          Container(
            child: MaterialButton(
              onPressed: () {
                PageTransManager().pushToPhotoListPage(context);
              },
              child: Center(
                child: Text("Photo list page"),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                PageTransManager().pushToLocalizedListPage(context);
              },
              child: Center(
                child: Text("Localized list page"),
              ),
            ),
          ),
          Container(
            child: MaterialButton(
              onPressed: () {
                PageTransManager().pushToProductListPage(context);
              },
              child: Center(
                child: Text("Product list page")
              ),
            )
          )
        ],
      ),
    );
  }
}