class SubCategoryModel {
  SubCategoryModel({
    this.status,
    this.error,
    this.messages,
    this.category,});

  SubCategoryModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['category'] != null) {
      category = [];
      json['category'].forEach((v) {
        category?.add(Category.fromJson(v));
      });
    }
  }
  int? status;
  dynamic error;
  Messages? messages;
  List<Category>? category;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (category != null) {
      map['category'] = category?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Category {
  Category({
    this.essId,
    this.userId,
    this.categoryId,
    this.password,
    this.ad1,
    this.ad2,
    this.ad3,
    this.ad4,
    this.merchantName,
    this.merchantType,
    this.ifOther,
    this.nameOfOwner,
    this.phone,
    this.email,
    this.address,
    this.address2,
    this.city,
    this.gst,
    this.state,
    this.pincode,
    this.bankName,
    this.branch,
    this.account,
    this.ifscCode,
    this.upiId,
    this.txnId,
    this.remark,
    this.tempPassword,
    this.point,
    this.craeted,
    this.categoryName,
    this.categoryImg,});

  Category.fromJson(dynamic json) {
    essId = json['ess_id'];
    userId = json['user_id'];
    categoryId = json['category_id'];
    password = json['password'];
    ad1 = json['ad_1'];
    ad2 = json['ad_2'];
    ad3 = json['ad_3'];
    ad4 = json['ad_4'];
    merchantName = json['merchant_name'];
    merchantType = json['merchant_type'];
    ifOther = json['if_other'];
    nameOfOwner = json['name_of_owner'];
    phone = json['phone'];
    email = json['email'];
    address = json['address'];
    address2 = json['address2'];
    city = json['city'];
    gst = json['gst'];
    state = json['state'];
    pincode = json['pincode'];
    bankName = json['bank_name'];
    branch = json['Branch'];
    account = json['account'];
    ifscCode = json['ifsc_code'];
    upiId = json['upi_id'];
    txnId = json['txn_id'];
    remark = json['remark'];
    tempPassword = json['temp_password'];
    point = json['point'];
    craeted = json['craeted'];
    categoryName = json['category_name'];
    categoryImg = json['category_img'];
  }
  String? essId;
  String? userId;
  String? categoryId;
  String? password;
  String? ad1;
  String? ad2;
  String? ad3;
  String? ad4;
  String? merchantName;
  String? merchantType;
  String? ifOther;
  String? nameOfOwner;
  String? phone;
  String? email;
  String? address;
  String? address2;
  String? city;
  String? gst;
  String? state;
  String? pincode;
  String? bankName;
  String? branch;
  String? account;
  String? ifscCode;
  String? upiId;
  String? txnId;
  String? remark;
  String? tempPassword;
  String? point;
  String? craeted;
  String? categoryName;
  String? categoryImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ess_id'] = essId;
    map['user_id'] = userId;
    map['category_id'] = categoryId;
    map['password'] = password;
    map['ad_1'] = ad1;
    map['ad_2'] = ad2;
    map['ad_3'] = ad3;
    map['ad_4'] = ad4;
    map['merchant_name'] = merchantName;
    map['merchant_type'] = merchantType;
    map['if_other'] = ifOther;
    map['name_of_owner'] = nameOfOwner;
    map['phone'] = phone;
    map['email'] = email;
    map['address'] = address;
    map['address2'] = address2;
    map['city'] = city;
    map['gst'] = gst;
    map['state'] = state;
    map['pincode'] = pincode;
    map['bank_name'] = bankName;
    map['Branch'] = branch;
    map['account'] = account;
    map['ifsc_code'] = ifscCode;
    map['upi_id'] = upiId;
    map['txn_id'] = txnId;
    map['remark'] = remark;
    map['temp_password'] = tempPassword;
    map['point'] = point;
    map['craeted'] = craeted;
    map['category_name'] = categoryName;
    map['category_img'] = categoryImg;
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