// To parse this JSON data, do
//
//     final personalDetails = personalDetailsFromJson(jsonString);

import 'dart:convert';

PersonalDetails personalDetailsFromJson(String str) =>
    PersonalDetails.fromJson(json.decode(str));

String personalDetailsToJson(PersonalDetails data) =>
    json.encode(data.toJson());

class PersonalDetails {
  PersonalDetails({
    required this.status,
    required this.error,
    required this.messages,
    required this.userdetails,
  });

  int status;
  dynamic error;
  Messages messages;
  Userdetails userdetails;

  factory PersonalDetails.fromJson(Map<String, dynamic> json) =>
      PersonalDetails(
        status: json["status"],
        error: json["error"],
        messages: Messages.fromJson(json["messages"]),
        userdetails: Userdetails.fromJson(json["userdetails"]),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "error": error,
        "messages": messages.toJson(),
        "userdetails": userdetails.toJson(),
      };
}

class Messages {
  Messages({
    required this.success,
  });

  String success;

  factory Messages.fromJson(Map<String, dynamic> json) => Messages(
        success: json["success"] ?? "",
      );

  Map<String, dynamic> toJson() => {
        "success": success,
      };
}

class Userdetails {
  Userdetails({
    required this.basicinfo,
    required this.residentialinfo,
    required this.references,
  });

  Basicinfo basicinfo;
  Residentialinfo residentialinfo;
  References references;

  factory Userdetails.fromJson(Map<String, dynamic> json) => Userdetails(
        basicinfo: Basicinfo.fromJson(json["basicinfo"]),
        residentialinfo:
            Residentialinfo.fromJson(json["residentialinfo"] ?? ""),
        references: References.fromJson(json["references"]),
      );

  Map<String, dynamic> toJson() => {
        "basicinfo": basicinfo.toJson(),
        "residentialinfo": residentialinfo.toJson(),
        "references": references.toJson(),
      };
}

class Basicinfo {
  Basicinfo({
    required this.id,
    required this.adminid,
    required this.code,
    required this.fullName,
    required this.email,
    required this.phone,
    required this.altMobileNo,
    required this.password,
    required this.passcode,
    required this.os,
    required this.userStatus,
    required this.phoneModel,
    required this.gender,
    required this.pincode,
    required this.address,
    required this.dob,
    required this.qualification,
    required this.pancard,
    required this.adharcard,
    required this.maritalstatus,
    required this.imeiNo,
    required this.demoImeiNo,
    required this.isFinance,
    required this.isFlInstalled,
    required this.location,
    required this.lat,
    required this.long,
    required this.tempPassword,
    required this.otp,
    required this.loginNo,
    required this.createdDate,
    required this.expireDate,
  });

  String id;
  dynamic adminid;
  dynamic code;
  String fullName;
  String email;
  String phone;
  String altMobileNo;
  String password;
  dynamic passcode;
  dynamic os;
  String userStatus;
  String phoneModel;
  String gender;
  String pincode;
  dynamic address;
  String dob;
  String qualification;
  String pancard;
  String adharcard;
  String maritalstatus;
  dynamic imeiNo;
  dynamic demoImeiNo;
  String isFinance;
  String isFlInstalled;
  dynamic location;
  String lat;
  String long;
  String tempPassword;
  String otp;
  String loginNo;
  DateTime createdDate;
  dynamic expireDate;

