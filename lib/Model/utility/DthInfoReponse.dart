class DthInfoResponse {
  bool status= false;
  int responseCode=0;
  String? message;
  Info? info;

  DthInfoResponse({required this.status, required this.responseCode, required this.message, required this.info});

  factory DthInfoResponse.fromJson(dynamic json){
    return DthInfoResponse(
        status: json['status'],
        responseCode: json['response_code'],
        message: json['message'],
        info: Info.fromJson(json['info'])
    );
  }

}

class Info{

  double balance=0;
  String? customerName;
  String? nextRechargeDate;
  String? status;
  String? planname;
  int monthlyRecharge=0;

  Info({required this.balance, required this.customerName, required this.nextRechargeDate, required this.status,
  required this.planname, required this.monthlyRecharge
  });

  factory Info.fromJson(dynamic json){
    return Info(
        balance: json['Balance'],
        customerName: json['customerName'],
        nextRechargeDate: json['NextRechargeDate'],
        status: json['status'],
        planname: json['planname'],
        monthlyRecharge: json['MonthlyRecharge']
    );
  }
}