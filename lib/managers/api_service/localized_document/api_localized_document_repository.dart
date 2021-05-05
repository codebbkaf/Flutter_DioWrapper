import 'dart:async';

import 'package:flutter_app_bloc_dio/ci_utility.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/base/api_result.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_place_holder/api_json_place_holder_response_model.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/localized_document/api_localized_document_provider.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/localized_document/api_localized_document_response_model.dart';

class APILocalizedDocumentRepository {
  static final APILocalizedDocumentRepository _apiLocalizedDocumentRepository = APILocalizedDocumentRepository.internal();

  factory APILocalizedDocumentRepository() {
    return _apiLocalizedDocumentRepository;
  }

  APILocalizedDocumentRepository.internal();

  APIResult<APILocalizedDocumentResponseModel>? result;

  clear(){
    result = null;
  }

  Future<APIResult<APILocalizedDocumentResponseModel>> fetchPhotos() {
    var completer = new Completer<APIResult<APILocalizedDocumentResponseModel>>();
    APILocalizedDocumentProvider().fetchLocalizedDocument().then((value) {
      dPrint("${value.response!.values!.length}", StackTrace.current);
      result = value;
      completer.complete(result);
    });
    return completer.future;
  }
}
