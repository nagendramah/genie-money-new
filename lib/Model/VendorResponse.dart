class VendorResponse {
  VendorResponse({
  this.status,
  this.error,
  this.messages,
  this.essId,});

  VendorResponse.fromJson(dynamic json) {
  status = json['status'];
  error = json['error'];
  messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  essId = json['ess_id '];
  }
  int? status;
  dynamic error;
  Messages? messages;
  int? essId;

  Map<String, dynamic> toJson() {
  final map = <String, dynamic>{};
  map['status'] = status;
  map['error'] = error;
  if (messages != null) {
  map['messages'] = messages?.toJson();
  }
  map['ess_id '] = essId;
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