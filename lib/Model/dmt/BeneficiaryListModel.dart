import 'package:flutter/material.dart';
import 'package:genie_money/Model/dmt/BeneficiaryDetailsModel.dart';

class BeneficiaryListModel with ChangeNotifier{
  bool status;
  int responseCode;
  String message;
  List<BeneficiaryDetailsModel> data;

  BeneficiaryListModel({required this.status,
    required this.responseCode,required  this.message,required this.data});

  factory BeneficiaryListModel.fromJson(dynamic json){
    return BeneficiaryListModel(
      status: json['status'],
      responseCode: json['response_code'],
      message: json['message'],
        data: json['data']==null?[]:
        List<BeneficiaryDetailsModel>.from(json['data'].map((x)=> BeneficiaryDetailsModel.fromJson(x)))
    );
  }
}