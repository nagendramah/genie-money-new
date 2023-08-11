import 'dart:convert';

CreateLeadProfile createLeadProfileFromJson(String str) =>
    CreateLeadProfile.fromJson(json.decode(str));

String createLeadProfileToJson(CreateLeadProfile data) =>
    json.encode(data.toJson());

class CreateLeadProfile {
  bool status;
  dynamic data;
  String message;

  CreateLeadProfile({
    required this.status,
    required this.data,
    required this.message,
  });

  factory CreateLeadProfile.fromJson(Map<String, dynamic> json) =>
      CreateLeadProfile(
        status: json["status"],
        data: json['data'] is Map<String, dynamic>
            ? Data.fromJson(json["data"])
            : List<dynamic>.from(json["data"]),
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": data is Data ? (data as Data).toJson() : List<dynamic>.from(data.map((x) => x)),
    "message": message,
  };
}

class Data {
  String mobileNo;
  ProfileDetails profileDetails;

  Data({
    required this.mobileNo,
    required this.profileDetails,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    mobileNo: json["mobile_no"],
    profileDetails: ProfileDetails.fromJson(json["profile_details"]),
  );

  Map<String, dynamic> toJson() => {
    "mobile_no": mobileNo,
    "profile_details": profileDetails.toJson(),
  };
}

class ProfileDetails {
  String customerId;
  String categoryId;
  dynamic productId;

  ProfileDetails({
    required this.customerId,
    required this.categoryId,
    this.productId,
  });

  factory ProfileDetails.fromJson(Map<String, dynamic> json) => ProfileDetails(
    customerId: json["customer_id"],
    categoryId: json["category_id"],
    productId: json["product_id"],
  );

  Map<String, dynamic> toJson() => {
    "customer_id": customerId,
    "category_id": categoryId,
    "product_id": productId,
  };
}