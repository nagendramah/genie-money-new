/*
import 'package:json_annotation/json_annotation.dart';

part 'Response.g.dart';

@JsonSerializable(genericArgumentFactories: true)
class ApiResponse<T> {
  @JsonKey(name: 'status')
  bool? status;
  @JsonKey(name: 'data')
   T? data;
  @JsonKey(name: 'message')
  Message? message;

  ApiResponse({this.status, this.data,this.message,});

  factory ApiResponse.fromJson(
    Map<String, dynamic> json,
    T Function(Object? json) fromJsonT,
  ) =>
      _$ApiResponseFromJson(json, fromJsonT);



  Map<String, dynamic> toJson(Object Function(T value) toJsonT) =>
      _$ApiResponseToJson(this, toJsonT);

}

class ISerializable {
  fromJson(Map<String, dynamic> json) {

  }
  Map<String, dynamic> toJson() {
    return {};
  }
}



@JsonSerializable()
class Message {
  @JsonKey(name: 'first_name')
  List<String>? firstName;
  @JsonKey(name: 'last_name')
  List<String>? lastName;
  @JsonKey(name: 'email')
  List<String>? email;
  @JsonKey(name: 'dob')
  List<String>? dob;
  @JsonKey(name: 'company')
  List<String>? company;
  @JsonKey(name: 'occupation')
  List<String>? occupation;
  @JsonKey(name: 'monthly_salary')
  List<String>? monthlySalary;
  @JsonKey(name: 'itr_amount')
  List<String>? itrAmount;
  @JsonKey(name: 'gender')
  List<String>? gender;
  @JsonKey(name: 'pincode')
  List<String>? pincode;
  @JsonKey(name: 'address')
  List<String>? address;
  @JsonKey(name: 'category')
  List<String>? category;
  @JsonKey(name: 'category_id')
  List<String>? categoryId;
  @JsonKey(name: 'customer_id')
  List<String>? customerId;
  @JsonKey(name: 'mobile_no')
  List<String>? mobileNo;

  Message({this.firstName,
    this.lastName,
    this.email,
    this.dob,
    this.company,
    this.occupation,
    this.monthlySalary,
    this.itrAmount,
    this.gender,
    this.pincode,
    this.address,
    this.category,
    this.categoryId,
    this.customerId,
    this.mobileNo});

  factory Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  Map<String, dynamic> toJson() => _$MessageToJson(this);

}

@JsonSerializable()
class SearchCompanyResponse implements ISerializable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'company_name')
  String? companyName;

  SearchCompanyResponse({this.id, this.companyName});

  factory SearchCompanyResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchCompanyResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SearchCompanyResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$SearchCompanyResponseFromJson(json);
  }
}

@JsonSerializable()
class OccupationResponse implements ISerializable {
  @JsonKey(name: 'id')
  int? id;
  @JsonKey(name: 'occu_title')
  String? occuTitle;

  OccupationResponse({this.id, this.occuTitle});

  factory OccupationResponse.fromJson(Map<String, dynamic> json) =>
      _$OccupationResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OccupationResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$OccupationResponseFromJson(json);
  }
}

@JsonSerializable()
class NewUserResponse implements ISerializable {
  @JsonKey(name: 'mobile_no')
  String? mobileNo;
  @JsonKey(name: 'profile_details')
  ProfileDetails? profileDetails;

  NewUserResponse({this.mobileNo, this.profileDetails});
  factory NewUserResponse.fromJson(Map<String, dynamic> json) =>
      _$NewUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NewUserResponseToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$NewUserResponseFromJson(json);
  }
}

@JsonSerializable()
class ProfileDetails implements ISerializable {
  @JsonKey(name: 'customer_id')
  String? customerId;
  @JsonKey(name: 'category_id')
  String? categoryId;
  @JsonKey(name: 'product_id')
  int? productId;

  ProfileDetails({this.customerId, this.categoryId, this.productId});

  factory ProfileDetails.fromJson(Map<String, dynamic> json) =>
      _$ProfileDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileDetailsToJson(this);

  @override
  fromJson(Map<String, dynamic> json) {
    return _$ProfileDetailsFromJson(json);
  }
}


*/
