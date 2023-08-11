class FeedBackResponseModel {
  FeedBackResponseModel({
      this.status, 
      this.error, 
      this.messages, 
      this.feedback,});

  FeedBackResponseModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    feedback = json['feedback'] != null ? Feedback.fromJson(json['feedback']) : null;
  }
  int? status;
  dynamic error;
  Messages? messages;
  Feedback? feedback;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (feedback != null) {
      map['feedback'] = feedback?.toJson();
    }
    return map;
  }

}

class Feedback {
  Feedback({
      this.title, 
      this.description, 
      this.userId,});

  Feedback.fromJson(dynamic json) {
    title = json['title'];
    description = json['description'];
    userId = json['user_id'];
  }
  String? title;
  String? description;
  String? userId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['description'] = description;
    map['user_id'] = userId;
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