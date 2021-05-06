import 'package:flutter_dotenv/flutter_dotenv.dart';

class APIConfig {
  static String scheme = "https";
  static String jsonPlaceHolderHost = "jsonplaceholder.typicode.com";
  static String photoPath = "photos";

  static String googleDocumentHost = "sheets.googleapis.com";
  static String googleDocumentPath = "v4/spreadsheets/${env['GOOGLE_DOCUMENT_SPREAD_SHEET'] ?? "GOOGLE_DOCUMENT_SPREAD_SHEET"}/values/A2:Z99";

  static String jsonStoreHost = "fakestoreapi.com";
  static String productPath = "products";
}