// To parse this JSON data, do
//
//     final searchResponse = searchResponseFromJson(jsonString);

import 'dart:convert';

SearchResponse searchResponseFromJson(String str) => SearchResponse.fromJson(json.decode(str));

String searchResponseToJson(SearchResponse data) => json.encode(data.toJson());

class SearchResponse {
  bool status;
  List<Data> data;
  String message;

  SearchResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) => SearchResponse(
    status: json["status"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  int id;
  String companyName;

  Data({
    required this.id,
    required this.companyName,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    companyName: json["company_name"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "company_name": companyName,
  };
}
