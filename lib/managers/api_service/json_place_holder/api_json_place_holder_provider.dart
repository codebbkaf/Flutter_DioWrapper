import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_config.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_manager.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'api_json_place_holder_response_model.dart';

class APIJsonPlaceHolderProvider {
  final String _path = APIConfig.photoPath;
  final String _host = APIConfig.jsonPlaceHolderHost;
  final String _scheme = APIConfig.scheme;

  Future<APIResult<List<APIJsonPlaceHolderResponseModel>>> fetchPhotos(int start, int limit) async {
      Uri url = Uri(scheme: _scheme, host: _host, path: _path, queryParameters: {"_start": "$start", "_limit": "$limit"});
      APIResult<Response> result = await APIManager().getMethod(url.toString());
      APIResult<List<APIJsonPlaceHolderResponseModel>> apiServiceResult = APIResult();
      apiServiceResult.statusCode = result.statusCode;
      apiServiceResult.errorMessage = result.errorMessage;
      try {
      if (result.response != null){
        var list = (result.response!.data as List<dynamic>).map((e) => APIJsonPlaceHolderResponseModel.fromJson(e)).toList();
        // 解析錯誤示範
        // var list = (result.response as List<dynamic>).map((e) => APIJsonPlaceHolderResponseModel.fromJson(e)).toList();

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
}