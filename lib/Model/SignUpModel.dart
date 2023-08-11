class SignUpModel {
  SignUpModel({
      this.status, 
      this.error, 
      this.messages, 
      this.userdetail,});

  SignUpModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    userdetail = json['userdetail'] != null ? Userdetail.fromJson(json['userdetail']) : null;
  }
  int? status;
  dynamic error;
  Messages? messages;
  Userdetail? userdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (userdetail != null) {
      map['userdetail'] = userdetail?.toJson();
    }
    return map;
  }

}

class Userdetail {
  Userdetail({
      this.phone, 
      this.email, 
      this.password, 
      this.code, 
      this.imeiNo, 
      this.instatallationDate, 
      this.os, 
      this.phoneModel, 
      this.lat, 
      this.long, 
      this.location, 
      this.userRefer, 
      this.referBy, 
      this.userid,});

  Userdetail.fromJson(dynamic json) {
    phone = json['phone'];
    email = json['email'];
    password = json['password'];
    code = json['code'];
    imeiNo = json['imei_no'];
    instatallationDate = json['instatallation_date'];
    os = json['os'];
    phoneModel = json['phone_model'];
    lat = json['lat'];
    long = json['long'];
    location = json['location'];
    userRefer = json['user_refer'];
    referBy = json['refer_by'];
    userid = json['userid'];
  }
  String? phone;
  String? email;
  String? password;
  String? code;
  String? imeiNo;
  dynamic instatallationDate;
  String? os;
  String? phoneModel;
  String? lat;
  String? long;
  String? location;
  String? userRefer;
  String? referBy;
  int? userid;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['phone'] = phone;
    map['email'] = email;
    map['password'] = password;
    map['code'] = code;
    map['imei_no'] = imeiNo;
    map['instatallation_date'] = instatallationDate;
    map['os'] = os;
    map['phone_model'] = phoneModel;
    map['lat'] = lat;
    map['long'] = long;
    map['location'] = location;
    map['user_refer'] = userRefer;
    map['refer_by'] = referBy;
    map['userid'] = userid;
    return map;
  }

}

class Messages {
  Messages({
      this.success,});

  Messages.fromJson(dynamic json) {
    success = json['success'];
  }
  String? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    return map;
  }

}