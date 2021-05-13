import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_provider.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_response_model.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListPage> {
  late Future<List<StoreResponse>> futureProduct;

  @override
  void initState() {
    super.initState();
    futureProduct = APIJsonStoreProvider.fetchProduct();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final title = 'Product List Page';

    return MaterialApp(
      title: title,
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text(title),
          ),
          body: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return FutureBuilder<dynamic>(
              future: futureProduct,
              builder: (BuildContext context, snapshot) {
                print("snapshot");
                print(snapshot.data);
                if (constraints.maxWidth > 1000) {
                  return _buildLargeContainer(snapshot);
                } else if (constraints.maxWidth > 600) {
                  return _buildWideContainer(snapshot);
                } else {
                  return _buildNormalContainer(snapshot);
                }
              },
            );
          })),
    );
  }

  Widget _buildNormalContainer(snapshot) {
    if (snapshot.hasData) {
      return GridView.count(
        crossAxisCount: 2,
        padding: EdgeInsets.all(4.0),
        childAspectRatio: 8.0 / 9.0,
        children: List.generate(snapshot.data.length, (i) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: RandomColorModel().getColor(),
            child: (Text(
              snapshot.data![i].title,
            )),
          );
        }),
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    // By default, show a loading spinner.
    return Center(
      child: (CircularProgressIndicator()),
    );
  }

  Widget _buildWideContainer(snapshot) {
    if (snapshot.hasData) {
      return GridView.count(
        crossAxisCount: 4,
        padding: EdgeInsets.all(4.0),
        childAspectRatio: 8.0 / 9.0,
        children: List.generate(snapshot.data.length, (i) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: RandomColorModel().getColor(),
            child: (Text(
              snapshot.data![i].title,
            )),
          );
        }),
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    // By default, show a loading spinner.
    return Center(
      child: (CircularProgressIndicator()),
    );
  }

  Widget _buildLargeContainer(snapshot) {
    if (snapshot.hasData) {
      return GridView.count(
        crossAxisCount: 6,
        padding: EdgeInsets.all(4.0),
        childAspectRatio: 8.0 / 9.0,
        children: List.generate(snapshot.data.length, (i) {
          return Container(
            padding: const EdgeInsets.all(16),
            color: RandomColorModel().getColor(),
            child: (Text(
              snapshot.data![i].title,
            )),
          );
        }),
      );
    } else if (snapshot.hasError) {
      return Text("${snapshot.error}");
    }
    // By default, show a loading spinner.
    return Center(
      child: (CircularProgressIndicator()),
    );
  }
}

class RandomColorModel {
  Random random = Random();
  Color getColor() {
    return Color.fromARGB(random.nextInt(300), random.nextInt(300),
        random.nextInt(300), random.nextInt(300));
  }
}
