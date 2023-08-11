// To parse this JSON data, do
//
//     final checkCustomerExistResponse = checkCustomerExistResponseFromJson(jsonString);

import 'dart:convert';

CheckCustomerExistResponse checkCustomerExistResponseFromJson(String str) => CheckCustomerExistResponse.fromJson(json.decode(str));

String checkCustomerExistResponseToJson(CheckCustomerExistResponse data) => json.encode(data.toJson());

class CheckCustomerExistResponse {
  bool status;
  dynamic data;
  String message;

  CheckCustomerExistResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CheckCustomerExistResponse.fromJson(Map<String, dynamic> json) => CheckCustomerExistResponse(
    status: json["status"],
    data: json["data"] is List? List<Data>.from(json["data"].map((x) => Data.fromJson(x)))
        : Data.fromJson(json["data"]),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data?.toJson(),
    "message": message,
  };
}

class Data {
  String mobileNo;
  ProfileDetails? profileDetails;

  Data({
    required this.mobileNo,
    required this.profileDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mobileNo: json["mobile_no"],
    profileDetails: json["profile_details"] != null
        ? ProfileDetails.fromJson(json["profile_details"])
        : null,
  );

  Map<String, dynamic> toJson() => {
    "mobile_no": mobileNo,
    "profile_details": profileDetails?.toJson(),
  };
}

class ProfileDetails {
  String customerId;
  bool creditScore;
  String categoryId;

  ProfileDetails({
    required this.customerId,
    required this.creditScore,
    required this.categoryId,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    customerId: json["customer_id"],
    creditScore: json["credit_score"],
    categoryId: json["category_id"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "credit_score": creditScore,
    "category_id": categoryId,
  };
}
