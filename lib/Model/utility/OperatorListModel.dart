class OperatorListModel{
  int responseCode;
  bool status;
  List<BillOperator> data;

  OperatorListModel({required this.responseCode,required this.status, required this.data});

  factory OperatorListModel.formJson(dynamic json){
    return OperatorListModel(
      responseCode: json['response_code'],
      status: json['status'],
      data: json['data']==null?[]:List<BillOperator>.from(json["data"].map((x) => BillOperator.fromJson(x)))
    );
  }
}

class BillOperator{
  String? id;
  String? name;
  String? category;
  String? viewbill;
  String? regex;
  String? displayname;
  String? ad1_d_name;
  String? ad1_name;
  String? ad1_regex;
  String? ad2_d_name;
  String? ad2_name;
  String? ad2_regex;
  String? ad3_d_name;
  String? ad3_name;
  String? ad3_regex;

  BillOperator({
    required this.id,
    required this.name,
    required this.category,
    required this.viewbill,
    required this.regex,
    required this.displayname,
    required this.ad1_d_name,
    required this.ad1_name,
    required this.ad1_regex,
    required this.ad2_d_name,
    required this.ad2_name,
    required this.ad2_regex,
    required this.ad3_d_name,
    required this.ad3_name,
    required this.ad3_regex
  });

  factory BillOperator.fromJson(dynamic json){
    return BillOperator(
        id:json['id'],
        name:json['name'],
        category:json['category'],
        viewbill:json['viewbill'],
        regex:json['regex'],
        displayname:json['displayname'],
        ad1_d_name:json['ad1_d_name'],
        ad1_name:json['ad1_name'],
        ad1_regex:json['ad1_regex'],
        ad2_d_name:json['ad2_d_name'],
        ad2_name:json['ad2_name'],
        ad2_regex:json['ad2_regex'],
        ad3_d_name:json['ad3_d_name'],
        ad3_name:json['ad3_name'],
        ad3_regex:json['ad3_regex']
    );
  }
}