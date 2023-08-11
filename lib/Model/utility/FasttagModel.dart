class FasttagModel{
  int responseCode =1;
  bool status=false;
  List<FasttagData>? flasttagDataList;

  FasttagModel({required this.responseCode, required this.status, required this.flasttagDataList});

  factory FasttagModel.fromJson(dynamic json){
    return FasttagModel(
        responseCode: json['response_code'],
        status: json['status'],
        flasttagDataList: json['data']==null?[]:(List<FasttagData>.from(json['data'].map((x)=> FasttagData.fromJson(x))))
    );
  }
}

class FasttagData{
  String? id;
  String? bankname;
  String? category;
  String? viewbill;
  String? regex;
  String? displayname;
  String? ad1_regex;

  FasttagData({required this.id,required this.bankname, required this.category, required this.viewbill,
  required this.regex, required this.displayname, required this.ad1_regex});

  factory FasttagData.fromJson(dynamic json){
    return FasttagData(id: json['id'],
        bankname: json['name'],
        category: json['category'],
        viewbill: json['viewbill'],
        regex: json['regex'],
        displayname: json['displayname'],
        ad1_regex: json['ad1_regex']);
  }
}

class FasttagDetail{
  int? responseCode;
  bool? status;
  int? amount;
  String? name;
  String? dueDate;
  String message;
  //FasttagBillDetails? billDetails;

  FasttagDetail({required this.responseCode, required this.status, required this.amount,
    required this.name, required this.dueDate, required this.message//, required this.billDetails
  });

  factory FasttagDetail.fromJson(dynamic json){
    return FasttagDetail(
        responseCode: json['response_code'],
        status: json['status'],
        amount: json['amount'],
        name: json['name'],
        dueDate: json['duedate'],
        message: json['message']
        //billDetails: FasttagBillDetails.fromJson(json['bill_fetch']
        );
  }

}

class FasttagBillDetails{
  String? billAmount;
  String? billnetamount;
  String? dueDate;
  String? maxBillAmount;
  bool?  acceptPayment;
  bool? acceptPartPay;
  String? cellNumber;
  String? userName;

  FasttagBillDetails({required this.billAmount, required this.billnetamount, required this.dueDate,
  required this.maxBillAmount, required this.acceptPayment, required this.acceptPartPay,
    required this.cellNumber, required this.userName});

  factory FasttagBillDetails.fromJson(dynamic json){
    return FasttagBillDetails(
        billAmount: json['billAmount'],
        billnetamount: json['billnetamount'],
        dueDate: json['dueDate'],
        maxBillAmount: json['maxBillAmount'],
        acceptPayment: json['acceptPayment'],
        acceptPartPay: json['acceptPartPay'],
        cellNumber: json['cellNumber'],
        userName: json['userName']);
  }
}

class FastTagReponse{
  bool status= false;
  int  response_code=0;
  String? message;

  FastTagReponse({required this.status, required this.response_code, required this.message});

  factory FastTagReponse.fromJson(dynamic json){
    return FastTagReponse(
        status: json['status'],
        response_code: json['response_code'],
        message: json['message']);
  }
}