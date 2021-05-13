import 'dart:convert';
import 'package:flutter_app_bloc_dio/managers/api_service/json_store/api_json_store_response_model.dart';
import 'package:http/http.dart' as http;

class APIJsonStoreProvider {
  static Future<List<StoreResponse>> fetchProduct() async {
    final response = await http.get(Uri.https('fakestoreapi.com', 'products'),
        headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      List jsonResponse = json.decode(response.body);
      return jsonResponse
          .map((res) => new StoreResponse.fromJson(res))
          .toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load product');
    }
  }
}
