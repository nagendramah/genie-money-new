import 'dart:convert';

CreditScoreOtpValidation creditScoreOtpValidationFromJson(String str) =>
    CreditScoreOtpValidation.fromJson(json.decode(str));

String creditScoreOtpValidationToJson(CreditScoreOtpValidation data) =>
    json.encode(data.toJson());

class CreditScoreOtpValidation {
  bool status;
  Data data;
  String message;

  CreditScoreOtpValidation({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CreditScoreOtpValidation.fromJson(Map<String, dynamic> json) =>
      CreditScoreOtpValidation(
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
  bool isMasked;
  dynamic errorString;
  dynamic stageOneId;
  dynamic stageTwoId;
  String? customerId;
  dynamic maskedMobileNo;
  String? categoryId;
  String? productId;
  String? creditScore;

  Data({
    required this.isMasked,
    this.errorString,
    this.stageOneId,
    this.stageTwoId,
     this.customerId,
    this.maskedMobileNo,
     this.categoryId,
     this.productId,
    this.creditScore = '',
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    isMasked: json["is_masked"] ?? false,
    errorString: json["error_string"],
    stageOneId: json["stage_one_id"],
    stageTwoId: json["stage_two_id"],
    customerId: json["customer_id"],
    maskedMobileNo: json["masked_mobile_no"],
    categoryId: json["category_id"],
    productId: json["product_id"],
    creditScore: json["credit_score"] ?? '',
  );

  Map<String, dynamic> toJson() => {
    "is_masked": isMasked,
    "error_string": errorString,
    "stage_one_id": stageOneId,
    "stage_two_id": stageTwoId,
    "customer_id": customerId,
    "masked_mobile_no": maskedMobileNo,
    "category_id": categoryId,
    "product_id": productId,
    "credit_score": creditScore,
  };
}