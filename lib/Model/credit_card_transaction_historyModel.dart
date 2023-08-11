class CreditCardTransactionHistoryModel {
  CreditCardTransactionHistoryModel({
      this.status, 
      this.error, 
      this.messages, 
      this.list,});

  CreditCardTransactionHistoryModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list?.add(Listhistory.fromJson(v));
      });
    }
  }
  int? status;
  String? error;
  Messages? messages;
  List<Listhistory>? list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (list != null) {
      map['list'] = list?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Listhistory {
  Listhistory({
      this.hId, 
      this.userId, 
      this.holderName, 
      this.cardNo, 
      this.expDate, 
      this.amount, 
      this.remark, 
      this.mobileNo, 
      this.message, 
      this.status, 
      this.date_time,
      this.refId,});

  Listhistory.fromJson(dynamic json) {
    hId = json['h_id'];
    userId = json['user_id'];
    holderName = json['holder_name'];
    cardNo = json['card_no'];
    expDate = json['exp_date'];
    amount = json['amount'];
    remark = json['remark'];
    mobileNo = json['mobile_no'];
    message = json['message'];
    status = json['status'];
    refId = json['ref_id'];
    date_time = json['date_time'];
  }
  String? hId;
  String? userId;
  String? holderName;
  String? cardNo;
  String? expDate;
  String? amount;
  String? remark;
  String? mobileNo;
  dynamic message;
  dynamic status;
  String? refId;
  String? date_time;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['h_id'] = hId;
    map['user_id'] = userId;
    map['holder_name'] = holderName;
    map['card_no'] = cardNo;
    map['exp_date'] = expDate;
    map['amount'] = amount;
    map['remark'] = remark;
    map['mobile_no'] = mobileNo;
    map['message'] = message;
    map['status'] = status;
    map['ref_id'] = refId;
    map['date_time'] = date_time;
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