import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'api_json_place_holder_provider.dart';
import 'api_json_place_holder_response_model.dart';
import 'dart:async';

class APIJsonPlaceHolderRepository {
  static final APIJsonPlaceHolderRepository _apiJsonPlaceHolderRepository = APIJsonPlaceHolderRepository._internal();

  factory APIJsonPlaceHolderRepository() {
    return _apiJsonPlaceHolderRepository;
  }

  APIJsonPlaceHolderRepository._internal();

  APIResult<List<APIJsonPlaceHolderResponseModel>>? result;
  int _fetchCount = 50;
  int _currentFetchCount = 0;

  clear(){
    result = null;
    _fetchCount = 50;
    _currentFetchCount = 0;
  }

  Future<APIResult<List<APIJsonPlaceHolderResponseModel>>> fetchPhotos() {
    var completer = new Completer<APIResult<List<APIJsonPlaceHolderResponseModel>>>();
    if (result != null) {
      dPrint("cache photo length: ${result?.response?.length}", StackTrace.current);
      completer.complete(result);
    } else {
      APIJsonPlaceHolderProvider().fetchPhotos(_currentFetchCount, _fetchCount).then((value) {
        _currentFetchCount += _fetchCount;
        result = value;
        dPrint("init photo length: ${result?.response?.length}", StackTrace.current);
        completer.complete(result);
      });
    }
    return completer.future;
  }

  Future<APIResult<List<APIJsonPlaceHolderResponseModel>>> fetchMorePhotos() {
    var completer = new Completer<APIResult<List<APIJsonPlaceHolderResponseModel>>>();
    APIJsonPlaceHolderProvider().fetchPhotos(_currentFetchCount, _fetchCount).then((value) {
      _currentFetchCount = _currentFetchCount + _fetchCount;
      result?.response?.addAll(value.response ?? []);
      dPrint("add more photos total length: ${result?.response?.length}", StackTrace.current);
      completer.complete(result);
    });
    return completer.future;
  }
}
