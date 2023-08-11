import 'dart:convert';

ProductByCategory productByCategoryFromJson(String str) => ProductByCategory.fromJson(json.decode(str));

String productByCategoryToJson(ProductByCategory data) => json.encode(data.toJson());

class ProductByCategory {
  bool status;
  List<Data> data;
  String message;

  ProductByCategory({
    required this.status,
    required this.data,
    required this.message,
  });

  factory ProductByCategory.fromJson(Map<String, dynamic> json) => ProductByCategory(
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
  int productId;
  String title;
  String subTitle;
  String logo;

  Data({
    required this.productId,
    required this.title,
    required this.subTitle,
    required this.logo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
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