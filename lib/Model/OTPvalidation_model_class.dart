// To parse this JSON data, do
//
//     final otpValidationResponse = otpValidationResponseFromJson(jsonString);

import 'dart:convert';

OtpValidationResponse otpValidationResponseFromJson(String str) => OtpValidationResponse.fromJson(json.decode(str));

String otpValidationResponseToJson(OtpValidationResponse data) => json.encode(data.toJson());

class OtpValidationResponse {
  bool status;
  dynamic data;
  String message;

  OtpValidationResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory OtpValidationResponse.fromJson(Map<String, dynamic> json) => OtpValidationResponse(
    status: json["status"],
    data:json["data"] is List? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
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
  String? customerProfileId;
  bool? creditScore;
  String? categoryId;

  Data({
    required this.customerProfileId,
    required this.creditScore,
    required this.categoryId,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    customerProfileId: json["customer_profile_id"] as String?,
    creditScore: json["credit_score"] as bool?,
    categoryId: json["category_id"]as String?,
  );

  Map<String, dynamic> toJson() => {
    "customer_profile_id": customerProfileId,
    "credit_score": creditScore,
    "category_id": categoryId,
  };
}
