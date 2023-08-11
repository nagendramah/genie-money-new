/// status : 201
/// error : null
/// base_url : "http://165.22.219.135/geniemoney/public/userdoc"
/// messages : {"success":"User info list successfully"}
/// docdetail : [{"ud_id":"1","ud_userid":"6","ud_documentname":"test.jpg","ud_originalname":"","ud_type":"photo","ud_doctype":"front","ud_created":"2022-03-03 10:49:58"},{"ud_id":"2","ud_userid":"6","ud_documentname":"984059498_Screenshot 2022-03-02 at 4.39.31 PM.png","ud_originalname":"Screenshot 2022-03-02 at 4.39.31 PM.png","ud_type":"pan","ud_doctype":"front","ud_created":"2022-03-03 12:05:30"},{"ud_id":"3","ud_userid":"6","ud_documentname":"2070870948_Screenshot 2022-03-02 at 4.39.31 PM.png","ud_originalname":"Screenshot 2022-03-02 at 4.39.31 PM.png","ud_type":"pan","ud_doctype":"front","ud_created":"2022-03-03 12:06:36"},{"ud_id":"4","ud_userid":"6","ud_documentname":"851506235_Screenshot 2022-03-02 at 4.39.31 PM.png","ud_originalname":"Screenshot 2022-03-02 at 4.39.31 PM.png","ud_type":"pan","ud_doctype":"front","ud_created":"2022-03-03 12:20:44"},{"ud_id":"5","ud_userid":"6","ud_documentname":"333115502_scaled_image_picker1850162382.jpg","ud_originalname":"scaled_image_picker1850162382.jpg","ud_type":"emp_badge","ud_doctype":"front","ud_created":"2022-03-04 07:11:49"},{"ud_id":"6","ud_userid":"6","ud_documentname":"742746877_scaled_8b8fafbf-9d97-4a03-98cd-dbd34bd47105209263618.jpg","ud_originalname":"scaled_8b8fafbf-9d97-4a03-98cd-dbd34bd47105209263618.jpg","ud_type":"emp_badge","ud_doctype":"front","ud_created":"2022-03-04 07:12:45"},{"ud_id":"7","ud_userid":"6","ud_documentname":"976641904_test.pdf","ud_originalname":"test.pdf","ud_type":"emp_badge","ud_doctype":"front","ud_created":"2022-03-04 07:13:22"},{"ud_id":"8","ud_userid":"6","ud_documentname":"1886834710_scaled_image_picker1084930641.jpg","ud_originalname":"scaled_image_picker1084930641.jpg","ud_type":"adhar","ud_doctype":"both","ud_created":"2022-03-04 07:25:47"}]

class UserProofModel {
  UserProofModel({
      int? status, 
      dynamic error, 
      String? baseUrl, 
      Messages? messages, 
      List<Docdetail>? docdetail,}){
    _status = status;
    _error = error;
    _baseUrl = baseUrl;
    _messages = messages;
    _docdetail = docdetail;
}

  UserProofModel.fromJson(dynamic json) {
    _status = json['status'];
    _error = json['error'];
    _baseUrl = json['base_url'];
    _messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['docdetail'] != null) {
      _docdetail = [];
      json['docdetail'].forEach((v) {
        _docdetail?.add(Docdetail.fromJson(v));
      });
    }
  }
  int? _status;
  dynamic _error;
  String? _baseUrl;
  Messages? _messages;
  List<Docdetail>? _docdetail;

  int? get status => _status;
  dynamic get error => _error;
  String? get baseUrl => _baseUrl;
  Messages? get messages => _messages;
  List<Docdetail>? get docdetail => _docdetail;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = _status;
    map['error'] = _error;
    map['base_url'] = _baseUrl;
    if (_messages != null) {
      map['messages'] = _messages?.toJson();
    }
    if (_docdetail != null) {
      map['docdetail'] = _docdetail?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

/// ud_id : "1"
/// ud_userid : "6"
/// ud_documentname : "test.jpg"
/// ud_originalname : ""
/// ud_type : "photo"
/// ud_doctype : "front"
/// ud_created : "2022-03-03 10:49:58"

class Docdetail {
  Docdetail({
      String? udId, 
      String? udUserid, 
      String? udDocumentname, 
      String? udOriginalname, 
      String? udType, 
      String? udDoctype, 
      String? udCreated,}){
    _udId = udId;
    _udUserid = udUserid;
    _udDocumentname = udDocumentname;
    _udOriginalname = udOriginalname;
    _udType = udType;
    _udDoctype = udDoctype;
    _udCreated = udCreated;
}

  Docdetail.fromJson(dynamic json) {
    _udId = json['ud_id'];
    _udUserid = json['ud_userid'];
    _udDocumentname = json['ud_documentname'];
    _udOriginalname = json['ud_originalname'];
    _udType = json['ud_type'];
    _udDoctype = json['ud_doctype'];
    _udCreated = json['ud_created'];
  }
  String? _udId;
  String? _udUserid;
  String? _udDocumentname;
  String? _udOriginalname;
  String? _udType;
  String? _udDoctype;
  String? _udCreated;

  String? get udId => _udId;
  String? get udUserid => _udUserid;
  String? get udDocumentname => _udDocumentname;
  String? get udOriginalname => _udOriginalname;
  String? get udType => _udType;
  String? get udDoctype => _udDoctype;
  String? get udCreated => _udCreated;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ud_id'] = _udId;
    map['ud_userid'] = _udUserid;
    map['ud_documentname'] = _udDocumentname;
    map['ud_originalname'] = _udOriginalname;
    map['ud_type'] = _udType;
    map['ud_doctype'] = _udDoctype;
    map['ud_created'] = _udCreated;
    return map;
  }

}

/// success : "User info list successfully"

class Messages {
  Messages({
      String? success,}){
    _success = success;
}

  Messages.fromJson(dynamic json) {
    _success = json['success'];
  }
  String? _success;

  String? get success => _success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    return map;
  }

}