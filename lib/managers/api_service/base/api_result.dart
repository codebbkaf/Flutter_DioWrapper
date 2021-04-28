
class APIResult<T> {
  T? response;
  String errorMessage = "";
  int? statusCode = 000;
  bool isParseSuccess = true;
}