  factory Basicinfo.fromJson(Map<String, dynamic> json) => Basicinfo(
        id: json["id"],
        adminid: json["adminid"],
        code: json["code"],
        fullName: json["full_name"] ?? "",
        email: json["email"] ?? "",
        phone: json["phone"] ?? "",
        altMobileNo: json["alt_mobile_no"] ?? "",
        password: json["password"],
        passcode: json["passcode"],
        os: json["os"],
        userStatus: json["user_status"],
        phoneModel: json["phone_model"],
        gender: json["gender"] ?? "",
        pincode: json["pincode"] ?? "",
        address: json["address"],
        dob: json["dob"] ?? "",
        qualification: json["qualification"] ?? "",
        pancard: json["pancard"] ?? "",
        adharcard: json["adharcard"] ?? "",
        maritalstatus: json["maritalstatus"] ?? "",
        imeiNo: json["imei_no"],
        demoImeiNo: json["demo_imei_no"],
        isFinance: json["is_finance"],
        isFlInstalled: json["is_fl_installed"],
        location: json["location"],
        lat: json["lat"],
        long: json["long"],
        tempPassword: json["temp_password"],
        otp: json["otp"],
        loginNo: json["login_no"],
        createdDate: DateTime.parse(json["created_date"]),
        expireDate: json["expire_date"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "adminid": adminid,
        "code": code,
        "full_name": fullName,
        "email": email,
        "phone": phone,
        "alt_mobile_no": altMobileNo,
        "password": password,
        "passcode": passcode,
        "os": os,
        "user_status": userStatus,
        "phone_model": phoneModel,
        "gender": gender,
        "pincode": pincode,
        "address": address,
        "dob": dob,
        "qualification": qualification,
        "pancard": pancard,
        "adharcard": adharcard,
        "maritalstatus": maritalstatus,
        "imei_no": imeiNo,
        "demo_imei_no": demoImeiNo,
        "is_finance": isFinance,
        "is_fl_installed": isFlInstalled,
        "location": location,
        "lat": lat,
        "long": long,
        "temp_password": tempPassword,
        "otp": otp,
        "login_no": loginNo,
        "created_date": createdDate.toIso8601String(),
        "expire_date": expireDate,
      };
}

class References {
  References({
    required this.urfId,
    required this.urfUserid,
    required this.urfName1,
    required this.urfMobile1,
    required this.urfRelation1,
    required this.urfName2,
    required this.urfMobile2,
    required this.urfRelation2,
    required this.urfName3,
    required this.urfMobile3,
    required this.urfRelation3,
    required this.urfName4,
    required this.urfMobile4,
    required this.urfRelation4,
  });

  String urfId;
  String urfUserid;
  String urfName1;
  String urfMobile1;
  String urfRelation1;
  String urfName2;
  String urfMobile2;
  String urfRelation2;
  String urfName3;
  String urfMobile3;
  String urfRelation3;
  String urfName4;
  String urfMobile4;
  String urfRelation4;

  factory References.fromJson(Map<String, dynamic> json) => References(
        urfId: json["urf_id"],
        urfUserid: json["urf_userid"],
        urfName1: json["urf_name1"],
        urfMobile1: json["urf_mobile1"],
        urfRelation1: json["urf_relation1"],
        urfName2: json["urf_name2"],
        urfMobile2: json["urf_mobile2"],
        urfRelation2: json["urf_relation2"],
        urfName3: json["urf_name3"],
        urfMobile3: json["urf_mobile3"],
        urfRelation3: json["urf_relation3"],
        urfName4: json["urf_name4"],
        urfMobile4: json["urf_mobile4"],
        urfRelation4: json["urf_relation4"],
      );

  Map<String, dynamic> toJson() => {
        "urf_id": urfId,
        "urf_userid": urfUserid,
        "urf_name1": urfName1,
        "urf_mobile1": urfMobile1,
        "urf_relation1": urfRelation1,
        "urf_name2": urfName2,
        "urf_mobile2": urfMobile2,
        "urf_relation2": urfRelation2,
        "urf_name3": urfName3,
        "urf_mobile3": urfMobile3,
        "urf_relation3": urfRelation3,
        "urf_name4": urfName4,
        "urf_mobile4": urfMobile4,
        "urf_relation4": urfRelation4,
      };
}

class Residentialinfo {
  Residentialinfo({
    required this.urId,
    required this.urUserid,
    required this.urOwnership,
    required this.urResidingwith,
    required this.urNoofyears,
    required this.urAddress,
    required this.urLocality,
    required this.urPincode,
    required this.urCity,
    required this.urState,
    required this.urSame,
  });

  String urId;
  String urUserid;
  dynamic urOwnership;
  dynamic urResidingwith;
  dynamic urNoofyears;
  dynamic urAddress;
  dynamic urLocality;
  dynamic urPincode;
  dynamic urCity;
  dynamic urState;
  String urSame;

  factory Residentialinfo.fromJson(Map<String, dynamic> json) =>
      Residentialinfo(
        urId: json["ur_id"],
        urUserid: json["ur_userid"],
        urOwnership: json["ur_ownership"],
        urResidingwith: json["ur_residingwith"],
        urNoofyears: json["ur_noofyears"],
        urAddress: json["ur_address"],
        urLocality: json["ur_locality"],
        urPincode: json["ur_pincode"],
        urCity: json["ur_city"],
        urState: json["ur_state"],
        urSame: json["ur_same"],
      );

  get permanentAddress => null;

  get permanentLocality => null;

  Map<String, dynamic> toJson() => {
        "ur_id": urId,
        "ur_userid": urUserid,
        "ur_ownership": urOwnership,
        "ur_residingwith": urResidingwith,
        "ur_noofyears": urNoofyears,
        "ur_address": urAddress,
        "ur_locality": urLocality,
        "ur_pincode": urPincode,
        "ur_city": urCity,
        "ur_state": urState,
        "ur_same": urSame,
      };
}
