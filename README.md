# flutter_app_bloc_dio

## PhotoList
PhotoListStates:
PhotoListEvents:
PhotoListBloc: 
PhotoListPage: 

## Manager
- DataManager: local storage
- PageTransManager: 頁面跳轉統一在此處理，便於 user behavior tracking
- APIManager: 封裝 Dio 的網路層

## APIService
- APIResult: 一個參考 iOS 的 Result 的 class
- APIManager: 封裝 Dio 的網路層
- APIState:
- APIConfig

## API JsonPlaceHolder
- APIJsonPlaceHolderProvider: 介於 Repository 與 APIManager 之間
- APIJsonPlaceHolderRepository: 介於 Bloc 與 Provider 之間，目前也用來緩存 API Responose Data，呼叫 clear method 來清除緩存的資料
- APIJsonPlaceHolderRequestModel: 請求格式
- APIJsonPlaceHolderResponseModel: 回傳格式

## 小工具
dPrint: 使用 ci_utility 的 dPrint 方法並傳入 StackTrace.current 以顯示行數

## For web

to solve cross-origin issue using --web-renderer instead of CanvasKit renderer

run $flutter run -d chrome --web-renderer html 
