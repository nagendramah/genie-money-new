class BrokerResponseModel {
  BrokerResponseModel({
      this.status, 
      this.error, 
      this.messages, 
      this.userdetail,});

  BrokerResponseModel.fromJson(dynamic json) {
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
      this.bankName, 
      this.email, 
      this.name, 
      this.phone, 
      this.pincode, 
      this.userId, 
      this.dematId,});

  Userdetail.fromJson(dynamic json) {
    bankName = json['bank_name'];
    email = json['email'];
    name = json['name'];
    phone = json['phone'];
    pincode = json['pincode'];
    userId = json['user_id'];
    dematId = json['demat_id'];
  }
  String? bankName;
  String? email;
  String? name;
  String? phone;
  String? pincode;
  String? userId;
  int? dematId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['bank_name'] = bankName;
    map['email'] = email;
    map['name'] = name;
    map['phone'] = phone;
    map['pincode'] = pincode;
    map['user_id'] = userId;
    map['demat_id'] = dematId;
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