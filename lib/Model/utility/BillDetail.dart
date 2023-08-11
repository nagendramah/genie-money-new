class BillDetail{
  int response_code;
  bool status = false;
  int amount;
  String name;
  String duedate;
  Bill bill_fetch;
  String message;

  BillDetail({required this.response_code, required this.status, required this.amount, required this.name,
  required this.duedate, required this.bill_fetch, required this.message});

  factory BillDetail.fromJson(dynamic json){
    return BillDetail(
        response_code: json['response_code'],
        status: json['status'],
        amount: json['amount'],
        name: json['name'],
        duedate: json['duedate'],
        bill_fetch: Bill.fromJson(json['bill_fetch']),
        message: json['message']);
  }
}

class Bill{
  int billAmount=0;
  //String? billnetamount;
  //String? billdate;
  String? dueDate;
  /*bool acceptPayment = false;
  bool acceptPartPay = false;
  String? cellNumber;*/
  String? userName;

  /*Bill({required this.billAmount, required this.billnetamount, required this.billdate, required this.dueDate,
  required this.acceptPayment, required this.acceptPartPay, required this.cellNumber, required this.userName});*/

  Bill({required this.billAmount,  required this.dueDate,  required this.userName});

  factory Bill.fromJson(dynamic json){
    return Bill(
        billAmount: json['amount'],
        //billnetamount: json['billnetamount'],
        //billdate: json['billdate'],
        dueDate: json['duedate'],
       /* acceptPayment: json['acceptPayment'],
        acceptPartPay: json['acceptPartPay'],
        cellNumber: json['cellNumber'],*/
        userName: json['name']);
  }
}

class BillDetailsLPG{
  int response_code= 1;
  bool status = true;
  int amount = 0;
  String name="";
  String message="";

  BillDetailsLPG({required this.response_code,required this.status,required this.amount,
  required this.name,required this.message});

  factory BillDetailsLPG.fromJson(dynamic json){
    return BillDetailsLPG(
      response_code:json['response_code'],
      status:json['status'],
      amount:json['amount'],
      name:json['name'],
      message:json['message']
    );

  }
}

class Response{

  bool status= false;
  int  response_code= 0;
  String? message;

  Response({required this.status, required this.response_code, required this.message});

  factory Response.fromJson(dynamic json){
    return Response(
        status: json['status'],
        response_code: json['response_code'],
        message: json['message']
    );
  }
}