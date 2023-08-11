
import 'dart:convert';

OperatorModel operatorModelFromJson(String str) => OperatorModel.fromJson(json.decode(str));

String operatorModelToJson(OperatorModel data) => json.encode(data.toJson());

class OperatorModel{
  int responsecode;
  bool status;
  List<Operator>? operatorList = [];

  OperatorModel({required this.responsecode, required this.status, required this.operatorList});

  factory OperatorModel.fromJson(dynamic json){
    return OperatorModel(
        responsecode: json['responsecode'],
        status: json['status'],
        operatorList: json["data"] == null ? [] :
          List<Operator>.from(json["data"].map((x) => Operator.fromJson(x))));
  }

  Map<String, dynamic> toJson() => {
    "responsecode": responsecode,
    "status":status,
    "data": operatorList == null ? [] : List<dynamic>.from(operatorList!.map((x) => x)),
  };
}

class Operator{
  String? id;
  String? name;
  String? category;

  Operator({required this.id, required this.name, required this.category});

  factory Operator.fromJson(dynamic json){
    return Operator(
        id: json['id'],
        name: json['name'],
        category: json['category']);
  }

}