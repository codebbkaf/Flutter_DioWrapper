import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_provider.dart';
import 'dart:async';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_response_model.dart';

class APIJsonStoreRepository {
  static final APIJsonStoreRepository _apiJsonStoreRepository = APIJsonStoreRepository._internal();

  factory APIJsonStoreRepository() {
    return _apiJsonStoreRepository;
  }

  APIJsonStoreRepository._internal();

  APIResult<List<APIJsonStoreResponseModel>>? result;
  int _fetchCount = 50;
  int _currentFetchCount = 0;

  clear(){
    result = null;
    _fetchCount = 50;
    _currentFetchCount = 0;
  }

  Future<APIResult<List<APIJsonStoreResponseModel>>> fetchProducts() {
    var completer = new Completer<APIResult<List<APIJsonStoreResponseModel>>>();
    if (result != null) {
      dPrint("cache product length: ${result?.response?.length}", StackTrace.current);
      completer.complete(result);
    } else {
      APIJsonStoreProvider().fetchProducts(_currentFetchCount, _fetchCount).then((value) {
        _currentFetchCount += _fetchCount;
        result = value;
        dPrint("init product length: ${result?.response?.length}", StackTrace.current);
        completer.complete(result);
      });
    }
    return completer.future;
  }

  Future<APIResult<List<APIJsonStoreResponseModel>>> fetchMoreProducts() {
    var completer = new Completer<APIResult<List<APIJsonStoreResponseModel>>>();
    APIJsonStoreProvider().fetchProducts(_currentFetchCount, _fetchCount).then((value) {
      _currentFetchCount = _currentFetchCount + _fetchCount;
      result?.response?.addAll(value.response ?? []);
      dPrint("add more products total length: ${result?.response?.length}", StackTrace.current);
      completer.complete(result);
    });
    return completer.future;
  }
}
