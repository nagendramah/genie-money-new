import 'dart:convert';

CreditScoreOtpResponse creditScoreOtpResponseFromJson(String str) => CreditScoreOtpResponse.fromJson(json.decode(str));

String creditScoreOtpResponseToJson(CreditScoreOtpResponse data) => json.encode(data.toJson());

class CreditScoreOtpResponse {
  bool status;
  dynamic data;
  String message;

  CreditScoreOtpResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CreditScoreOtpResponse.fromJson(Map<String, dynamic> json) => CreditScoreOtpResponse(
    status: json["status"],
    data: json["data"] is List? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
        : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data.toJson(),
    "message": message,
  };
}

class Data {
  String? stageOneId;
  String? stageTwoId;
  String? customerId;
  String? mobileNo;
  String? categoryId;
  String? productId;

  Data({
    required this.stageOneId,
    required this.stageTwoId,
    required this.customerId,
    required this.mobileNo,
    required this.categoryId,
    required this.productId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    stageOneId: json["stage_one_id"] as String?,
    stageTwoId: json["stage_two_id"] as String?,
    customerId: json["customer_id"] as String?,
    mobileNo: json["mobile_no"] as String?,
    categoryId: json["category_id"] as String?,
    productId: json["product_id"] as String?,
  );

  Map<String, dynamic> toJson() => {
    "stage_one_id": stageOneId,
    "stage_two_id": stageTwoId,
    "customer_id": customerId,
    "mobile_no": mobileNo,
    "category_id": categoryId,
    "product_id": productId,
  };
}