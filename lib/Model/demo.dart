class Demo {
  Demo({
      this.status, 
      this.error, 
      this.messages, 
      this.offerlist, 
      this.companyStatus,});

  Demo.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['offerlist'] != null) {
      offerlist = [];
      json['offerlist'].forEach((v) {
        offerlist?.add(Offerlist.fromJson(v));
      });
    }
    if (json['company_status'] != null) {
      companyStatus = [];
      json['company_status'].forEach((v) {
        companyStatus?.add(CompanyStatus.fromJson(v));
      });
    }
  }
  int? status;
  dynamic error;
  Messages? messages;
  List<Offerlist>? offerlist;
  List<CompanyStatus>? companyStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (offerlist != null) {
      map['offerlist'] = offerlist?.map((v) => v.toJson()).toList();
    }
    if (companyStatus != null) {
      map['company_status'] = companyStatus?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class CompanyStatus {
  CompanyStatus({
      this.companyChatStatus,});

  CompanyStatus.fromJson(dynamic json) {
    companyChatStatus = json['company_chat_status'];
  }
  String? companyChatStatus;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['company_chat_status'] = companyChatStatus;
    return map;
  }

}

class Offerlist {
  Offerlist({
      this.id, 
      this.companyId, 
      this.branchId, 
      this.couponType, 
      this.companyDiscount, 
      this.comission, 
      this.customerDiscount, 
      this.discountDetail, 
      this.description, 
      this.arbDescription, 
      this.startDate, 
      this.endDate,});

  Offerlist.fromJson(dynamic json) {
    id = json['id'];
    companyId = json['company_id'];
    branchId = json['branch_id'];
    couponType = json['coupon_type'];
    companyDiscount = json['company_discount'];
    comission = json['comission'];
    customerDiscount = json['customer_discount'];
    discountDetail = json['discount_detail'];
    description = json['description'];
    arbDescription = json['arb_description'];
    startDate = json['start_date'];
    endDate = json['end_date'];
  }
  String? id;
  String? companyId;
  String? branchId;
  String? couponType;
  String? companyDiscount;
  String? comission;
  String? customerDiscount;
  String? discountDetail;
  String? description;
  String? arbDescription;
  String? startDate;
  String? endDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['company_id'] = companyId;
    map['branch_id'] = branchId;
    map['coupon_type'] = couponType;
    map['company_discount'] = companyDiscount;
    map['comission'] = comission;
    map['customer_discount'] = customerDiscount;
    map['discount_detail'] = discountDetail;
    map['description'] = description;
    map['arb_description'] = arbDescription;
    map['start_date'] = startDate;
    map['end_date'] = endDate;
    return map;
  }

}

class Messages {
  Messages({
      this.success,});

  Messages.fromJson(dynamic json) {
    success = json['success'];
  }
  String? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    return map;
  }

}