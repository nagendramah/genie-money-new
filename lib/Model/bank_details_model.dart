/// status : 201
/// error : null
/// messages : {"success":"User info list successfully"}
/// bankdetail : [{"ub_id":"1","ub_userid":"6","ub_name":"icic","ub_acnumber":"3456789","ub_ifsccode":"ICICI2345","ub_upi":"icisd@222","ub_addeddate":"2022-03-03 10:36:01"},{"ub_id":"2","ub_userid":"6","ub_name":"Bank of Baroda ","ub_acnumber":"12345678901","ub_ifsccode":"bob123008","ub_upi":"test@bob","ub_addeddate":"2022-03-03 13:18:53"}]

class BankDetailsModel {
  BankDetailsModel({
      int? status, 
      dynamic error, 
      Messages? messages, 
      List<Bankdetail>? bankdetail,}){
    _status = status;
    _error = error;
    _messages = messages;
    _bankdetail = bankdetail;
}

  BankDetailsModel.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['bankdetail'] != null) {
      _bankdetail = [];
      json['bankdetail'].forEach((v) {
        _bankdetail?.add(Bankdetail.fromJson(v));
      });
    }
  }
  int? _status;
  dynamic _error;
  Messages? _messages;
  List<Bankdetail>? _bankdetail;

  int? get status => _status;
  dynamic get error => _error;
  Messages? get messages => _messages;
  List<Bankdetail>? get bankdetail => _bankdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    if (_bankdetail != null) {
      map['bankdetail'] = _bankdetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ub_id : "1"
/// ub_userid : "6"
/// ub_name : "icic"
/// ub_acnumber : "3456789"
/// ub_ifsccode : "ICICI2345"
/// ub_upi : "icisd@222"
/// ub_addeddate : "2022-03-03 10:36:01"

class Bankdetail {
  Bankdetail({
      String? ubId, 
      String? ubUserid, 
      String? ubName, 
      String? ubAcnumber, 
      String? ubIfsccode, 
      String? ubUpi, 
      String? ubAddeddate,}){
    _ubId = ubId;
    _ubUserid = ubUserid;
    _ubName = ubName;
    _ubAcnumber = ubAcnumber;
    _ubIfsccode = ubIfsccode;
    _ubUpi = ubUpi;
    _ubAddeddate = ubAddeddate;
}

  Bankdetail.fromJson(dynamic json) {
    _ubId = json['ub_id'];
    _ubUserid = json['ub_userid'];
    _ubName = json['ub_name'];
    _ubAcnumber = json['ub_acnumber'];
    _ubIfsccode = json['ub_ifsccode'];
    _ubUpi = json['ub_upi'];
    _ubAddeddate = json['ub_addeddate'];
  }
  String? _ubId;
  String? _ubUserid;
  String? _ubName;
  String? _ubAcnumber;
  String? _ubIfsccode;
  String? _ubUpi;
  String? _ubAddeddate;

  String? get ubId => _ubId;
  String? get ubUserid => _ubUserid;
  String? get ubName => _ubName;
  String? get ubAcnumber => _ubAcnumber;
  String? get ubIfsccode => _ubIfsccode;
  String? get ubUpi => _ubUpi;
  String? get ubAddeddate => _ubAddeddate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ub_id'] = _ubId;
    map['ub_userid'] = _ubUserid;
    map['ub_name'] = _ubName;
    map['ub_acnumber'] = _ubAcnumber;
    map['ub_ifsccode'] = _ubIfsccode;
    map['ub_upi'] = _ubUpi;
    map['ub_addeddate'] = _ubAddeddate;
    return map;
  }

}

/// success : "User info list successfully"

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