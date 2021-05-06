import 'package:bloc/bloc.dart';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_repository.dart';
import 'package:flutter_app_bloc_dio/pages/product_list/product_list_events.dart';
import 'package:flutter_app_bloc_dio/pages/product_list/product_list_states.dart';

class ProductListBloc extends Bloc<ProductListEvents, ProductListStates> {
  ProductListBloc() : super(APIJsonStoreInitialResponse());

  @override
  Future<void> close() {
    APIJsonStoreRepository().clear();
    return super.close();
  }

  void onFetchProduct() {
    add(FetchProducts());
  }

  void onFetchMoreProduct() {
    add(FetchMoreProducts());
  }

  @override
  Stream<ProductListStates> mapEventToState(ProductListEvents event) async* {
    yield* _mapEventToState(event, state);
  }

  Stream<ProductListStates> _mapEventToState(
      ProductListEvents event, ProductListStates state) async* {
    if (event is FetchProducts) {
      yield APIJsonStoreLoading();
      var result = await APIJsonStoreRepository().fetchProducts();
      if (result.statusCode == 200 && result.isParseSuccess) {
        yield APIJsonStoreResponseSuccess()..result = result;
      } else {
        yield APIJsonStoreResponseFail()
          ..result = result
          ..errorMessage = result.errorMessage;
      }
    } else if (event is FetchMoreProducts) {
      var result = await APIJsonStoreRepository().fetchMoreProducts();
      if (result.statusCode == 200 && result.isParseSuccess) {
        yield APIJsonStoreResponseSuccess()..result = result;
      } else {
        yield APIJsonStoreResponseFail()
          ..result = result
          ..errorMessage = result.errorMessage;
      }
    }
  }
}
