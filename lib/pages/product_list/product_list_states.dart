import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_state.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_response_model.dart';

abstract class ProductListStates extends APIState {}

class APIJsonStoreResponseSuccess extends ProductListStates {
  late APIResult<List<APIJsonStoreResponseModel>> result;
}

class APIJsonStoreResponseFail extends ProductListStates {
  late APIResult<List<APIJsonStoreResponseModel>> result;
  String errorMessage = "";
}

class APIJsonStoreInitialResponse extends ProductListStates {}

class APIJsonStoreLoading extends ProductListStates {}
