import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget buildLoadingWidget({String? title}) {
  return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Text( title != null ? title : "Loading data from API..."),
          SizedBox(height: 12),
          CircularProgressIndicator()],
      ));
}