import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/pages/localize_list/localized_list_bloc.dart';

class LocalizedListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return LocalizedListState();
  }
}

class LocalizedListState extends State<LocalizedListPage> {
  final LocalizedListBloc _localizedListBloc = LocalizedListBloc();

  @override
  void dispose() {
    _localizedListBloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _localizedListBloc.fetchLocalizedDocument();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LocalizedListPage"),),
      body: Text("body"),
    );
  }

}