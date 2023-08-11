class EmploymentDetailsModel {
  EmploymentDetailsModel({
      this.status, 
      this.error, 
      this.messages, 
      this.userempdata,});

  EmploymentDetailsModel.fromJson(dynamic json) {
    status = json['status'];
    error = json['error'];
    messages = json['messages'] != null ? Messages.fromJson(json['messages']) : null;
    if (json['userempdata'] != null) {
      userempdata = [];
      json['userempdata'].forEach((v) {
        userempdata?.add(Userempdata.fromJson(v));
      });
    }
  }
  int? status;
  dynamic error;
  Messages? messages;
  List<Userempdata>? userempdata;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['error'] = error;
    if (messages != null) {
      map['messages'] = messages?.toJson();
    }
    if (userempdata != null) {
      map['userempdata'] = userempdata?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Userempdata {
  Userempdata({
      this.ueId, 
      this.ueUserid, 
      this.ueEmptype, 
      this.ueEmployername, 
      this.ueOfficeemail, 
      this.ueWorkingsince, 
      this.ueMonthsalary, 
      this.ueSalaryaccount, 
      this.ueJobcategory, 
      this.ueDesignation, 
      this.ueWorksector, 
      this.ueOrgtype, 
      this.ueOfficeaddress, 
      this.ueCreatedate,});

  Userempdata.fromJson(dynamic json) {
    ueId = json['ue_id'];
    ueUserid = json['ue_userid'];
    ueEmptype = json['ue_emptype'];
    ueEmployername = json['ue_employername'];
    ueOfficeemail = json['ue_officeemail'];
    ueWorkingsince = json['ue_workingsince'];
    ueMonthsalary = json['ue_monthsalary'];
    ueSalaryaccount = json['ue_salaryaccount'];
    ueJobcategory = json['ue_jobcategory'];
    ueDesignation = json['ue_designation'];
    ueWorksector = json['ue_worksector'];
    ueOrgtype = json['ue_orgtype'];
    ueOfficeaddress = json['ue_officeaddress'];
    ueCreatedate = json['ue_createdate'];
  }
  String? ueId;
  String? ueUserid;
  String? ueEmptype;
  String? ueEmployername;
  String? ueOfficeemail;
  String? ueWorkingsince;
  String? ueMonthsalary;
  String? ueSalaryaccount;
  String? ueJobcategory;
  String? ueDesignation;
  String? ueWorksector;
  String? ueOrgtype;
  String? ueOfficeaddress;
  String? ueCreatedate;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ue_id'] = ueId;
    map['ue_userid'] = ueUserid;
    map['ue_emptype'] = ueEmptype;
    map['ue_employername'] = ueEmployername;
    map['ue_officeemail'] = ueOfficeemail;
    map['ue_workingsince'] = ueWorkingsince;
    map['ue_monthsalary'] = ueMonthsalary;
    map['ue_salaryaccount'] = ueSalaryaccount;
    map['ue_jobcategory'] = ueJobcategory;
    map['ue_designation'] = ueDesignation;
    map['ue_worksector'] = ueWorksector;
    map['ue_orgtype'] = ueOrgtype;
    map['ue_officeaddress'] = ueOfficeaddress;
    map['ue_createdate'] = ueCreatedate;
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