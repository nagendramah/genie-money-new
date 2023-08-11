class VersionModel {
  VersionModel({
      this.status, 
      this.error, 
      this.messages, 
      this.version,});

  VersionModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['version'] != null) {
      version = [];
      json['version'].forEach((v) {
        version?.add(Version.fromJson(v));
      });
    }
  }
  int? status;
  dynamic error;
  Messages? messages;
  List<Version>? version;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (version != null) {
      map['version'] = version?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Version {
  Version({
      this.versionNo, 
      this.path, 
      this.updateDate,});

  Version.fromJson(dynamic json) {
    versionNo = json['version_no'];
    path = json['path'];
    updateDate = json['update_date'];
  }
  String? versionNo;
  String? path;
  String? updateDate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['version_no'] = versionNo;
    map['path'] = path;
    map['update_date'] = updateDate;
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