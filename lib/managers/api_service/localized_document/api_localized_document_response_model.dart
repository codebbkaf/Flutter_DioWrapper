import 'dart:convert';

APILocalizedDocumentResponseModel apiLocalizedDocumentResponseModelFromJson(String str) => APILocalizedDocumentResponseModel.fromJson(json.decode(str));

String apiLocalizedDocumentResponseModelToJson(APILocalizedDocumentResponseModel data) => json.encode(data.toJson());

class APILocalizedDocumentResponseModel {
  APILocalizedDocumentResponseModel({
     this.range,
    this.majorDimension,
    this.values,
  });

  String? range;
  String? majorDimension;
  List<List<String>>? values;

  factory APILocalizedDocumentResponseModel.fromJson(Map<String, dynamic> json) => APILocalizedDocumentResponseModel(
    range: json["range"] == null ? null : json["range"],
    majorDimension: json["majorDimension"] == null ? null : json["majorDimension"],
    values: json["values"] == null ? null : List<List<String>>.from(json["values"].map((x) => List<String>.from(x.map((x) => x)))),
  );

  Map<String, dynamic> toJson() => {
    "range": range == null ? null : range,
    "majorDimension": majorDimension == null ? null : majorDimension,
    "values": values == null ? null : List<dynamic>.from((values ?? []).map((x) => List<dynamic>.from(x.map((x) => x)))),
  };
}
