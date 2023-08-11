import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/utility/pay_statusModel.dart';
import 'package:genie_money/Model/utility/pay_statusModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'pay_statusModel.dart';

class ApiServicesss{
  late String hmsg;
  Future <LoginApiResponssse> apiCallLoginss(Map<String,dynamic>paramss) async{
    var url = Uri.parse('https://paysprint.in/service-api/api/v1/service/cc-payment/ccpayment/paybill');
    var response = await http.post(url, headers: {"Content-Type": "application/json",
      "Token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0aW1lc3RhbXAiOjE2NTEyOTkxNDMsInBhcnRuZXJJZCI6IlBTMDA2NzYiLCJyZXFpZCI6IldFVVJZSEdGIn0.3RK_Ws3VkKJGgW8o9h818JwIWLjRpGCd7CZdK_Z0LaE",
      "Authorisedkey":"OGE4NzE4NTk3NzZkZjgzNzA0NDk3MjU0MGFmMjFmMzk="},
        body: json.encode(paramss));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    final int code =  response.statusCode;

    var data = jsonDecode(response.body);
    //   print("aaaa:"+data);

    return LoginApiResponssse(message: data["message"],
        response_code: data["response_code"],
        status: data["status"],
        datareq: data.fromjson(data["data"]),
    );
  }


}

class LoginApiResponssse  {

  final String? message;
  final bool? status;
  final int?   response_code;
  final data? datareq;


  LoginApiResponssse({this.message,this.response_code,this.datareq,this.status});
}

class data{
  String? txnid ;
  String? refid ;
  String? name ;
  String? mobile ;
  String? card_number ;
  String? amount ;
  String? charge ;
  String? network ;
  String? utr ;
  String? remarks ;
  String? dateadded ;
  String? status ;


  data({required this.txnid,this.refid,this.name,this.mobile,
    this.card_number,this.amount,this.charge,this.network,this.utr,this.remarks,this.dateadded,this.status});


  factory data.fromjson(dynamic json){
    return data(
      txnid: json["txnid"],
      refid: json["refid"],
      name: json["name"],
      mobile: json["mobile"],
      card_number: json["card_number"],
      amount: json["amount"],
      charge: json["charge"],
      network: json["network"],
      utr: json["utr"],
      remarks: json["remarks"],
      dateadded: json["dateadded"],
      status: json["status"],


    );
  }
}

