class QueryRemitterModel{
  bool status;
  int responseCode;
  String? stateresp;
  String? message;
  RemitterData? data;

  QueryRemitterModel({required this.status,required this.responseCode,required this.stateresp,
    required this.message,required this.data});

  factory QueryRemitterModel.fromJson(dynamic json){
    return QueryRemitterModel(
        status: json['status'],
        responseCode: json['response_code'],
        stateresp : json['stateresp'],
        message : json['message'],
        data : json['data']==null?null:RemitterData.fromJson(json['data'])
    );
  }
}

class RemitterData{
  String fname;
  String lname;
  String mobile;
  String status;
  int bank3Limit;
  int bank2Limit;
  int bank1Limit;

  RemitterData({required this.fname, required this.lname, required this.mobile, required this.status,
    required this.bank3Limit,required this.bank2Limit,required this.bank1Limit});

  factory RemitterData.fromJson(dynamic json){
    return RemitterData(
      fname: json['fname'],
      lname: json['lname'],
      mobile: json['mobile'],
      status: json['status'],
      bank3Limit: json['bank3_limit'],
      bank2Limit: json['bank2_limit'],
      bank1Limit: json['bank1_limit']
    );
  }
}