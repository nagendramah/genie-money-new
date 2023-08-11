class NewUserRequest {
  String? firstName;
  String? lastName;
  String? email;
  String? dob;
  String? company;
  String? occupation;
  String? monthlySalary;
  String? itrAmount;
  String? gender;
  String? pincode;
  String? address;
  String? category;
  String? categoryId;
  String? customerId;
  String? mobileNo;

  NewUserRequest(
      {this.firstName,
        this.lastName,
        this.email,
        this.dob,
        this.company,
        this.occupation,
        this.monthlySalary,
        this.itrAmount,
        this.gender,
        this.pincode,
        this.address,
        this.category,
        this.categoryId,
        this.customerId,
        this.mobileNo});

  NewUserRequest.fromJson(Map<String, dynamic> json) {
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    dob = json['dob'];
    company = json['company'];
    occupation = json['occupation'];
    monthlySalary = json['monthly_salary'];
    itrAmount = json['itr_amount'];
    gender = json['gender'];
    pincode = json['pincode'];
    address = json['address'];
    category = json['category'];
    categoryId = json['category_id'];
    customerId = json['customer_id'];
    mobileNo = json['mobile_no'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['email'] = this.email;
    data['dob'] = this.dob;
    data['company'] = this.company;
    data['occupation'] = this.occupation;
    data['monthly_salary'] = this.monthlySalary;
    data['itr_amount'] = this.itrAmount;
    data['gender'] = this.gender;
    data['pincode'] = this.pincode;
    data['address'] = this.address;
    data['category'] = this.category;
    data['category_id'] = this.categoryId;
    data['customer_id'] = this.customerId;
    data['mobile_no'] = this.mobileNo;
    return data;
  }
}