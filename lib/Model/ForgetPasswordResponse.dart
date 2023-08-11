class ForgetPasswordResponse {
  ForgetPasswordResponse({
      this.status, 
      this.error, 
      this.messages,});

  ForgetPasswordResponse.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
  }
  int? status;
  int? error;
  Messages? messages;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    return map;
  }

}

class Messages {
  Messages({
      this.error,});

  Messages.fromJson(dynamic json) {
    error = json['error'];
  }
  String? error;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['error'] = error;
    return map;
  }

}