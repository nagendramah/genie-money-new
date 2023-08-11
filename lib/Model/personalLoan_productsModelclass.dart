// To parse this JSON data, do
//
//     final personalProductByCategory = personalProductByCategoryFromJson(jsonString);

import 'dart:convert';

PersonalProductByCategory personalProductByCategoryFromJson(String str) => PersonalProductByCategory.fromJson(json.decode(str));

String personalProductByCategoryToJson(PersonalProductByCategory data) => json.encode(data.toJson());

class PersonalProductByCategory {
  bool status;
  Data data;
  String message;

  PersonalProductByCategory({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PersonalProductByCategory.fromJson(Map<String, dynamic> json) => PersonalProductByCategory(
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
  int id;
  int loanDetailId;
  String title;
  String subTitle;
  String interestRate;
  String processingFees;
  String loanUpto;
  String tenure;
  String bankLogo;
  int salary;

  EligibleProductList({
    required this.id,
    required this.loanDetailId,
    required this.title,
    required this.subTitle,
    required this.interestRate,
    required this.processingFees,
    required this.loanUpto,
    required this.tenure,
    required this.bankLogo,
    required this.salary,
  });

  factory EligibleProductList.fromJson(Map<String, dynamic> json) => EligibleProductList(
    id: json["id"],
    loanDetailId: json["loan_detail_id"],
    title: json["title"],
    subTitle: json["sub_title"],
    interestRate: json["interest_rate"],
    processingFees: json["processing_fees"],
    loanUpto: json["loan_upto"],
    tenure: json["tenure"],
    bankLogo: json["bank_logo"],
    salary: json["salary"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "loan_detail_id": loanDetailId,
    "title": title,
    "sub_title": subTitle,
    "interest_rate": interestRate,
    "processing_fees": processingFees,
    "loan_upto": loanUpto,
    "tenure": tenure,
    "bank_logo": bankLogo,
    "salary": salary,
  };
}
