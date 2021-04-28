abstract class APIState {}

class APIInternetErrorState extends APIState {
  String errorMessage = "網路連線異常";
}

class APIResponseParseError extends APIState {
  String errorMessage = "資料格式異常";
}

class APIRequestTimeOut extends APIState {
  String errorMessage = "網路連線異常";
}

class APILoading extends APIState {
  String errorMessage = "資料讀取中...";
}

