class Sss {
  Sss({
      this.status, 
      this.error, 
      this.messages, 
      this.userdetails,});

  Sss.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    userdetails = json['userdetails'] != null ? Userdetails.fromJson(json['userdetails']) : null;
  }
  int? status;
  dynamic error;
  Messages? messages;
  Userdetails? userdetails;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (userdetails != null) {
      map['userdetails'] = userdetails?.toJson();
    }
    return map;
  }

}

class Userdetails {
  Userdetails({
      this.basicinfo, 
      this.residentialinfo, 
      this.references,});

  Userdetails.fromJson(dynamic json) {
    basicinfo = json['basicinfo'];
    residentialinfo = json['residentialinfo'];
    references = json['references'];
  }
  String? basicinfo;
  String? residentialinfo;
  String? references;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['basicinfo'] = basicinfo;
    map['residentialinfo'] = residentialinfo;
    map['references'] = references;
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