/// Message : "Number of Post office(s) found: 3"
/// Status : "Success"
/// PostOffice : [{"Name":"Dahisar","Description":"","BranchType":"Sub Post Office","DeliveryStatus":"Delivery","Taluk":"Dahisar East","Circle":"Dahisar East","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","State":"Maharashtra","Country":"India"},{"Name":"Dahisar RS","Description":"","BranchType":"Sub Post Office","DeliveryStatus":"Non-Delivery","Taluk":"Dahisar West","Circle":"Dahisar West","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","State":"Maharashtra","Country":"India"},{"Name":"Ketkipada","Description":"","BranchType":"Branch Post Office","DeliveryStatus":"Non-Delivery","Taluk":"Dahisar East","Circle":"Dahisar East","District":"Mumbai","Division":"Mumbai  North West","Region":"Mumbai","State":"Maharashtra","Country":"India"}]

class Pincode_model {
  Pincode_model({
      String? message, 
      String? status, 
      List<PostOffice>? postOffice,}){
    _message = message;
    _status = status;
    _postOffice = postOffice;
}

  Pincode_model.fromJson(dynamic json) {
    _message = json['Message'];
    _status = json['Status'];
    if (json['PostOffice'] != null) {
      _postOffice = [];
      json['PostOffice'].forEach((v) {
        _postOffice?.add(PostOffice.fromJson(v));
      });
    }
  }
  String? _message;
  String? _status;
  List<PostOffice>? _postOffice;

  String? get message => _message;
  String? get status => _status;
  List<PostOffice>? get postOffice => _postOffice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Message'] = _message;
    map['Status'] = _status;
    if (_postOffice != null) {
      map['PostOffice'] = _postOffice?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// Name : "Dahisar"
/// Description : ""
/// BranchType : "Sub Post Office"
/// DeliveryStatus : "Delivery"
/// Taluk : "Dahisar East"
/// Circle : "Dahisar East"
/// District : "Mumbai"
/// Division : "Mumbai  North West"
/// Region : "Mumbai"
/// State : "Maharashtra"
/// Country : "India"

class PostOffice {
  PostOffice({
      String? name, 
      String? description, 
      String? branchType, 
      String? deliveryStatus, 
      String? taluk, 
      String? circle, 
      String? district, 
      String? division, 
      String? region, 
      String? state, 
      String? country,}){
    _name = name;
    _description = description;
    _branchType = branchType;
    _deliveryStatus = deliveryStatus;
    _taluk = taluk;
    _circle = circle;
    _district = district;
    _division = division;
    _region = region;
    _state = state;
    _country = country;
}

  PostOffice.fromJson(dynamic json) {
    _name = json['Name'];
    _description = json['Description'];
    _branchType = json['BranchType'];
    _deliveryStatus = json['DeliveryStatus'];
    _taluk = json['Taluk'];
    _circle = json['Circle'];
    _district = json['District'];
    _division = json['Division'];
    _region = json['Region'];
    _state = json['State'];
    _country = json['Country'];
  }
  String? _name;
  String? _description;
  String? _branchType;
  String? _deliveryStatus;
  String? _taluk;
  String? _circle;
  String? _district;
  String? _division;
  String? _region;
  String? _state;
  String? _country;

  String? get name => _name;
  String? get description => _description;
  String? get branchType => _branchType;
  String? get deliveryStatus => _deliveryStatus;
  String? get taluk => _taluk;
  String? get circle => _circle;
  String? get district => _district;
  String? get division => _division;
  String? get region => _region;
  String? get state => _state;
  String? get country => _country;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = _name;
    map['Description'] = _description;
    map['BranchType'] = _branchType;
    map['DeliveryStatus'] = _deliveryStatus;
    map['Taluk'] = _taluk;
    map['Circle'] = _circle;
    map['District'] = _district;
    map['Division'] = _division;
    map['Region'] = _region;
    map['State'] = _state;
    map['Country'] = _country;
    return map;
  }

}