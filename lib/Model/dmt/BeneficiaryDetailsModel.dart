import 'package:flutter/material.dart';

class BeneficiaryDetailsModel with ChangeNotifier{
  String beneficiaryId;
  String bankId;
  String bankName;
  String name;
  String accno;
  String ifsc;
  String varified;
  String banktype;
  bool patym = false;

  BeneficiaryDetailsModel({required this.beneficiaryId,
    required this.bankId,
    required this.bankName,
    required this.name,
    required this.accno,
    required this.ifsc,
    required this.varified,
    required this.banktype,
    required this.patym});

  factory BeneficiaryDetailsModel.fromJson(dynamic json){
    return BeneficiaryDetailsModel(
      beneficiaryId: json['bene_id'],
      bankId: json['bankid'],
      bankName: json['bankname'],
      name: json['name'],
      accno: json['accno'],
      ifsc: json['ifsc'],
      varified: json['verified'],
      banktype: json['banktype'],
      patym: json['paytm'],
    );
  }
}