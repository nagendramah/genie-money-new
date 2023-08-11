class LeadGenModel {
  LeadGenModel({
      this.status, 
      this.error, 
      this.messages, 
      this.details,});

  LeadGenModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    details = json['details'] != null ? Details.fromJson(json['details']) : null;
  }
  int? status;
  dynamic error;
  Messages? messages;
  Details? details;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (details != null) {
      map['details'] = details?.toJson();
    }
    return map;
  }

}

class Details {
  Details({
      this.id, 
      this.serviceType, 
      this.type, 
      this.userId, 
      this.bankName, 
      this.name, 
      this.linkAdhar, 
      this.phone, 
      this.customerType, 
      this.address, 
      this.pincode, 
      this.landmark, 
      this.state, 
      this.created,});

  Details.fromJson(dynamic json) {
    id = json['id'];
    serviceType = json['service_type'];
    type = json['type'];
    userId = json['user_id'];
    bankName = json['bank_name'];
    name = json['name'];
    linkAdhar = json['link_adhar'];
    phone = json['phone'];
    customerType = json['customer_type'];
    address = json['address'];
    pincode = json['pincode'];
    landmark = json['landmark'];
    state = json['state'];
    created = json['created'];
  }
  String? id;
  String? serviceType;
  String? type;
  String? userId;
  String? bankName;
  String? name;
  String? linkAdhar;
  String? phone;
  String? customerType;
  String? address;
  String? pincode;
  String? landmark;
  String? state;
  String? created;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['service_type'] = serviceType;
    map['type'] = type;
    map['user_id'] = userId;
    map['bank_name'] = bankName;
    map['name'] = name;
    map['link_adhar'] = linkAdhar;
    map['phone'] = phone;
    map['customer_type'] = customerType;
    map['address'] = address;
    map['pincode'] = pincode;
    map['landmark'] = landmark;
    map['state'] = state;
    map['created'] = created;
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