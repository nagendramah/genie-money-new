// To parse this JSON data, do
//
//     final demomodel = demomodelFromJson(jsonString);

import 'dart:convert';

Demomodel demomodelFromJson(String str) => Demomodel.fromJson(json.decode(str));

String demomodelToJson(Demomodel data) => json.encode(data.toJson());

class Demomodel {
  Demomodel({
    required this.status,
    required this.data,
    required this.message,
  });

  bool status;
  List<Datum> data;
  String message;

  factory Demomodel.fromJson(Map<String, dynamic> json) => Demomodel(
    status: json["status"],
    data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "data": List<dynamic>.from(data.map((x) => x.toJson())),
    "message": message,
  };
}

class Datum {
  Datum({
    required this.id,
    required this.title,
  });

  int id;
  String title;

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}