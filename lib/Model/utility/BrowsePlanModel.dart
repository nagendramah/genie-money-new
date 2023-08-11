class BrowsePlanModel{
  bool? status;
  int? reponseCode;
  String? message;
  InfoModel? infoModel;

  BrowsePlanModel({this.status, this.reponseCode, this.message, this.infoModel});

  factory BrowsePlanModel.fromJson(dynamic json){
    return BrowsePlanModel(
      status: json['status'],
      reponseCode: json['response_code'],
      message: json['message'],
      infoModel: InfoModel.fromJson(json['info'])
    );
  }
}

class InfoModel{
  List<RechargeInfoModel>? fullTT;
  List<RechargeInfoModel>? topUp;
  List<RechargeInfoModel>? threeFourG;
  List<RechargeInfoModel>? twoG;
  List<RechargeInfoModel>? sms;
  List<RechargeInfoModel>? combo;
  List<RechargeInfoModel>? romaing;

  InfoModel({required this.fullTT, required this.topUp, required this.threeFourG,
    required this.twoG, required this.sms, required this.combo, required this.romaing});

  factory InfoModel.fromJson(dynamic json){
        return InfoModel(
          fullTT: json['FULLTT']==null?[]: List<RechargeInfoModel>.from(json['FULLTT'].map((model)=> RechargeInfoModel.fromJson(model))),
          topUp: json['TOPUP']==null?[]:List<RechargeInfoModel>.from(json['TOPUP'].map((model)=> RechargeInfoModel.fromJson(model))),
          threeFourG: json['3G/4G']==null?[]:List<RechargeInfoModel>.from(json['3G/4G'].map((model)=> RechargeInfoModel.fromJson(model))),
          twoG: json['2G']==null?[]:List<RechargeInfoModel>.from(json['2G'].map((model)=> RechargeInfoModel.fromJson(model))),
          sms: json['SMS']==null?[]:List<RechargeInfoModel>.from(json['SMS'].map((model)=> RechargeInfoModel.fromJson(model))),
          combo: json['COMBO']==null?[]:List<RechargeInfoModel>.from(json['COMBO'].map((model)=> RechargeInfoModel.fromJson(model))),
          romaing: json['Romaing']==null?[]:List<RechargeInfoModel>.from(json['Romaing'].map((model)=> RechargeInfoModel.fromJson(model)))
        );
  }
}

class RechargeInfoModel{
  String price;
  String desc;
  String validity;
  String lastUpdate;

  RechargeInfoModel({required this.price, required this.desc, required this.validity, required this.lastUpdate});

  factory RechargeInfoModel.fromJson(dynamic json){
    return RechargeInfoModel(
      price: json['rs'],
      desc: json['desc'],
      validity: json['validity'],
      lastUpdate: json['last_update']
    );
  }

}
