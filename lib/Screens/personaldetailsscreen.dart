import 'dart:convert';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/address_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/constants.dart';
import 'package:genie_money/utils/network.dart';
import 'package:intl/intl.dart';

class PersonalDetailsScreen extends StatefulWidget {
  const PersonalDetailsScreen({Key? key}) : super(key: key);

  @override
  _PersonalDetailsScreenState createState() => _PersonalDetailsScreenState();
}

enum GenderCharacter { Male, Female, Transgender }

enum Marital { single, married, others }

class _PersonalDetailsScreenState extends State<PersonalDetailsScreen>
    with SingleTickerProviderStateMixin {

  late List<String> personal_details_list;

  late TabController _tabController;

  final TextEditingController _mobileNoController = TextEditingController();
  final TextEditingController _fullnameController = TextEditingController();
  TextEditingController altMobileNoController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final TextEditingController _panCardNoController = TextEditingController();
  final TextEditingController _aadharCardNoController = TextEditingController();
  final TextEditingController _currentAddressController =
  TextEditingController();
  final TextEditingController _permanentAddressController =
  TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();
  final TextEditingController _reference_name_1_controller =
  TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController _reference_mobile_no_1_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_1_controller =
  TextEditingController();
  TextEditingController _reference_name_2_controller = TextEditingController();
  TextEditingController _reference_mobile_no_2_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_2_controller =
  TextEditingController();
  TextEditingController _reference_name_3_controller = TextEditingController();
  TextEditingController _reference_mobile_no_3_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_3_controller =
  TextEditingController();
  TextEditingController _reference_name_4_controller = TextEditingController();
  final TextEditingController _reference_mobile_no_4_controller =
  TextEditingController();
  TextEditingController _reference_relation_type_4_controller =
  TextEditingController();

  GenderCharacter? _character = GenderCharacter.Male;
  Marital? _marital_status = Marital.single;

  String selected_date = "",
      basic_info_json = "",
      residential_info_json = "",
      ownership = "",
      per_ownership = "",
      residing = "",
      years = "",
      locality = "",
      per_locality = "",
      urf_id_1 = "",
      urf_id_2 = "",
      urf_id_3 = "",
      urf_id_4 = "",
      ur_id_cur = "",
      ur_id_per = "",
      ur_same = "";

  final format = DateFormat("dd-MM-yyyy");

  String qualificationType = 'Undergraduate';

  List<String> qualificationTypeList = [
    'Undergraduate',
    'Graduate',
    'Postgraduate'
  ];

  bool isToggle = true;
  bool showPermanentAddress = false;

  late Map<String, dynamic> basicInfobody;
  var residentialInfoBody;

  NetworkCall networkCall = NetworkCall();
  List date = [];
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    var userDetails, residential_details, reference_details;

    networkCall.getPersonalDetails().then((value) => {
      setState(() {
        _fullnameController.text = value.userdetails.basicinfo.fullName;
        altMobileNoController.text =
            value.userdetails.basicinfo.altMobileNo;

        _character = value.userdetails.basicinfo.gender == "male" ||
            value.userdetails.basicinfo.gender == "Male"
            ? GenderCharacter.Male
            : value.userdetails.basicinfo.gender == "female" ||
            value.userdetails.basicinfo.gender == "Female"
            ? GenderCharacter.Female
            : GenderCharacter.Transgender;

        qualificationType = value.userdetails.basicinfo.qualification == "1"
            ? "Undergraduate"
            : value.userdetails.basicinfo.qualification == "2"
            ? "Graduate"
            : "Postgraduate";
        _panCardNoController.text = value.userdetails.basicinfo.pancard;
        _aadharCardNoController.text =
            value.userdetails.basicinfo.adharcard;
        _marital_status = value.userdetails.basicinfo.maritalstatus ==
            "Single" ||
            value.userdetails.basicinfo.maritalstatus == "single"
            ? Marital.single
            : value.userdetails.basicinfo.maritalstatus == "Married" ||
            value.userdetails.basicinfo.maritalstatus == "married"
            ? Marital.married
            : Marital.others;
        _reference_name_1_controller.text =
            value.userdetails.references.urfName1;
        _reference_mobile_no_1_controller.text =
            value.userdetails.references.urfMobile1;
        _reference_relation_type_1_controller.text =
            value.userdetails.references.urfRelation1;
        _reference_name_2_controller.text =
            value.userdetails.references.urfName2;
        _reference_mobile_no_2_controller.text =
            value.userdetails.references.urfMobile2;
        _reference_relation_type_2_controller.text =
            value.userdetails.references.urfRelation2;
        _reference_name_3_controller.text =
            value.userdetails.references.urfName3;
        _reference_mobile_no_3_controller.text =
            value.userdetails.references.urfMobile3;
        _reference_relation_type_3_controller.text =
            value.userdetails.references.urfRelation3;
        _reference_name_4_controller.text =
            value.userdetails.references.urfName4;
        _reference_mobile_no_4_controller.text =
            value.userdetails.references.urfMobile4;
        _reference_relation_type_4_controller.text =
            value.userdetails.references.urfRelation4;

        selected_date = value.userdetails.basicinfo.dob;
        date = selected_date.split("-");
        if (date[0].toString().length == 4) {
          dateController.text = date[2] + "-" + date[1] + "-" + date[0];
        } else {
          dateController.text = date[0] + "-" + date[1] + "-" + date[2];
        }
      }),
      // if (value.userdetails!.residentialinfo!.isNotEmpty)
      //   {
      //     residential_details =
      //         jsonDecode(value.userdetails!.residentialinfo!),
      //     print(residential_details),
      //     setState(() {
      //       ur_id_cur = residential_details[0]["ur_id"];
      //       ur_same = residential_details[0]["ur_same"];
      //       _currentAddressController.text = residential_details[0]
      //               ["ur_address"] +
      //           ", " +
      //           residential_details[0]["ur_locality"];
      //       _pincodeController.text = residential_details[0]["ur_pincode"];
      //       _cityController.text = residential_details[0]["ur_city"];
      //       _stateController.text = residential_details[0]["ur_state"];
      //       if (ur_same == "1") {
      //         isToggle = true;
      //         showPermanentAddress = false;
      //       } else {
      //         isToggle = false;
      //         showPermanentAddress = true;
      //       }
      //       if (residential_details.length == 2 ||
      //           residential_details.length > 2) {
      //         ur_id_per = residential_details[1]["ur_id"];
      //         _permanentAddressController.text = residential_details[1]
      //                 ["ur_address"] +
      //             ", " +
      //             residential_details[1]["ur_locality"];
      //       }
      //     }),
      //   },
      // if (value.userdetails!.references!.isNotEmpty)
      //   {
      //     reference_details = jsonDecode(value.userdetails!.references!),
      //     print(reference_details),
      //     setState(() {
      //       urf_id_1 = reference_details[0]["urf_id"];
      //       _reference_name_1_controller.text =
      //           reference_details[0]["urf_name"];
      //       _reference_mobile_no_1_controller.text =
      //           reference_details[0]["urf_mobile"];
      //       _reference_relation_type_1_controller.text =
      //           reference_details[0]["urf_relation"];

      //       if (reference_details.length == 2 ||
      //           reference_details.length > 2) {
      //         urf_id_2 = reference_details[1]["urf_id"];
      //         _reference_name_2_controller.text =
      //             reference_details[1]["urf_name"];
      //         _reference_mobile_no_2_controller.text =
      //             reference_details[1]["urf_mobile"];
      //         _reference_relation_type_2_controller.text =
      //             reference_details[0]["urf_relation"];
      //       }

      //       if (reference_details.length == 3 ||
      //           reference_details.length > 3) {
      //         urf_id_3 = reference_details[2]["urf_id"];
      //         _reference_name_3_controller.text =
      //             reference_details[2]["urf_name"];
      //         _reference_mobile_no_3_controller.text =
      //             reference_details[2]["urf_mobile"];
      //         _reference_relation_type_3_controller.text =
      //             reference_details[0]["urf_relation"];
      //       }

      //       if (reference_details.length == 4 ||
      //           reference_details.length > 4) {
      //         urf_id_4 = reference_details[3]["urf_id"];
      //         _reference_name_4_controller.text =
      //             reference_details[3]["urf_name"];
      //         _reference_mobile_no_4_controller.text =
      //             reference_details[3]["urf_mobile"];
      //         _reference_relation_type_4_controller.text =
      //             reference_details[0]["urf_relation"];
      //       }
      //     }),
      //   }
    });

    setState(() {
      _fullnameController.text = Constants.name;
      _mobileNoController.text = Constants.phone;
      emailController.text = Constants.email;
    });
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: DefaultTabController(
        length: 3,
        child: Scaffold(
          backgroundColor: kWhite,
          appBar: AppBar(
            backgroundColor:navyBlueColor,
            bottom: TabBar(
              indicatorColor: kWhite,
              controller: _tabController,
              labelColor: kWhite,
              unselectedLabelColor:kWhite,
              tabs: const [
                Tab(
                  child: Text(
                    "Basic Info",
                    textAlign: TextAlign.center,
                  ),
                ),
                Tab(
                  child: Text("Residential Info", textAlign: TextAlign.center),
                ),
                Tab(
                  child: Text("References", textAlign: TextAlign.center),
                ),
              ],
            ),
            title: const Text(
              "Personal Details",
              style: TextStyle(
                color:kWhite,
              ),
            ),
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: kWhite,
              ),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ),
          body: TabBarView(
            controller: _tabController,
            children: [
              _basicInfo(width, context),
              _residentialInfo(width, height),
              _reference(width, context),
            ],
          ),
        ),
      ),
    );
  }

  Widget _basicInfo(double width, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                cursorColor:greyColor,
                controller: _fullnameController,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Full Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: const TextStyle(color: greyColor),
                 cursorColor:greyColor,
                controller: _mobileNoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                cursorColor:greyColor,
                controller: altMobileNoController,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Alternate Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Gender",
                style: TextStyle(
                    color: navyBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              
              child: Theme(
                data: ThemeData(
              unselectedWidgetColor: greyColor, 
                 ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<GenderCharacter>(
                        activeColor: navyBlueColor,
                  
                        value: GenderCharacter.Male,
                        groupValue: _character,
                        onChanged: (GenderCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Male",
                      style: TextStyle(color: navyBlueColor),
                    ),
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<GenderCharacter>(
                        activeColor:navyBlueColor,
                        value: GenderCharacter.Female,
                        groupValue: _character,
                        onChanged: (GenderCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Female",
                      style: TextStyle(color: navyBlueColor),
                    ),
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<GenderCharacter>(
                        activeColor: navyBlueColor,
                        value: GenderCharacter.Transgender,
                        groupValue: _character,
                        onChanged: (GenderCharacter? value) {
                          setState(() {
                            _character = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Transgender",
                      style: TextStyle(color: navyBlueColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color:greyColor),
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color:  navyBlueColor),
                  labelText: 'E-Mail',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: DateTimeField(
                controller: dateController,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color:  navyBlueColor),
                  labelText: 'Date of Birth',
                ),
                style: const TextStyle(color:  navyBlueColor),
                format: format,
                onShowPicker: (context, currentValue) {
                  return showDatePicker(
                      context: context,
                      firstDate: DateTime(1900),
                      initialDate: currentValue ?? DateTime.now(),
                      lastDate: DateTime(2100));
                },
                onChanged: (date) {
                  selected_date = date!.day.toString() +
                      "-" +
                      date.month.toString() +
                      "-" +
                      date.year.toString();
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: DropdownButtonFormField<String>(
                dropdownColor:  kWhite,
                isExpanded: true,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(color:  navyBlueColor),
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                  ),
                  labelStyle: TextStyle(
                    color:  navyBlueColor,
                  ),
                  label: Text("Qualification"),
                  isDense: true,
                ),
                value: qualificationType,
                icon: const Icon(
                  Icons.arrow_drop_down,
                  color:  navyBlueColor,
                ),
                iconSize: 24,
                elevation: 16,
                style: const TextStyle(color:  navyBlueColor, fontSize: 18),
                onChanged: (String? data) {
                  setState(() {
                    qualificationType = data!;
                  });
                },
                items: qualificationTypeList
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _panCardNoController,
                textCapitalization: TextCapitalization.characters,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'PAN Card',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color:greyColor),
                controller: _aadharCardNoController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Aadhar Card Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Marital Status",
                style: TextStyle(
                    color: navyBlueColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Theme(
                data: ThemeData(
                unselectedWidgetColor: greyColor, 
                 ),
                child: Row(
                  children: [
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<Marital>(
                        activeColor: navyBlueColor,
                        value: Marital.single,
                        groupValue: _marital_status,
                        onChanged: (Marital? value) {
                          setState(() {
                            _marital_status = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Single",
                      style: TextStyle(color: navyBlueColor),
                    ),
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<Marital>(
                        activeColor: navyBlueColor,
                        value: Marital.married,
                        groupValue: _marital_status,
                        onChanged: (Marital? value) {
                          setState(() {
                            _marital_status = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Married",
                      style: TextStyle(color:navyBlueColor),
                    ),
                    SizedBox(
                      width: width * 0.10,
                      child: Radio<Marital>(
                        activeColor: navyBlueColor,
                        value: Marital.others,
                        groupValue: _marital_status,
                        onChanged: (Marital? value) {
                          setState(() {
                            _marital_status = value;
                          });
                        },
                      ),
                    ),
                    const Text(
                      "Others",
                      style: TextStyle(color: navyBlueColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  basicInfobody = {
                    "tab1": "1",
                    "tab2": '',
                    "tab3": "",
                    "userid": Constants.userid,
                    "full_name": _fullnameController.text.toString(),
                    "alt_mobile_no": altMobileNoController.text.toString(),
                    "gender": _character == GenderCharacter.Male
                        ? "Male"
                        : _character == GenderCharacter.Female
                        ? "Female"
                        : "Transgender",
                    "email": emailController.text.toString(),
                    "dob": selected_date.toString(),
                    "qualification": qualificationType == "Undergraduate"
                        ? "1"
                        : qualificationType == "Graduate"
                        ? "2"
                        : "3",
                    "pancard": _panCardNoController.text.toString(),
                    "adharcard": _aadharCardNoController.text.toString(),
                    "maritalstatus": _marital_status == Marital.single
                        ? "Single"
                        : _marital_status == Marital.married
                        ? "Married"
                        : "Others"
                  };
                  // basic_info_json = jsonEncode(basicInfobody);
                  // print(basic_info_json);
                  // final addresses = {
                  //   "ur_id": ur_id_cur,
                  //   "ur_same": "1",
                  //   "ur_userid": Constants.userid.toString(),
                  //   "ur_ownership": ownership,
                  //   "ur_residingwith": residing,
                  //   "ur_noofyears": years,
                  //   "ur_address": _currentAddressController.text.toString(),
                  //   "ur_locality": locality,
                  //   "ur_pincode": _pincodeController.text.toString(),
                  //   "ur_city": _cityController.text.toString(),
                  //   "ur_state": _stateController.text.toString(),
                  // };
                  // residentialInfoBody = [addresses, addresses];
                  // residential_info_json = jsonEncode(residentialInfoBody);
                  // print(residential_info_json);
                  // Map<String, dynamic> reference_1 = Map<String, dynamic>();
                  // Map<String, dynamic> reference_2 = Map<String, dynamic>();
                  // Map<String, dynamic> reference_3 = Map<String, dynamic>();
                  // Map<String, dynamic> reference_4 = Map<String, dynamic>();
                  // var refer;

                  // reference_1 = {
                  //   "urf_id": urf_id_1,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_1_controller.text,
                  //   "urf_mobile": _reference_mobile_no_1_controller.text,
                  //   "urf_relation": _reference_relation_type_1_controller.text
                  // };

                  // reference_2 = {
                  //   "urf_id": urf_id_2,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_2_controller.text,
                  //   "urf_mobile": _reference_mobile_no_2_controller.text,
                  //   "urf_relation": _reference_relation_type_2_controller.text
                  // };

                  // reference_3 = {
                  //   "urf_id": urf_id_3,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_3_controller.text,
                  //   "urf_mobile": _reference_mobile_no_3_controller.text,
                  //   "urf_relation": _reference_relation_type_3_controller.text
                  // };

                  // reference_4 = {
                  //   "urf_id": urf_id_4,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_4_controller.text,
                  //   "urf_mobile": _reference_mobile_no_4_controller.text,
                  //   "urf_relation": _reference_relation_type_4_controller.text
                  // };

                  // String data = "";
                  // if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [
                  //     reference_1,
                  //     reference_2,
                  //     reference_3,
                  //     reference_4
                  //   ];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_2, reference_3, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_3, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_2, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_2, reference_3];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_3, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_2, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_2, reference_3];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_4];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_3];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_2];
                  // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [""];
                  // data = jsonEncode(refer);
                  // }
                  NetworkCall network = NetworkCall();
                  network.updateProfile(basicInfobody, context);
                  // network.update_profile(
                  //     basicInfobody, residentialInfoBody, refer, '1', context);
                  _tabController.animateTo(1);
                },
                child: const Text(
                  "Save and Continue",
                  style: TextStyle(
                    color:kWhite,
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
    );
  }

  Widget _residentialInfo(double width, double height) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextFormField(
                onTap: () async {
                  final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                        const AddressScreen(title: "Present Address")),
                  );

                  if (result != null) {
                    final data = jsonDecode(result);
                    setState(() {
                      _currentAddressController.text = data["ur_address"];
                      ownership = data["ur_ownership"];
                      residing = data["ur_residingwith"];
                      years = data["ur_noofyears"];
                      locality = data["ur_locality"];
                      _cityController.text = data["ur_city"];
                      _stateController.text = data["ur_state"];
                      _pincodeController.text = data["ur_pincode"];
                    });
                  }
                },
                readOnly: true,
                style: const TextStyle(color: greyColor),
                controller: _currentAddressController,
                minLines: 1,
                maxLines: 10,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Present Address',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          const Text(
                            "Permanent Address",
                            style: TextStyle(
                                color: navyBlueColor, fontSize: 18.0),
                            textAlign: TextAlign.left,
                          ),
                          Container(
                            margin: const EdgeInsets.only(top: 10.0),
                            child: const Text(
                              "Same as present address",
                              style: TextStyle(color: navyBlueColor),
                            ),
                          ),
                        ],
                      ),
                      FlutterSwitch(
                        activeColor: navyBlueColor,
                        width: width * 0.15,
                        height: height * 0.05,
                        toggleSize: 25.0,
                        value: isToggle,
                        borderRadius: 15.0,
                        onToggle: (val) {
                          setState(() {
                            isToggle = val;
                            if (isToggle) {
                              showPermanentAddress = false;
                            } else {
                              showPermanentAddress = true;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                  Visibility(
                    visible: showPermanentAddress,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: TextField(
                        onTap: () async {
                          final result = await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const AddressScreen(
                                    title: "Permanent Address")),
                          );

                          if (result != null) {
                            final data = jsonDecode(result);
                            // setState(() {
                            //   _permanentAddressController.text = "address";
                            //   _cityController.text = "city";
                            //   _stateController.text = "state";
                            //   _pincodeController.text = "pincode";
                            // });
                          }
                        },
                        readOnly: true,
                        style: const TextStyle(color: greyColor),
                        controller: _permanentAddressController,
                        keyboardType: TextInputType.none,
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
                          labelStyle: const TextStyle(color: navyBlueColor),
                          labelText: 'Permanent Address',
                          isDense: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10.0),
            //   child: TextField(
            //     style: TextStyle(color: Color(0xFFFFAE00)),
            //     controller: _pincodeController,
            //     keyboardType: TextInputType.number,
            //     decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       disabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       border: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
            //       labelText: 'Pin Code',
            //       isDense: true,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10.0),
            //   child: TextField(
            //     style: const TextStyle(color: Color(0xFFFFAE00)),
            //     controller: _cityController,
            //     keyboardType: TextInputType.streetAddress,
            //     decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       disabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       border: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
            //       labelText: 'City',
            //       isDense: true,
            //     ),
            //   ),
            // ),
            // Container(
            //   margin: const EdgeInsets.only(top: 10.0),
            //   child: TextField(
            //     style: TextStyle(color: Color(0xFFFFAE00)),
            //     controller: _stateController,
            //     keyboardType: TextInputType.streetAddress,
            //     decoration: InputDecoration(
            //       focusedBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       disabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       enabledBorder: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       border: OutlineInputBorder(
            //         borderSide: const BorderSide(color: Color(0xFFFFAE00)),
            //         borderRadius: BorderRadius.circular(10.0),
            //       ),
            //       labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
            //       labelText: 'State',
            //       isDense: true,
            //     ),
            //   ),
            // ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () {
                  if (isToggle) {
                    final basicInfo = {
                      "tab1": "",
                      "tab2": 1,
                      "tab3": "",
                      "ur_id": ur_id_cur,
                      "ur_same": "1",
                      "ur_userid": Constants.userid,
                      "ur_ownership": ownership,
                      "ur_residingwith": residing,
                      "ur_noofyears": years,
                      "ur_address": _currentAddressController.text,
                      "ur_locality": locality,
                      "ur_pincode": _pincodeController.text,
                      "ur_city": _cityController.text,
                      "ur_state": _stateController.text,
                    };
                    // residentialInfoBody = [addresses, addresses];
                    // residential_info_json = jsonEncode(residentialInfoBody);
                    // print(residential_info_json);
                    // _tabController.animateTo(2);
                    // }

                    // else {
                    //   final current_address = {
                    //     "ur_id": ur_id_cur,
                    //     "ur_same": "0",
                    //     "ur_userid": Constants.userid,
                    //     "ur_ownership": ownership,
                    //     "ur_residingwith": residing,
                    //     "ur_noofyears": years,
                    //     "ur_address": _currentAddressController.text,
                    //     "ur_locality": locality,
                    //     "ur_pincode": _pincodeController.text,
                    //     "ur_city": _cityController.text,
                    //     "ur_state": _stateController.text,
                    //   };
                    //   final permanent_address = {
                    //     "ur_id": ur_id_per,
                    //     "ur_same": "0",
                    //     "ur_userid": Constants.userid,
                    //     "ur_ownership": "",
                    //     "ur_residingwith": "",
                    //     "ur_noofyears": "",
                    //     "ur_address": _permanentAddressController.text,
                    //     "ur_locality": locality,
                    //     "ur_pincode": _pincodeController.text,
                    //     "ur_city": _cityController.text,
                    //     "ur_state": _stateController.text,
                    //   };
                    //   final request = [current_address, permanent_address];
                    //   residential_info_json = jsonEncode(request);

                    // networkCall.updateProfile(basicInfo, context);
                    _tabController.animateTo(2);
                  }
                  // else {
                  //   final basicInfo = {
                  //     "tab1": "",
                  //     "tab2": 1,
                  //     "tab3": "",
                  //     "ur_id": ur_id_cur,
                  //     "ur_same": "1",
                  //     "ur_userid": Constants.userid,
                  //     "ur_address": _currentAddressController.text,
                  //     "ur_pincode": _pincodeController.text,
                  //     "ur_city": _cityController.text,
                  //     "ur_state": _stateController.text,
                  //   };
                  //   networkCall.updateProfile(basicInfo, context);
                  //   _tabController.animateTo(2);
                  // }
                },
                child: const Text(
                  "Save and Continue",
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
    );
  }

  Widget _reference(double width, BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: const Text(
                "Request you to share 4 references with us.",
                style: TextStyle(
                  color: navyBlueColor,
                  fontSize: 18.0,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 1",
                style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_name_1_controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_mobile_no_1_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_relation_type_1_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 2",
                style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_name_2_controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_mobile_no_2_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color:greyColor),
                controller: _reference_relation_type_2_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 3",
                style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color:greyColor),
                controller: _reference_name_3_controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color:greyColor),
                controller: _reference_mobile_no_3_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_relation_type_3_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              width: width,
              margin: const EdgeInsets.only(top: 20.0),
              child: const Text(
                "Reference 4",
                style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.left,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_name_4_controller,
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Name',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_mobile_no_4_controller,
                keyboardType: TextInputType.number,
                maxLength: 10,
                decoration: InputDecoration(
                  counterText: "",
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Mobile Number',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: TextField(
                style: TextStyle(color: greyColor),
                controller: _reference_relation_type_4_controller,
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: navyBlueColor),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelStyle: const TextStyle(color: navyBlueColor),
                  labelText: 'Relation Type',
                  isDense: true,
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 10.0),
              child: ElevatedButton(
                onPressed: () async {
                  Map<String, dynamic> reference_1 = Map<String, dynamic>();
                  Map<String, dynamic> reference_2 = Map<String, dynamic>();
                  Map<String, dynamic> reference_3 = Map<String, dynamic>();
                  Map<String, dynamic> reference_4 = Map<String, dynamic>();
                  var refer;
                  var data = {
                    "tab1": "",
                    "tab2": "",
                    "tab3": 1,
                    "userid": Constants.userid,
                    "urf_id": urf_id_1,
                    // "urf_userid": Constants.userid,
                    "urf_name1": _reference_name_1_controller.text,
                    "urf_mobile1": _reference_mobile_no_1_controller.text,
                    "urf_relation1": _reference_relation_type_1_controller.text,
                    "urf_name2": _reference_name_2_controller.text,
                    "urf_mobile2": _reference_mobile_no_2_controller.text,
                    "urf_relation2": _reference_relation_type_2_controller.text,
                    "urf_name3": _reference_name_3_controller.text,
                    "urf_mobile3": _reference_mobile_no_3_controller.text,
                    "urf_relation3": _reference_relation_type_3_controller.text,
                    "urf_name4": _reference_name_4_controller.text,
                    "urf_mobile4": _reference_mobile_no_4_controller.text,
                    "urf_relation4": _reference_relation_type_4_controller.text
                  };
                  // reference_1 = {
                  //   "tab1": "",
                  //   "tab2": "",
                  //   "tab3": 1,
                  //   "userid": Constants.userid,
                  //   "urf_id": urf_id_1,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_1_controller.text,
                  //   "urf_mobile": _reference_mobile_no_1_controller.text,
                  //   "urf_relation": _reference_relation_type_1_controller.text
                  // };

                  // reference_2 = {
                  //   "tab1": "",
                  //   "tab2": "",
                  //   "tab3": 1,
                  //   "userid": Constants.userid,
                  //   "urf_id": urf_id_2,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_2_controller.text,
                  //   "urf_mobile": _reference_mobile_no_2_controller.text,
                  //   "urf_relation": _reference_relation_type_2_controller.text
                  // };

                  // reference_3 = {
                  //   "tab1": "",
                  //   "tab2": "",
                  //   "tab3": 1,
                  //   "userid": Constants.userid,
                  //   "urf_id": urf_id_3,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_3_controller.text,
                  //   "urf_mobile": _reference_mobile_no_3_controller.text,
                  //   "urf_relation": _reference_relation_type_3_controller.text
                  // };

                  // reference_4 = {
                  //   "tab1": "",
                  //   "tab2": "",
                  //   "tab3": 1,
                  //   "userid": Constants.userid,
                  //   "urf_id": urf_id_4,
                  //   "urf_userid": Constants.userid,
                  //   "urf_name": _reference_name_4_controller.text,
                  //   "urf_mobile": _reference_mobile_no_4_controller.text,
                  //   "urf_relation": _reference_relation_type_4_controller.text
                  // };

                  // String data = "";
                  // if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [
                  //     reference_1,
                  //     reference_2,
                  //     reference_3,
                  //     reference_4
                  //   ];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_2, reference_3, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_3, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_2, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_2, reference_3];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_3, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_2, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_2, reference_3];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isNotEmpty) {
                  //   refer = [reference_1, reference_4];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isNotEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_3];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isNotEmpty &&
                  //     reference_2.isNotEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [reference_1, reference_2];
                  //   // data = jsonEncode(refer);
                  // } else if (reference_1.isEmpty &&
                  //     reference_2.isEmpty &&
                  //     reference_3.isEmpty &&
                  //     reference_4.isEmpty) {
                  //   refer = [""];
                  //   // data = jsonEncode(refer);
                  // }
                  networkCall.updateProfile(data, context);
                  Navigator.pop(context);

                  // network.update_profile(
                  //     basicInfobody, residentialInfoBody, refer, "3", context);
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
                  //shadowColor: const Color(0xFFFFAE00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),
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
}