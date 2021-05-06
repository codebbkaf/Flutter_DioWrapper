import 'dart:ffi';
import 'dart:convert';

List<APIJsonStoreResponseModel> apiJsonPlaceHolderResponseModelFromJson(String str) => List<APIJsonStoreResponseModel>.from(json.decode(str).map((x) => APIJsonStoreResponseModel.fromJson(x)));

String apiJsonStoreResponseModelToJson(List<APIJsonStoreResponseModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class APIJsonStoreResponseModel {
  int? id;
  String? title;
  Double? price;
  String? description;
  String? category;
  String? image;

  APIJsonStoreResponseModel({
      this.id,
      this.title,
      this.price,
      this.description,
      this.category,
      this.image
  });

  factory APIJsonStoreResponseModel.fromJson(Map<String, dynamic> json) => APIJsonStoreResponseModel(
    id: json["id"] ??= json["id"],
    title: json["title"] ??= json["title"],
    price: json["url"] ??= json["url"],
    description: json["categrory"] ??= json["categrory"],
    category: json["category"] ??= json["category"],
    image: json["image"] ??= json["image"],
  );

  Map<String, dynamic> toJson() => {
    "id": id ??= id,
    "title": title ??= title,
    "price": price ??= price,
    "description": description ??= description,
    "category": category ??= category,
    "image": category ??= category,
  };

}
