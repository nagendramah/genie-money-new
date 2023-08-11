class DropDownVendorsModel {
  DropDownVendorsModel({
    this.status,
    this.error,
    this.messages,
    this.category,});

  DropDownVendorsModel.fromJson(dynamic json) {
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
    this.categoryId,
    this.categoryName,
    this.categoryImg,});

  Category.fromJson(dynamic json) {
    categoryId = json['category_id'];
    categoryName = json['category_name'];
    categoryImg = json['category_img'];
  }
  String? categoryId;
  String? categoryName;
  String? categoryImg;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['category_id'] = categoryId;
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