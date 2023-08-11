class TranscationModel{
  bool status= false;
  int? response_code=0;
  String? ackno;
  String? utr;
  int? txn_status= 0;
  String? benename;
  String? remarks;
  String? message;
  String? customercharge;
  String? gst;
  String? tds;
  String? netcommission;
  String? remitter;
  String? account_number;
  String? paysprint_share;
  String? txn_amount;
  double? balance=0.0;

  TranscationModel({required this.status, required this.response_code, required this.ackno, required this.utr,
        required this.txn_status, required this.benename, required this.remarks, required this.message,
        required this.customercharge, required this.gst, required this.tds, required this.netcommission,
        required this.remitter, required this.account_number, required this.paysprint_share, required this.txn_amount,
        required this.balance});


  factory TranscationModel.fromJson(dynamic json){
    return TranscationModel(
        status: json['status'],
        response_code: json['response_code'],
        ackno: json['ackno'],
        utr: json['utr'],
        txn_status: json['txn_status'],
        benename: json['benename'],
        remarks: json['remarks'],
        message: json['message'],
        customercharge: json['customercharge'],
        gst: json['gst'],
        tds: json['tds'],
        netcommission: json['netcommission'],
        remitter: json['remitter'],
        account_number: json['account_number'],
        paysprint_share: json['paysprint_share'],
        txn_amount: json['txn_amount'],
        balance: json['balance']);
  }

}