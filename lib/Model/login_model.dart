/// status : 201
/// error : null
/// messages : {"success":"Login successfully"}
/// userdetail : {"userid":"1","name":"Subedar ","email":"yadav@gmail.com","phone":"9819941589"}

class Login_model {
  Login_model({
      int? status, 
      dynamic error, 
      Messages? messages, 
      Userdetail? userdetail,}){
    _status = status;
    _error = error;
    _messages = messages;
    _userdetail = userdetail;
}

  Login_model.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    _userdetail = json['userdetail'] != null ? Userdetail.fromJson(json['userdetail']) : null;
  }
  int? _status;
  dynamic _error;
  Messages? _messages;
  Userdetail? _userdetail;

  int? get status => _status;
  dynamic get error => _error;
  Messages? get messages => _messages;
  Userdetail? get userdetail => _userdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    if (_userdetail != null) {
      map['userdetail'] = _userdetail?.toJson();
    }
    return map;
  }

}

/// userid : "1"
/// name : "Subedar "
/// email : "yadav@gmail.com"
/// phone : "9819941589"

class Userdetail {
  Userdetail({
      String? userid, 
      String? name, 
      String? email, 
      String? phone,}){
    _userid = userid;
    _name = name;
    _email = email;
    _phone = phone;
}

  Userdetail.fromJson(dynamic json) {
    _userid = json['userid'];
    _name = json['name'];
    _email = json['email'];
    _phone = json['phone'];
  }
  String? _userid;
  String? _name;
  String? _email;
  String? _phone;

  String? get userid => _userid;
  String? get name => _name;
  String? get email => _email;
  String? get phone => _phone;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['userid'] = _userid;
    map['name'] = _name;
    map['email'] = _email;
    map['phone'] = _phone;
    return map;
  }

}

/// success : "Login successfully"

class Messages {
  Messages({
      String? success,}){
    _success = success;
}

  Messages.fromJson(dynamic json) {
    _success = json['success'];
  }
  String? _success;

  String? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }

}