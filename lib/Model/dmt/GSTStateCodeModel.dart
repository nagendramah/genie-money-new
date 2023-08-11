class GSTStateCodeListModel{
  List<GSTStateCodeModel>? list;

  GSTStateCodeListModel({required this.list});

  factory GSTStateCodeListModel.fromJson(dynamic json){
    return GSTStateCodeListModel(
      list: json["list"] == null ? [] :
      List<GSTStateCodeModel>.from(json["list"].map((x) => GSTStateCodeModel.fromJson(x))));

  }
}

class GSTStateCodeModel{
  String name;
  String code;
  String id;

  GSTStateCodeModel({required this.name,required this.code,required this.id});

  factory GSTStateCodeModel.fromJson(dynamic json){
    return GSTStateCodeModel(
        name: json['state_name'],
        code: json['aph_code'],
        id: json['gst_state']);
  }
}