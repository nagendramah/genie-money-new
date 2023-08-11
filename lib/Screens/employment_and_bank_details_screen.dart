import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:genie_money/utils/network.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/bank_details_model.dart';
import '../Model/dmt/BankListModel.dart';
import '../Model/employment_details_model.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';

class EmploymentAndBankDetailsScreen extends StatefulWidget {
  // const EmploymentAndBankDetailsScreen({Key? key}) : super(key: key);

  String title;

  EmploymentAndBankDetailsScreen(this.title, {Key? key}) : super(key: key);

  @override
  _EmploymentAndBankDetailsScreenState createState() =>
      _EmploymentAndBankDetailsScreenState();
}

class _EmploymentAndBankDetailsScreenState
    extends State<EmploymentAndBankDetailsScreen> {
  bool isEmployment = false;
  bool isBank = false;

  String emp_type = '';
  String salary_type = '';
  String job_function_type = '';
  String designation_type = '';
  String work_sector_type = '';
  String organization_type = '';
  String job_function_id = "1", work_sector_id = "1", organisation_id = "1";

  final format = DateFormat("dd-MM-yyyy");

  final TextEditingController _employer_name_controller =
  TextEditingController();
  final TextEditingController _official_email_controller =
  TextEditingController();
  final TextEditingController _net_monthly_salary_controller =
  TextEditingController();
  final TextEditingController _office_address_controller =
  TextEditingController();
  final TextEditingController _bank_name_controller = TextEditingController();
  final TextEditingController _account_no_controller = TextEditingController();
  final TextEditingController _confirm_account_no_controller =
  TextEditingController();
  final TextEditingController _ifsc_code_controller = TextEditingController();
  final TextEditingController _upi_id_controller = TextEditingController();
  final TextEditingController _date_controller = TextEditingController();

  List<String> emp_type_list = ['Salaried', 'UnEmployed', 'Self-Employed'];

  List<String> salary_type_list = ['Direct Account Transfer', 'Cheque', 'Cash'];

  List<String> job_function_type_list = [
    'Research and development (R & D)',
    'Administration',
    'Customer Service',
    'Sales',
    'Marketing',
    'IT and Engineering',
    'Human resources',
    'Finance',
    'Operations',
    'Legal and Audit',
    'Others'
  ];

  List<String> designation_type_list = [
    'Executive',
    'Middle Management',
    'Sr. Management',
    'Leadership role'
  ];

  List<String> work_sector_type_list = [
    'Agriculture',
    'Banking and Financial Services',
    'Construction, Real Estate and Infrastructure',
    'Education and Training',
    'Government and public administration',
    'Healthcare',
    'Information Technology',
    'Legal',
    'Manufacturing',
    'Media, Sports and Entertainment',
    'Oil and Gases',
    'Security and Law Enforcement',
    'Trade and Commerce',
    'Transport and Logistics',
    'Tourism and Hospitality',
    'Others'
  ];

  List<String> organization_type_list = [
    'Private Company',
    'Public Company',
    'Listed Public Company',
    'State Government',
    'Central Government',
    'Partnership Firm',
    'Proprietorship Firm',
    'Limited Liability Partnership (LLP)',
    'Trust'
  ];

  final NetworkCall _networkCall = NetworkCall();
  List<Userempdata>? userempdataa = [];
  List<Bankdetail>? bankdetail = [];
  String ue_id = "", ub_id = "";
  List<BankModel>? bankList = [];
  List<BankModel>? tempBankList = [];
  late BankModel selectedBank;
  BankModel? selectedBankModelp;
  String selectedBankNamep = "Select Bank";
  double width = 0;
  double height = 0;

  @override
  void initState() {
    getBankList();

    super.initState();
    if (widget.title == "Employment Details") {
      isEmployment = true;
      getdata();

      // _networkCall.getEmploymentDetails().then((value) => {
      //
      //
      //
      //       setState(() {
      //
      //
      //       }),
      //
      // });
    } else if

    (widget.title == "Bank Details") {
      isBank = true;
      _networkCall.getbankDetails().then((value) => {
        if (value.bankdetail != null && value.bankdetail!.isNotEmpty)
          {
            for (int i = 0; i < value.bankdetail!.length; i++)
              {
                bankdetail!.add(value.bankdetail![i]),
              },
            setState(() {
              ub_id = bankdetail![0].ubId!;
              _bank_name_controller.text = bankdetail![0].ubName!;
              print("Bank name :" + _bank_name_controller.text);
              _account_no_controller.text = bankdetail![0].ubAcnumber!;
              _confirm_account_no_controller.text =
              bankdetail![0].ubAcnumber!;
              _ifsc_code_controller.text = bankdetail![0].ubIfsccode!;
              _upi_id_controller.text = bankdetail![0].ubUpi!;
            }),
          }
      });
    }
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.tryParse(s) != null;
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: Text(
            widget.title,
            style: const TextStyle(
              color: kWhite,
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: kWhite,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: isEmployment,
                  child: Column(
                    children: [
                      // Employment Type
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor:kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Employment Type"),
                            isDense: true,
                          ),
                          //  hint: Text(
                          //     "Employment Type",
                          //     style: TextStyle(color: Color(0xFFFFAE00)),
                          //   ),
                            value: emp_type.isEmpty ? null : emp_type,
                         // value: emp_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              emp_type = data!;
                            });
                          },
                          items: emp_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Employer Name
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _employer_name_controller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Employer Name',
                            isDense: true,
                          ),
                        ),
                      ),
                      // Official Email
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _official_email_controller,
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Official Email',
                            isDense: true,
                          ),
                        ),
                      ),
                      // Working Since
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DateTimeField(
                          controller: _date_controller,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Working Since',
                          ),
                          style: const TextStyle(color: greyColor),
                          format: format,
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                                context: context,
                                firstDate: DateTime(1900),
                                initialDate: currentValue ?? DateTime.now(),
                                lastDate: DateTime(2100));
                          },
                        ),
                      ),
                      // Net Monthly Salary
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color:greyColor),
                          cursorColor: greyColor,
                          controller: _net_monthly_salary_controller,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: true),
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Net Monthly Salary',
                            isDense: true,
                          ),
                        ),
                      ),
                      // Salary Received By
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Salary Received By"),
                            isDense: true,
                          ),
                           value: salary_type.isEmpty ? null : salary_type,
                         // value: salary_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              salary_type = data!;
                            });
                          },
                          items: salary_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Job Function
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Job Function"),
                            isDense: true,
                          ),
                            value: job_function_type.isEmpty ? null : job_function_type,
                          //value: job_function_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              job_function_type = data!;
                              for (int i = 0;
                              i < job_function_type_list.length;
                              i++) {
                                if (job_function_type ==
                                    job_function_type_list[i]) {
                                  int selected = i++;
                                  job_function_id = selected.toString();
                                }
                              }
                            });
                          },
                          items: job_function_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Designation
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Designation"),
                            isDense: true,
                          ),
                           value: designation_type.isEmpty ? null : designation_type,
                          //value: designation_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              designation_type = data!;
                            });
                          },
                          items: designation_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      // Work Sector
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Work Sector"),
                            isDense: true,
                          ),
                           value: work_sector_type.isEmpty ? null :work_sector_type,
                          //value: work_sector_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              work_sector_type = data!;
                              for (int i = 0;
                              i < work_sector_type_list.length;
                              i++) {
                                if (work_sector_type ==
                                    work_sector_type_list[i]) {
                                  int selected = i + 1;
                                  work_sector_id = selected.toString();
                                }
                              }
                            });
                          },
                          items: work_sector_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      //Organization
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            border: OutlineInputBorder(
                              borderSide: BorderSide(color: navyBlueColor),
                              borderRadius:
                              BorderRadius.all(Radius.circular(10.0)),
                            ),
                            labelStyle: TextStyle(color: navyBlueColor),
                            label: Text("Organization"),
                            isDense: true,
                          ),
                           value:  organization_type.isEmpty ? null : organization_type,
                          //value: organization_type,
                          icon: const Icon(
                            Icons.arrow_drop_down,
                            color: navyBlueColor,
                          ),
                          iconSize: 24,
                          elevation: 16,
                          style: const TextStyle(
                              color: navyBlueColor, fontSize: 18),
                          onChanged: (String? data) {
                            setState(() {
                              organization_type = data!;
                              for (int i = 0;
                              i < organization_type_list.length;
                              i++) {
                                if (organization_type ==
                                    organization_type_list[i]) {
                                  int selected = i + 1;
                                  organisation_id = selected.toString();
                                }
                              }
                            });
                          },
                          items: organization_type_list
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                      //'Work / Office Address'
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _office_address_controller,
                          keyboardType: TextInputType.streetAddress,
                          minLines: 1,
                          maxLines: 10,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Work / Office Address',
                            isDense: true,
                          ),
                        ),
                      ),
                      // Employee Details
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            final employmentdetail = {
                              "ue_id": ue_id,
                              "userid": Constants.userid,
                              "ue_emptype": emp_type == "Salaried"
                                  ? "1"
                                  : emp_type == "UnEmployed"
                                  ? "2"
                                  : "3",
                              "ue_employername": _employer_name_controller.text,
                              "ue_officeemail": _official_email_controller.text,
                              "ue_workingsince": _date_controller.text,
                              "ue_monthsalary":
                              _net_monthly_salary_controller.text,
                              "ue_salaryaccount": salary_type,
                              "ue_jobcategory": job_function_id,
                              "ue_designation": designation_type,
                              "ue_worksector": work_sector_id,
                              "ue_orgtype": organisation_id,
                              "ue_officeaddress":
                              _office_address_controller.text
                            };

                            _networkCall.updateEmployment(
                                employmentdetail, context);
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 20.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 40.0), backgroundColor: navyBlueColor,
                           // shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: isBank,
                  child: Column(
                    children: [
                      /*Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: Color(0xFFFFAE00)),
                          cursorColor: const Color(0xFFFFAE00),
                          controller: _bank_name_controller,
                          keyboardType: TextInputType.name,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                                  const BorderSide(color: Color(0xFFFFAE00)),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                                const TextStyle(color: Color(0xFFFFAE00)),
                            labelText: 'Bank Name',
                            isDense: true,
                          ),
                        ),
                      ),*/
                      // BankList implementation
                      getBankListDropDown(context),
                      // Account Number
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _account_no_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Account Number',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _confirm_account_no_controller,
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'Confirm Account Number',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color:greyColor),
                          cursorColor: greyColor,
                          controller: _ifsc_code_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'IFSC Code',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: TextField(
                          style: const TextStyle(color: greyColor),
                          cursorColor: greyColor,
                          controller: _upi_id_controller,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            disabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            border: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: navyBlueColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle:
                            const TextStyle(color: navyBlueColor),
                            labelText: 'UPI id',
                            isDense: true,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (selectedBankNamep != "Select Bank") {
                              if (_account_no_controller.text.isNotEmpty) {
                                if (_confirm_account_no_controller
                                    .text.isNotEmpty) {
                                  if (_confirm_account_no_controller.text ==
                                      _account_no_controller.text) {
                                    if (_ifsc_code_controller.text.isNotEmpty) {
                                      //if (_upi_id_controller.text.isNotEmpty) {
                                      final bankDetails = {
                                        "ub_id": ub_id,
                                        "userid": Constants.userid,
                                        "ub_name": _bank_name_controller.text,
                                        "ub_acnumber":
                                        _account_no_controller.text,
                                        "ub_ifsccode":
                                        _ifsc_code_controller.text,
                                        "ub_upi": _upi_id_controller.text
                                      };

                                      print("bank name : " +
                                          selectedBankModelp!.bankName);
                                      SharedPreferences pref =
                                      await SharedPreferences.getInstance();
                                      setState(() {
                                        //containerVisible = false;
                                        pref.setBool("isAccountAdded", true);
                                        pref.setString(
                                            "registerAccount",
                                            _confirm_account_no_controller
                                                .text);
                                        pref.setString(
                                            "ifsc", _ifsc_code_controller.text);
                                        pref.setString("bankname",
                                            selectedBankModelp!.bankName);
                                        pref.setString(
                                            "bankid",
                                            selectedBankModelp!.bankid
                                                .toString());
                                        //pref.setString("upi", _upi_id_controller.text);
                                      });
                                      _networkCall.updateBankDetails(
                                          bankDetails, context);
                                      Navigator.pop(context);

                                      /* else {
                                        _createToast("Please enter upi id");
                                      }*/
                                    } else {
                                      _createToast("Please enter IFSC code");
                                    }
                                  } else {
                                    _createToast(
                                        "Account number does not match");
                                  }
                                } else {
                                  _createToast("Please confirm account number");
                                }
                              } else {
                                _createToast("Please enter account number");
                              }
                            } else {
                              _createToast("Please enter bank name");
                            }
                          },
                          child: const Text(
                            "Save",
                            style: TextStyle(
                              color: kWhite,
                              fontSize: 20.0,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 40.0), backgroundColor: navyBlueColor,
                           // shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<List<BankModel>> getBankList() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString("assets/dmt_bank_list.json");

    final jsonResult = json.decode(data);
    setState(() {
      bankList = (BankListModel.fromJson(jsonResult).list);
      bankList!.sort((a, b) => a.bankName.compareTo(b.bankName));
      tempBankList!.addAll(bankList!);
      //bankList!.insertAll(0, [new BankModel(bankid: 0, bankName: "Select Bank")]);
    });

    print(jsonResult);
    //selectedBank= bankList!.first;
    return bankList!;
  }

  Widget getBankListDropDown(BuildContext context) {
    /*return Container(
      margin: EdgeInsets.only(top: 5,bottom: 5),
      padding: EdgeInsets.only(left: 10, right: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(10.0)),
          border: Border.all(color: Color(0xFFFFAE00))
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<BankModel>(
          dropdownColor: const Color(0xFF3A3A3A),
          isExpanded: true,
          value: selectedBank,
          icon: const Icon(
            Icons.arrow_drop_down,
            color: Color(0xFFFFAE00),
          ),
          iconSize: 24,
          elevation: 16,
          //style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
          onChanged: (data) {
            setState(() {
              selectedBank = data!;
              print("slected state "+selectedBank.bankName);
              //prepaid_operator = data.;
            });
          },
          items: bankList?.map((value) => DropdownMenuItem(
            child: Text(
              value.bankName.toString().trim(),
              overflow: TextOverflow.visible,
              maxLines: 2,
              style: TextStyle(color: Color(0xFFFFAE00), fontSize: 16),
            ),
            value: value,
          ))?.toList()??[],
        ),
      ),
    );*/
    return GestureDetector(
      onTap: () {
        setState(() {
          tempBankList = bankList;
        });
        Dialog bankDialog = Dialog(
          backgroundColor: kWhite,
          child: StatefulBuilder(builder: (context, setStateNew) {
            return Container(
              height: height - 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                    margin: const EdgeInsets.all(5),
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius:
                        const BorderRadius.all(Radius.circular(10)),
                        border: Border.all(color: navyBlueColor)),
                    child: Row(
                      children: [
                        Expanded(
                            child: Container(
                              child: TextField(
                                textCapitalization: TextCapitalization.characters,
                                onChanged: (value) {
                                  setStateNew(() {
                                    if (value.isNotEmpty) {
                                      tempBankList = bankList!
                                          .where((element) =>
                                          element.bankName.contains(value))
                                          .toList();
                                    } else {
                                      tempBankList = bankList!;
                                    }
                                  });
                                },
                                decoration: const InputDecoration(
                                  hintText: "Search",
                                  border: InputBorder.none,
                                  isDense: true,
                                ),
                                autocorrect: false,
                                enableSuggestions: false,
                                style: const TextStyle(
                                    color: greyColor,
                                    decoration: TextDecoration.none),
                                cursorColor: greyColor,
                              ),
                            )),
                        const Icon(
                          Icons.search,
                          color: navyBlueColor,
                        )
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: tempBankList!.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedBankModelp = tempBankList![index];
                                  selectedBankNamep =
                                      selectedBankModelp!.bankName;
                                });
                                Navigator.pop(context);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(5),
                                child: Text(
                                  tempBankList![index].bankName,
                                  style: const TextStyle(
                                      color: navyBlueColor, fontSize: 18),
                                ),
                              ),
                            );
                          }),
                    ),
                  ),
                ],
              ),
            );
          }),
        );

        showDialog(
            barrierDismissible: false,
            context: context,
            builder: (BuildContext context) => bankDialog);
      },
      child: Container(
        //height: 40,
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        padding:
        const EdgeInsets.only(left: 10, right: 10, top: 12, bottom: 12),
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(10.0)),
            border: Border.all(color: navyBlueColor)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                selectedBankNamep,
                style: const TextStyle(color: navyBlueColor, fontSize: 16),
                maxLines: 4,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const Icon(
              Icons.arrow_drop_down,
              color: navyBlueColor,
            )
          ],
        ),
      ),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
  Future<void> getdata() async {
    /*'http://165.22.219.135/genie_money/public/index.php/getuserempdata?userid=' +
        Constants.userid),*/
    String url =
        "https://geniemoneyy.com/genie_money/public/index.php/getuserempdata?userid="+Constants.userid;
    var network = new NewVendorApiService();
    var res = await network.getresponse(url);
    var vlist = EmploymentDetailsModel.fromJson(res);

    setState(() {
      userempdataa = vlist.userempdata;

      ue_id = userempdataa![0].ueEmployername.toString();

   

      emp_type = userempdataa![0].ueEmptype! == "1"
          ? "Salaried"
          : userempdataa![0].ueEmptype! == "2"
          ? "UnEmployed"
          : "Self-Employed";
      _employer_name_controller.text =
          userempdataa![0].ueEmployername!.toString();
      _official_email_controller.text =
      userempdataa![0].ueOfficeemail!;
      _date_controller.text = userempdataa![0].ueWorkingsince!;
      _net_monthly_salary_controller.text =
      userempdataa![0].ueMonthsalary!;
      salary_type = userempdataa![0].ueSalaryaccount!;
      if (isNumeric(userempdataa![0].ueDesignation!)) {
        int a = int.parse(userempdataa![0].ueDesignation!);
        for (int i = 0; i < designation_type_list.length; i++) {
          if ((a - 1) == i) {
            designation_type = designation_type_list[i];
          }
        }
      } else {
        designation_type = userempdataa![0].ueDesignation!;
      }
      work_sector_id = userempdataa![0].ueWorksector!;
      if (work_sector_id.isNotEmpty &&
          int.parse(work_sector_id) > 0) {
        int a = int.parse(work_sector_id);
        for (int i = 0; i < work_sector_type_list.length; i++) {
          if ((a - 1) == i) {
            work_sector_type = work_sector_type_list[i];
          }
        }
      }
      organisation_id = userempdataa![0].ueOrgtype!;
      if (organisation_id.isNotEmpty &&
          int.parse(organisation_id) > 0) {
        int a = int.parse(organisation_id);
        for (int i = 0; i < organization_type_list.length; i++) {
          if ((a - 1) == i) {
            organization_type = organization_type_list[i];
          }
        }
      }
      _office_address_controller.text =
      userempdataa![0].ueOfficeaddress!;
    });

    print("" + res!.toString());
  }

}