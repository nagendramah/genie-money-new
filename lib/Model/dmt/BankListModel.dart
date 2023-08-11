class BankListModel{
  List<BankModel> list;

  BankListModel({required this.list});

  factory BankListModel.fromJson(dynamic json){
    return BankListModel(
      list:json['list']==null?[]:
          List<BankModel>.from(json['list'].map((x)=> BankModel.fromJson(x)))
    );
  }
}
class BankModel{
 int bankid;
 String bankName;

 BankModel({required this.bankid,required this.bankName});

 factory BankModel.fromJson(dynamic json){
   return BankModel(
       bankid: json['bankid'],
       bankName: json['bankname']
   );
 }

}