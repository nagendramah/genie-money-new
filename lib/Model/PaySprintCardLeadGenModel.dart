class PaySprintCardLeadGenModel {
  PaySprintCardLeadGenModel({
      this.status, 
      this.responseCode, 
      this.message, 
      this.data,});

  PaySprintCardLeadGenModel.fromJson(dynamic json) {
    status = json['status'];
    responseCode = json['response_code'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? status;
  int? responseCode;
  String? message;
  Data? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['response_code'] = responseCode;
    map['message'] = message;
    if (data != null) {
      map['data'] = data?.toJson();
    }
    return map;
  }

}

class Data {
  Data({
      this.status, 
      this.applicationNo, 
      this.statusByTeleCaller, 
      this.statusByExecutive, 
      this.executiveUpdateDate, 
      this.executiveRemark, 
      this.reminderDate, 
      this.comment, 
      this.customerType, 
      this.sectorType, 
      this.sectorCategory, 
      this.monthlySalary, 
      this.hasSalarySlip, 
      this.officialEmail, 
      this.itrFiles, 
      this.ownerOf, 
      this.ownerProof, 
      this.companyName, 
      this.bankName, 
      this.exisitingCardName, 
      this.ageingOfCard, 
      this.existingBalance, 
      this.existingCardLimit, 
      this.hrName, 
      this.contactNo, 
      this.idProof, 
      this.otherIdProof, 
      this.addressProof, 
      this.otherAddressProof, 
      this.signatureProof, 
      this.otherSignatureProof, 
      this.hasPassportPhotos, 
      this.isMobileLinkedWithAadhar, 
      this.dobOnPanNo, 
      this.maritalStatus, 
      this.panNo, 
      this.aadharNo, 
      this.motherName, 
      this.fatherName, 
      this.personalEmail, 
      this.cardOn, 
      this.referenceNumber, 
      this.isTrxnComplete, 
      this.id, 
      this.categoryId, 
      this.currentAddress, 
      this.customerId, 
      this.createdBy, 
      this.teleCallerId, 
      this.channelPartnerId, 
      this.referenceDocument, 
      this.createdAt, 
      this.updatedAt,});

  Data.fromJson(dynamic json) {
    status = json['status'];
    applicationNo = json['applicationNo'];
    statusByTeleCaller = json['statusByTeleCaller'];
    statusByExecutive = json['statusByExecutive'];
    executiveUpdateDate = json['executiveUpdateDate'];
    executiveRemark = json['executiveRemark'];
    reminderDate = json['reminderDate'];
    comment = json['comment'];
    customerType = json['customerType'];
    sectorType = json['sectorType'];
    sectorCategory = json['sectorCategory'];
    monthlySalary = json['monthlySalary'];
    hasSalarySlip = json['hasSalarySlip'];
    officialEmail = json['officialEmail'];
    itrFiles = json['itrFiles'];
    ownerOf = json['ownerOf'];
    ownerProof = json['ownerProof'];
    companyName = json['companyName'];
    bankName = json['bankName'];
    exisitingCardName = json['exisitingCardName'];
    ageingOfCard = json['ageingOfCard'];
    existingBalance = json['existingBalance'];
    existingCardLimit = json['existingCardLimit'];
    hrName = json['hrName'];
    contactNo = json['contactNo'];
    if (json['idProof'] != null) {
      idProof = [];
      json['idProof'].forEach((v) {
      });
    }
    otherIdProof = json['otherIdProof'];
    if (json['addressProof'] != null) {
      addressProof = [];
      json['addressProof'].forEach((v) {
      });
    }
    otherAddressProof = json['otherAddressProof'];
    if (json['signatureProof'] != null) {
      signatureProof = [];
      json['signatureProof'].forEach((v) {
      });
    }
    otherSignatureProof = json['otherSignatureProof'];
    hasPassportPhotos = json['hasPassportPhotos'];
    isMobileLinkedWithAadhar = json['isMobileLinkedWithAadhar'];
    dobOnPanNo = json['dobOnPanNo'];
    maritalStatus = json['maritalStatus'];
    panNo = json['panNo'];
    aadharNo = json['aadharNo'];
    motherName = json['motherName'];
    fatherName = json['fatherName'];
    personalEmail = json['personalEmail'];
    if (json['cardOn'] != null) {
      cardOn = [];
      json['cardOn'].forEach((v) {
      });
    }
    referenceNumber = json['referenceNumber'];
    isTrxnComplete = json['isTrxnComplete'];
    id = json['_id'];
    categoryId = json['categoryId'];
    currentAddress = json['currentAddress'] != null ? CurrentAddress.fromJson(json['currentAddress']) : null;
    customerId = json['customerId'];
    createdBy = json['createdBy'];
    teleCallerId = json['teleCallerId'];
    channelPartnerId = json['channelPartnerId'];
    if (json['referenceDocument'] != null) {
      referenceDocument = [];
      json['referenceDocument'].forEach((v) {
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
  }
  bool? status;
  String? applicationNo;
  String? statusByTeleCaller;
  String? statusByExecutive;
  dynamic executiveUpdateDate;
  String? executiveRemark;
  dynamic reminderDate;
  String? comment;
  String? customerType;
  String? sectorType;
  String? sectorCategory;
  int? monthlySalary;
  bool? hasSalarySlip;
  String? officialEmail;
  int? itrFiles;
  String? ownerOf;
  String? ownerProof;
  String? companyName;
  String? bankName;
  String? exisitingCardName;
  String? ageingOfCard;
  int? existingBalance;
  int? existingCardLimit;
  String? hrName;
  String? contactNo;
  List<dynamic>? idProof;
  String? otherIdProof;
  List<dynamic>? addressProof;
  String? otherAddressProof;
  List<dynamic>? signatureProof;
  String? otherSignatureProof;
  bool? hasPassportPhotos;
  bool? isMobileLinkedWithAadhar;
  dynamic dobOnPanNo;
  String? maritalStatus;
  dynamic panNo;
  dynamic aadharNo;
  dynamic motherName;
  dynamic fatherName;
  dynamic personalEmail;
  List<dynamic>? cardOn;
  String? referenceNumber;
  bool? isTrxnComplete;
  String? id;
  String? categoryId;
  CurrentAddress? currentAddress;
  String? customerId;
  String? createdBy;
  String? teleCallerId;
  String? channelPartnerId;
  List<dynamic>? referenceDocument;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['applicationNo'] = applicationNo;
    map['statusByTeleCaller'] = statusByTeleCaller;
    map['statusByExecutive'] = statusByExecutive;
    map['executiveUpdateDate'] = executiveUpdateDate;
    map['executiveRemark'] = executiveRemark;
    map['reminderDate'] = reminderDate;
    map['comment'] = comment;
    map['customerType'] = customerType;
    map['sectorType'] = sectorType;
    map['sectorCategory'] = sectorCategory;
    map['monthlySalary'] = monthlySalary;
    map['hasSalarySlip'] = hasSalarySlip;
    map['officialEmail'] = officialEmail;
    map['itrFiles'] = itrFiles;
    map['ownerOf'] = ownerOf;
    map['ownerProof'] = ownerProof;
    map['companyName'] = companyName;
    map['bankName'] = bankName;
    map['exisitingCardName'] = exisitingCardName;
    map['ageingOfCard'] = ageingOfCard;
    map['existingBalance'] = existingBalance;
    map['existingCardLimit'] = existingCardLimit;
    map['hrName'] = hrName;
    map['contactNo'] = contactNo;
    if (idProof != null) {
      map['idProof'] = idProof?.map((v) => v.toJson()).toList();
    }
    map['otherIdProof'] = otherIdProof;
    if (addressProof != null) {
      map['addressProof'] = addressProof?.map((v) => v.toJson()).toList();
    }
    map['otherAddressProof'] = otherAddressProof;
    if (signatureProof != null) {
      map['signatureProof'] = signatureProof?.map((v) => v.toJson()).toList();
    }
    map['otherSignatureProof'] = otherSignatureProof;
    map['hasPassportPhotos'] = hasPassportPhotos;
    map['isMobileLinkedWithAadhar'] = isMobileLinkedWithAadhar;
    map['dobOnPanNo'] = dobOnPanNo;
    map['maritalStatus'] = maritalStatus;
    map['panNo'] = panNo;
    map['aadharNo'] = aadharNo;
    map['motherName'] = motherName;
    map['fatherName'] = fatherName;
    map['personalEmail'] = personalEmail;
    if (cardOn != null) {
      map['cardOn'] = cardOn?.map((v) => v.toJson()).toList();
    }
    map['referenceNumber'] = referenceNumber;
    map['isTrxnComplete'] = isTrxnComplete;
    map['_id'] = id;
    map['categoryId'] = categoryId;
    if (currentAddress != null) {
      map['currentAddress'] = currentAddress?.toJson();
    }
    map['customerId'] = customerId;
    map['createdBy'] = createdBy;
    map['teleCallerId'] = teleCallerId;
    map['channelPartnerId'] = channelPartnerId;
    if (referenceDocument != null) {
      map['referenceDocument'] = referenceDocument?.map((v) => v.toJson()).toList();
    }
    map['createdAt'] = createdAt;
    map['updatedAt'] = updatedAt;
    return map;
  }

}

class CurrentAddress {
  CurrentAddress({
      this.address, 
      this.pinCode, 
      this.landMark,});

  CurrentAddress.fromJson(dynamic json) {
    address = json['address'];
    pinCode = json['pinCode'];
    landMark = json['landMark'];
  }
  String? address;
  int? pinCode;
  String? landMark;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['address'] = address;
    map['pinCode'] = pinCode;
    map['landMark'] = landMark;
    return map;
  }

}