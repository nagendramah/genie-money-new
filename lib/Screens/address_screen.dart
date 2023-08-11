// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/network.dart';

import '../utils/constants.dart';

class AddressScreen extends StatefulWidget {
  final title;

  const AddressScreen({this.title, Key? key}) : super(key: key);

  @override
  _AddressScreenState createState() => _AddressScreenState();
}

class _AddressScreenState extends State<AddressScreen> {
  final TextEditingController _presentAddressController =
  TextEditingController();
  final TextEditingController _localityController = TextEditingController();
  final TextEditingController _pincodeController = TextEditingController();
  final TextEditingController _cityController = TextEditingController();
  final TextEditingController _stateController = TextEditingController();

  bool isCurrentAddress = false;

  List<String> ownerShipList = ['Owned', 'Rented', 'Parental'];

  List<String> residingWithList = ["Family", "Friends", "Alone"];

  List<String> numberOfYearsList = [
    'Less than Six Months',
    'Six Months to Two Years',
    'Two Years to Five Years',
    'More than Five Years'
  ];

  String ownership = '';
  String residingWith = '';
  String numberOfYears = '';

  NetworkCall networkCall = NetworkCall();

  @override
  void initState() {
   if (widget.title == "Present Address") {
    isCurrentAddress = true;
   
  } else if (widget.title == "Permanent Address") {
    isCurrentAddress = true;
   
  }
    networkCall.getPersonalDetails().then((value) => {
      setState(() {

        numberOfYears = value.userdetails.residentialinfo.urNoofyears ==
            'Less than Six Months'
            ? 'Less than Six Months'
            : value.userdetails.residentialinfo.urNoofyears ==
            'Six Months to Two Years'
            ? 'Six Months to Two Years'
            : value.userdetails.residentialinfo.urNoofyears ==
            'Two Years to Five Years'
            ? 'Two Years to Five Years'
            : 'More than Five Years';

        ownership = value.userdetails.residentialinfo.urOwnership == "Owned"
            ? "Owned"
            : value.userdetails.residentialinfo.urOwnership == "Rented"
            ? "Rented"
            : "Parental";
        residingWith = value.userdetails.residentialinfo.urResidingwith ==
            "Family"
            ? "Family"
            : value.userdetails.residentialinfo.urResidingwith == "Friends"
            ? "Friends"
            : "Alone";
        _presentAddressController.text =
            value.userdetails.residentialinfo.urAddress;
        _localityController.text =
            value.userdetails.residentialinfo.urLocality;
        _pincodeController.text =
            value.userdetails.residentialinfo.urPincode;
        _cityController.text = value.userdetails.residentialinfo.urCity;
        _stateController.text = value.userdetails.residentialinfo.urState;
      }
      
      ),
      // },
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
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
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                Visibility(
                  visible: isCurrentAddress,
                  child: Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: DropdownButtonFormField<String>(
                          dropdownColor: kWhite,
                          isExpanded: true,
                          decoration: const InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color:navyBlueColor),
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
                            label: Text("Home Ownership Status"),
                            isDense: true,
                          ),

                          value:  ownership.isEmpty ? null :  ownership,
                        //  value: ownership,
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
                              ownership = data!;
                            });
                          },
                          items: ownerShipList
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
                            label: Text("Residing With"),
                            isDense: true,
                          ),
                          value:  residingWith.isEmpty ? null : residingWith,
                          //value: residingWith,
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
                              residingWith = data!;
                            });
                          },
                          items: residingWithList
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
                            label: Text("Number Of Years At Current Address"),
                            isDense: true,
                          ),
                          value:  numberOfYears.isEmpty ? null :  numberOfYears,
                          //value: numberOfYears,
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
                              numberOfYears = data!;
                            });
                          },
                          items: numberOfYearsList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: greyColor),
                    controller: _presentAddressController,
                    keyboardType: TextInputType.multiline,
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
                      labelText: 'Address',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: greyColor),
                    controller: _localityController,
                    keyboardType: TextInputType.streetAddress,
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
                      labelText: 'Locality / Area',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: greyColor),
                    controller: _pincodeController,
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
                      labelText: 'Pin Code',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color:greyColor),
                    controller: _cityController,
                    keyboardType: TextInputType.text,
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
                      labelText: 'City',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: TextField(
                    style: const TextStyle(color: greyColor),
                    controller: _stateController,
                    keyboardType: TextInputType.streetAddress,
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
                      labelText: 'State',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10.0),
                  child: ElevatedButton(
                    onPressed: () {
                      // var data = {
                      //   "tab1": "",
                      //   "tab2": 1,
                      //   "tab3": "",
                      //   "ur_userid": Constants.userid,
                      //   "userid": Constants.userid,
                      //   "ur_ownership": ownership,
                      //   "ur_residingwith": residingWith,
                      //   "ur_noofyears": numberOfYears,
                      //   "ur_address": _presentAddressController.text +
                      //       ", " +
                      //       _localityController.text,
                      //   "ur_locality": _localityController.text,
                      //   "ur_city": _cityController.text,
                      //   "ur_state": _stateController.text,
                      //   "ur_pincode": _pincodeController.text
                      // };
                      // networkCall.updateProfile(data, context);
                      if (_presentAddressController.text.isNotEmpty) {
                        if (_localityController.text.isNotEmpty) {
                          if (_cityController.text.isNotEmpty) {
                            if (_stateController.text.isNotEmpty) {
                              if (_pincodeController.text.isNotEmpty) {
                                final data;
                                if (isCurrentAddress) {
                                  data = {
                                    "userid": Constants.userid,
                                    "tab1": "",
                                    "tab2": 1,
                                    "tab3": "",
                                    "ur_userid": Constants.userid,
                                    "ur_ownership": ownership,
                                    "ur_residingwith": residingWith,
                                    "ur_noofyears": numberOfYears,
                                    "ur_address":
                                    _presentAddressController.text,
                                    "ur_locality": _localityController.text,
                                    "ur_city": _cityController.text,
                                    "ur_state": _stateController.text,
                                    "ur_pincode": _pincodeController.text
                                  };
                                  networkCall.updateProfile(data, context);
                                } else {
                                  data = {
                                    "address": _presentAddressController.text +
                                        ", " +
                                        _localityController.text,
                                    "city": _cityController.text,
                                    "locality": _localityController.text,
                                    "state": _stateController.text,
                                    "pincode": _pincodeController.text
                                  };
                                }
                                var result = jsonEncode(data);
                                Navigator.pop(context, result);
                              } else {
                                _createToast("Please enter Pincode");
                              }
                            } else {
                              _createToast("Please enter State");
                            }
                          } else {
                            _createToast("Please enter City");
                          }
                        } else {
                          _createToast("Please enter Locality");
                        }
                      } else {
                        _createToast("Please enter Address");
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