import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_bloc.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_page.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'pages/launch/launch_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LaunchPage(),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = PhotoListBloc();

  @override
  void initState() {
    _bloc.onFetchPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => _bloc)
      ],
      child: CounterWidget(widget: widget),
    );
  }
}

class CounterWidget extends StatelessWidget {
  const CounterWidget({
    Key? key,
    required this.widget,
  }) : super(key: key);

  final MyHomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Text(
            //   'You have pushed the button this many times:',
            // ),
            BlocBuilder(
              bloc: BlocProvider.of<PhotoListBloc>(context),
              builder: (BuildContext context, state) {
                if (state is APIJsonPlaceHolderResponseSuccess){
                  return Text(
                    '${state.result.response?.length} items',
                  );
                } else if (state is APIJsonPlaceHolderResponseFail) {
                  return Text(
                    'state: ${state.errorMessage}',
                  );
                } else if (state is APIJsonPlaceHolderLoading){
                  return _buildLoadingWidget();
                } else {
                  return Text(
                    'state: 3',
                  );
                }
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => BlocProvider.of<PhotoListBloc>(context).onFetchPhoto(),
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
  Widget _buildLoadingWidget() {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("Loading data from API..."),
            SizedBox(height: 12),
            CircularProgressIndicator()],
        ));
  }
}

