class AccountOpeninModel {
  AccountOpeninModel({
      this.status, 
      this.responseCode, 
      this.type, 
      this.data, 
      this.message,});

  AccountOpeninModel.fromJson(dynamic json) {
    status = json['status'];
    responseCode = json['response_code'];
    type = json['type'];
    data = json['data'];
    message = json['message'];
  }
  bool? status;
  int? responseCode;
  String? type;
  String? data;
  String? message;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response_code'] = responseCode;
    map['type'] = type;
    map['data'] = data;
    map['message'] = message;
    return map;
  }

}