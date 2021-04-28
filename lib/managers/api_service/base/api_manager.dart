import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'api_result.dart';

class APIManager {
  Dio _dio = Dio();

  static final APIManager _apiServiceManager = APIManager._internal();

  factory APIManager() {
    BaseOptions options = BaseOptions(
      connectTimeout: 15*1000, // 15 seconds
      receiveTimeout: 15*1000 // 60 seconds
    );
    _apiServiceManager._dio = Dio(options);
    return _apiServiceManager;
  }

  APIManager._internal();

  Future<APIResult<Response>> getMethod(String path) async {
    dPrint("APIServiceManager getMethod request with url: ${path}", StackTrace.current);
    Response response = await _dio.get(path);
    dPrint("APIServiceManager getMethod response with url: ${path}, statusCode: ${response.statusCode}", StackTrace.current);
    APIResult<Response> apiServiceResult = APIResult();
    apiServiceResult.response = response;
    apiServiceResult.statusCode = response.statusCode;
    apiServiceResult.errorMessage = "";
    return apiServiceResult;

  }
}