// To parse this JSON data, do
//
//     final creditCardProductByCategory = creditCardProductByCategoryFromJson(jsonString);

import 'dart:convert';

CreditCardProductByCategory creditCardProductByCategoryFromJson(String str) => CreditCardProductByCategory.fromJson(json.decode(str));

String creditCardProductByCategoryToJson(CreditCardProductByCategory data) => json.encode(data.toJson());

class CreditCardProductByCategory {
  bool status;
  Data data;
  String message;

  CreditCardProductByCategory({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CreditCardProductByCategory.fromJson(Map<String, dynamic> json) => CreditCardProductByCategory(
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
  dynamic mobileNo;

  Data({
    required this.eligibleProductList,
    required this.customerId,
    required this.categoryId,
    this.mobileNo,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    eligibleProductList: List<EligibleProductList>.from(json["eligible_product_list"].map((x) => EligibleProductList.fromJson(x))),
    customerId: json["customer_id"],
    categoryId: json["category_id"],
    mobileNo: json["mobile_no"],
  );

  Map<String, dynamic> toJson() => {
    "eligible_product_list": List<dynamic>.from(eligibleProductList.map((x) => x.toJson())),
    "customer_id": customerId,
    "category_id": categoryId,
    "mobile_no": mobileNo,
  };
}

class EligibleProductList {
  int productId;
  int cardId;
  String cardName;
  String bankLogo;
  List<String> mainBenefits;
  String annualCharges;
  String joiningFees;
  List<String> benefits;

  EligibleProductList({
    required this.productId,
    required this.cardId,
    required this.cardName,
    required this.bankLogo,
    required this.mainBenefits,
    required this.annualCharges,
    required this.joiningFees,
    required this.benefits,
  });

  factory EligibleProductList.fromJson(Map<String, dynamic> json) => EligibleProductList(
    productId: json["productId"],
    cardId: json["cardId"],
    cardName: json["cardName"],
    bankLogo: json["bankLogo"],
    mainBenefits: List<String>.from(json["mainBenefits"].map((x) => x)),
    annualCharges: json["annualCharges"],
    joiningFees: json["joiningFees"],
    benefits: List<String>.from(json["benefits"].map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "productId": productId,
    "cardId": cardId,
    "cardName": cardName,
    "bankLogo": bankLogo,
    "mainBenefits": List<dynamic>.from(mainBenefits.map((x) => x)),
    "annualCharges": annualCharges,
    "joiningFees": joiningFees,
    "benefits": List<dynamic>.from(benefits.map((x) => x)),
  };
}
