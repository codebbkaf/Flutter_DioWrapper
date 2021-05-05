import 'package:dio/dio.dart';
import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_config.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_manager.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'api_localized_document_response_model.dart';

class APILocalizedDocumentProvider {
  final String _path = APIConfig.googleDocumentPath;
  final String _host = APIConfig.googleDocumentHost;
  final String _scheme = APIConfig.scheme;

  Future<APIResult<APILocalizedDocumentResponseModel>> fetchLocalizedDocument() async {
    Uri url = Uri(scheme: _scheme, host: _host, path: _path,
        queryParameters: {"key": env["GOOGLE_DOCUMENT_API_KEY"] ?? "GOOGLE_DOCUMENT_API_KEY"});
    APIResult<Response> result = await APIManager().getMethod(url.toString());
    APIResult<APILocalizedDocumentResponseModel> apiServiceResult = APIResult();
    apiServiceResult.statusCode = result.statusCode;
    apiServiceResult.errorMessage = result.errorMessage;
    try {
      if (result.response != null){
        apiServiceResult.response = APILocalizedDocumentResponseModel.fromJson(result.response!.data);
      } else {
        apiServiceResult.response = null;
      }
      dPrint("${apiServiceResult.response!.values!.length}",StackTrace.current);
      return apiServiceResult;
    } catch (error) {
      apiServiceResult.errorMessage = "資料格式異常: statusCode: ${apiServiceResult.statusCode}, ${error.toString()}";
      apiServiceResult.response = null;
      apiServiceResult.isParseSuccess = false;
      return apiServiceResult;
    }
  }
}