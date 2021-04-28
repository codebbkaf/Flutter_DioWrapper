import 'package:bloc/bloc.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_place_holder/api_json_place_holder_repository.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_events.dart';
import 'package:flutter_app_bloc_dio/pages/photo_list/photo_list_states.dart';

class PhotoListBloc extends Bloc<PhotoListEvents, PhotoListStates> {
  PhotoListBloc() : super(APIJsonPlaceHolderInitialResponse());

  @override
  Future<void> close() {
    APIJsonPlaceHolderRepository().clear();
    return super.close();
  }
  void onFetchPhoto(){
    add(FetchPhotos());
  }
  void onFetchMorePhoto(){
    add(FetchMorePhotos());
  }
  @override
  Stream<PhotoListStates> mapEventToState(PhotoListEvents event) async* {
    yield* _mapEventToState(event, state);
  }

  Stream<PhotoListStates> _mapEventToState(PhotoListEvents event, PhotoListStates state) async* {

    if (event is FetchPhotos){
      yield APIJsonPlaceHolderLoading();
      var result = await APIJsonPlaceHolderRepository().fetchPhotos();
      if (result.statusCode == 200 && result.isParseSuccess){
        yield APIJsonPlaceHolderResponseSuccess()
          ..result = result;
      } else {
        yield APIJsonPlaceHolderResponseFail()
          ..result = result
          ..errorMessage = result.errorMessage;
      }
    } else if (event is FetchMorePhotos){
      var result = await APIJsonPlaceHolderRepository().fetchMorePhotos();
      if (result.statusCode == 200 && result.isParseSuccess){
        yield APIJsonPlaceHolderResponseSuccess()
          ..result = result;
      } else {
        yield APIJsonPlaceHolderResponseFail()
          ..result = result
          ..errorMessage = result.errorMessage;
      }
    }
  }

}