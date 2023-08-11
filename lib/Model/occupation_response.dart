// To parse this JSON data, do
//
//     final occupationResponse = occupationResponseFromJson(jsonString);

import 'dart:convert';

OccupationResponse occupationResponseFromJson(String str) => OccupationResponse.fromJson(json.decode(str));

String occupationResponseToJson(OccupationResponse data) => json.encode(data.toJson());

class OccupationResponse {
  bool status;
  List<Data> data;
  String message;

  OccupationResponse({
    required this.status,
    required this.data,
    required this.message,
  });

  factory OccupationResponse.fromJson(Map<String, dynamic> json) => OccupationResponse(
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
  String occuTitle;

  Data({
    required this.id,
    required this.occuTitle,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["id"],
    occuTitle: json["occu_title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "occu_title": occuTitle,
  };
}
