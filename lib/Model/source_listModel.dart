class SourceListModel {
    SourceListModel({
      this.status, 
      this.responseCode, 
      this.data,});

  SourceListModel.fromJson(dynamic json) {
    status = json['status'];
    responseCode = json['response_code'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  int? responseCode;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response_code'] = responseCode;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.cities,});

  Data.fromJson(dynamic json) {
    if (json['cities'] != null) {
      cities = [];
      json['cities'].forEach((v) {
        cities?.add(Cities.fromJson(v));
      });
    }
  }
  List<Cities>? cities;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (cities != null) {
      map['cities'] = cities?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Cities {
  Cities({
      this.id, 
      this.latitude, 
      this.locationType, 
      this.longitude, 
      this.name, 
      this.state, 
      this.stateId,});

  Cities.fromJson(dynamic json) {
    id = json['id'];
    latitude = json['latitude'];
    locationType = json['locationType'];
    longitude = json['longitude'];
    name = json['name'];
    state = json['state'];
    stateId = json['stateId'];
  }
  String? id;
  String? latitude;
  String? locationType;
  String? longitude;
  String? name;
  String? state;
  String? stateId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['latitude'] = latitude;
    map['locationType'] = locationType;
    map['longitude'] = longitude;
    map['name'] = name;
    map['state'] = state;
    map['stateId'] = stateId;
    return map;
  }

}