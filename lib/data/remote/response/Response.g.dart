/*
// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiResponse<T> _$ApiResponseFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    ApiResponse<T>(
      status: json['status'] as bool?,
      data: _$nullableGenericFromJson(json['data'], fromJsonT),
      message: json['message'] == null
          ? null
          : Message.fromJson(json['message'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ApiResponseToJson<T>(
  ApiResponse<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'status': instance.status,
      'data': _$nullableGenericToJson(instance.data, toJsonT),
      'message': instance.message,
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

Message _$MessageFromJson(Map<String, dynamic> json) => Message(
      firstName: (json['first_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      lastName: (json['last_name'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      email:
          (json['email'] as List<dynamic>?)?.map((e) => e as String).toList(),
      dob: (json['dob'] as List<dynamic>?)?.map((e) => e as String).toList(),
      company:
          (json['company'] as List<dynamic>?)?.map((e) => e as String).toList(),
      occupation: (json['occupation'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      monthlySalary: (json['monthly_salary'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      itrAmount: (json['itr_amount'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      gender:
          (json['gender'] as List<dynamic>?)?.map((e) => e as String).toList(),
      pincode:
          (json['pincode'] as List<dynamic>?)?.map((e) => e as String).toList(),
      address:
          (json['address'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: (json['category'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      categoryId: (json['category_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      customerId: (json['customer_id'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      mobileNo: (json['mobile_no'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'email': instance.email,
      'dob': instance.dob,
      'company': instance.company,
      'occupation': instance.occupation,
      'monthly_salary': instance.monthlySalary,
      'itr_amount': instance.itrAmount,
      'gender': instance.gender,
      'pincode': instance.pincode,
      'address': instance.address,
      'category': instance.category,
      'category_id': instance.categoryId,
      'customer_id': instance.customerId,
      'mobile_no': instance.mobileNo,
    };

SearchCompanyResponse _$SearchCompanyResponseFromJson(
        Map<String, dynamic> json) =>
    SearchCompanyResponse(
      id: json['id'] as int?,
      companyName: json['company_name'] as String?,
    );

Map<String, dynamic> _$SearchCompanyResponseToJson(
        SearchCompanyResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'company_name': instance.companyName,
    };

OccupationResponse _$OccupationResponseFromJson(Map<String, dynamic> json) =>
    OccupationResponse(
      id: json['id'] as int?,
      occuTitle: json['occu_title'] as String?,
    );

Map<String, dynamic> _$OccupationResponseToJson(OccupationResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'occu_title': instance.occuTitle,
    };

NewUserResponse _$NewUserResponseFromJson(Map<String, dynamic> json) =>
    NewUserResponse(
      mobileNo: json['mobile_no'] as String?,
      profileDetails: json['profile_details'] == null
          ? null
          : ProfileDetails.fromJson(
              json['profile_details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$NewUserResponseToJson(NewUserResponse instance) =>
    <String, dynamic>{
      'mobile_no': instance.mobileNo,
      'profile_details': instance.profileDetails,
    };

ProfileDetails _$ProfileDetailsFromJson(Map<String, dynamic> json) =>
    ProfileDetails(
      customerId: json['customer_id'] as String?,
      categoryId: json['category_id'] as String?,
      productId: json['product_id'] as int?,
    );

Map<String, dynamic> _$ProfileDetailsToJson(ProfileDetails instance) =>
    <String, dynamic>{
      'customer_id': instance.customerId,
      'category_id': instance.categoryId,
      'product_id': instance.productId,
    };
*/
