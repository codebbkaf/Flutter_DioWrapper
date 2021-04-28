import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_bloc_dio/base_ui_component/cache_image_view.dart';
import 'package:flutter_app_bloc_dio/base_ui_component/loading_view.dart';
import 'package:flutter_app_bloc_dio/base_ui_component/show_coustom_alert.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'photo_list_bloc.dart';

class PhotoListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PhotoListState();
}

class _PhotoListState extends State<PhotoListPage> {
  final _bloc = PhotoListBloc();

  @override
  void initState() {
    _bloc.onFetchPhoto();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (BuildContext context) => _bloc)],
        child: _PhotoListView(widget: widget));
  }

  @override
  void dispose() {
    _bloc.close();
    super.dispose();
  }
}

class _PhotoListView extends StatelessWidget {
  const _PhotoListView({Key? key, required this.widget}) : super(key: key);

  final PhotoListPage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Photo list page")),
      body: _photoGridView(context),
    );
  }

  _photoAnimatedList() {
    return AnimatedList(itemBuilder: (context, index, animation) {
      return Text("asd");
    });
  }

  _photoRecycleListView() {
    return ListView.builder(itemBuilder: (context, index) {
      return Text("");
    });
  }

  _photoGridView(BuildContext context) {
    var _controller = ScrollController();
    _controller.addListener(() {
      if (_controller.position.atEdge) {
        if (_controller.position.pixels == 0) {
          dPrint("You're at the top", StackTrace.current);
        } else {
          dPrint("You're at the bottom", StackTrace.current);
          BlocProvider.of<PhotoListBloc>(context).onFetchMorePhoto();
        }
      }
    });
    return BlocBuilder(
      bloc: BlocProvider.of<PhotoListBloc>(context),
      builder: (BuildContext context, PhotoListStates state) {
        if (state is APIJsonPlaceHolderResponseSuccess) {
          return GridView.builder(
              itemCount: state.result.response?.length ?? 0,
              controller: _controller,
              padding: EdgeInsets.all(4),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 4,
                crossAxisCount: 4,
                crossAxisSpacing: 4,
                childAspectRatio: 1.0,
              ),
              itemBuilder: (context, int index) {
                return _photoGridItem("${state.result.response?[index].thumbnailUrl}");
              });
        } else if (state is APIJsonPlaceHolderLoading){
          return buildLoadingWidget(title: "loading...");
        } else if (state is APIJsonPlaceHolderResponseFail) {
          return customDialog(context, "${state.errorMessage}", firstItemTitle: "重新整理", firstTapAction: (){
            BlocProvider.of<PhotoListBloc>(context).onFetchPhoto();
          });
        } else {
          return Text("");
        }
      },
    );
  }

  Widget _photoGridItem(String? imageURL) {
    return Center(child: 
        Text("asd"),
    // cacheImageView(imageURL)
    );
  }
}
