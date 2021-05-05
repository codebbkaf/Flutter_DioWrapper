import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/data_manager/data_manager.dart';
import 'package:flutter_app_bloc_dio/managers/page_transform/page_transform_manager.dart';
import 'package:flutter_app_bloc_dio/pages/launch/launch_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' as DotEnv;

class LaunchPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LaunchPageState();

}

class _LaunchPageState extends State<LaunchPage> {
  final _bloc = LaunchBloc();

  @override
  void dispose() {
    dPrint("dispose", StackTrace.current);
    _bloc.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _bloc.initDataBase();
  }

  @override
  Widget build(BuildContext context) {
    CIUtility().checkIsMobile(context);
    return Scaffold(
      body:
      StreamBuilder(
        stream: _bloc.behaviorSubject.stream,
        builder: (context, AsyncSnapshot<bool> snapshot){
          dPrint("snapshot response with: ${snapshot.data}", StackTrace.current);
          if (snapshot.hasData) {
            if (snapshot.data ?? false){
              PageTransManager().pushReplacementToMenuPage(context);
              return Text('snapshot.data == true');
            } else {
              return Text('snapshot.data == false');
            }
          } else if (snapshot.hasError) {
            return Text('!snapshot.hasError, build Error widget');
          } else {
            return Text('!snapshot.hasData, build Loading widget');
          }
          return Text('ads');
        },

      ),
    );
  }

}