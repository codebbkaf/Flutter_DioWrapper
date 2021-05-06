import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/pages/product_list/product_list_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProductListState();
}

class _ProductListState extends State<ProductListPage> {
  final _bloc = ProductListBloc();

  @override
  void initState() {
    _bloc.onFetchProduct();
    super.initState();
  }

  @override
  void dispose() {
    _bloc.close();
    dPrint("dispose", StackTrace.current);
    super.dispose();
  }

  noSuchMethod(Invocation invocation) => super.noSuchMethod(invocation);
}

class ProductListView extends StatelessWidget {
  final ProductListPage widget;
  const ProductListView({Key? key, required this.widget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product list page")),
      body: _productGridView(context),
    );
  }

  _productGridView(BuildContext context) {
    var _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          dPrint("You're at the top", StackTrace.current);
        } else {
          dPrint("You're at the bottom", StackTrace.current);
          BlocProvider.of<ProductListBloc>(context).onFetchMoreProduct();
        }
      }
    });
  }
}
