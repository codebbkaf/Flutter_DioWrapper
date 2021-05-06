import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_config.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_manager.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_response_model.dart';

class APIJsonStoreProvider {
  final String _path = APIConfig.productPath;
  final String _host = APIConfig.jsonStoreHost;
  final String _scheme = APIConfig.scheme;

  Future<APIResult<List<APIJsonStoreResponseModel>>> fetchPhotos(int start, int limit) async {
      Uri url = Uri(scheme: _scheme, host: _host, path: _path, queryParameters: {"_start": "$start", "_limit": "$limit"});
      APIResult<Response> result = await APIManager().getMethod(url.toString());
      APIResult<List<APIJsonStoreResponseModel>> apiServiceResult = APIResult();
      apiServiceResult.statusCode = result.statusCode;
      apiServiceResult.errorMessage = result.errorMessage;
      try {
      if (result.response != null){
        var list = (result.response!.data as List<dynamic>).map((e) => APIJsonStoreResponseModel.fromJson(e)).toList();

        apiServiceResult.response = list;
      } else {
        apiServiceResult.response = null;
      }
      return apiServiceResult;
    } catch (error) {
      apiServiceResult.errorMessage = "資料格式異常: statusCode: ${apiServiceResult.statusCode}, ${error.toString()}";
      apiServiceResult.response = null;
      apiServiceResult.isParseSuccess = false;
      return apiServiceResult;
    }
  }

  fetchProducts(int currentFetchCount, int fetchCount) {}
}