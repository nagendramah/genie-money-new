// To parse this JSON data, do
//
//     final customerExistsResponse = customerExistsResponseFromJson(jsonString);

import 'dart:convert';

CustomerExistsResponse customerExistsResponseFromJson(String str) => CustomerExistsResponse.fromJson(json.decode(str));

String customerExistsResponseToJson(CustomerExistsResponse data) => json.encode(data.toJson());

class CustomerExistsResponse {
  bool status;
  Data data;
  String message;

  CustomerExistsResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CustomerExistsResponse.fromJson(Map<String, dynamic> json) => CustomerExistsResponse(
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
  String? mobileNo;
  ProfileDetails? profileDetails;

  Data({
     this.mobileNo,
     this.profileDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mobileNo: json["mobile_no"],
    profileDetails: ProfileDetails.fromJson(json["profile_details"]),
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
