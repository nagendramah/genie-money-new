// To parse this JSON data, do
//
//     final pincodeResponse = pincodeResponseFromJson(jsonString);

import 'dart:convert';

PincodeResponse pincodeResponseFromJson(String str) => PincodeResponse.fromJson(json.decode(str));

String pincodeResponseToJson(PincodeResponse data) => json.encode(data.toJson());

class PincodeResponse {
  bool status;
  List<Data> data;
  String message;

  PincodeResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory PincodeResponse.fromJson(Map<String, dynamic> json) => PincodeResponse(
    status: json["status"],
    data: List<Data>.from(json["data"].map((x) => Data.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Data {
  int id;
  int pincode;

  Data({
    required this.id,
    required this.pincode,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    pincode: json["pincode"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "pincode": pincode,
  };
}
