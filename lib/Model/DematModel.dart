// To parse this JSON data, do
//
//     final dematResponse = dematResponseFromJson(jsonString);

import 'dart:convert';

DematResponse dematResponseFromJson(String str) => DematResponse.fromJson(json.decode(str));

String dematResponseToJson(DematResponse data) => json.encode(data.toJson());

class DematResponse {
  bool status;
  Data data;
  String message;

  DematResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory DematResponse.fromJson(Map<String, dynamic> json) => DematResponse(
    status: json["status"],
    data: Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  List<EligibleProductList> eligibleProductList;
  String customerId;
  String categoryId;

  Data({
    required this.eligibleProductList,
    required this.customerId,
    required this.categoryId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    eligibleProductList: List<EligibleProductList>.from(json["eligible_product_list"].map((x) => EligibleProductList.fromJson(x))),
    customerId: json["customer_id"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "eligible_product_list": List<dynamic>.from(eligibleProductList.map((x) => x.toJson())),
    "customer_id": customerId,
    "category_id": categoryId,
  };
}

class EligibleProductList {
  int productId;
  String title;
  String subTitle;
  String logo;

  EligibleProductList({
    required this.productId,
    required this.title,
    required this.subTitle,
    required this.logo,
  });

  factory EligibleProductList.fromJson(Map<String, dynamic> json) => EligibleProductList(
    productId: json["product_id"],
    title: json["title"],
    subTitle: json["sub_title"],
    logo: json["logo"],
  );

  Map<String, dynamic> toJson() => {
    "product_id": productId,
    "title": title,
    "sub_title": subTitle,
    "logo": logo,
  };
}
