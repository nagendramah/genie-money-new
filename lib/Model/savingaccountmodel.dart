// To parse this JSON data, do
//
//     final savingAccountModel = savingAccountModelFromJson(jsonString);

import 'dart:convert';

SavingAccountModel savingAccountModelFromJson(String str) => SavingAccountModel.fromJson(json.decode(str));

String savingAccountModelToJson(SavingAccountModel data) => json.encode(data.toJson());

class SavingAccountModel {
  SavingAccountModel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  List<Datum> data;
  String message;

  factory SavingAccountModel.fromJson(Map<String, dynamic> json) => SavingAccountModel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.productId,
    required this.title,
    required this.subTitle,
    required this.logo,
  });

  int productId;
  String title;
  String subTitle;
  String logo;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
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
