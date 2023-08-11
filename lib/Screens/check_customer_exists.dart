import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/source_listModel.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/Model/check_customer_exists_model.dart'
    as checkCustomerExist;

import 'Credit_Card_Lead_Generation_Page.dart';
import 'OTPScreen.dart';

class CheckCustomerExists extends StatefulWidget {
  final String bankname, leadtype, account;
  const CheckCustomerExists(
      {Key? key,
      required this.bankname,
      required this.leadtype,
      required this.account})
      : super(key: key);

  @override
  State<CheckCustomerExists> createState() => _CheckCustomerExistsState();
}

class _CheckCustomerExistsState extends State<CheckCustomerExists> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController mobilenumber = TextEditingController();
  TextEditingController pannumber = TextEditingController();
  String isUserValidated = "0";
  String isPanValidated = "0";

  String personal_category_Id = '13';
  String credit_card_category_Id = '3';
  String isPersonalLoan = "4";
  String iscredit_line = "30";
  String isDemat = "17";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pannumber.addListener(_onTextChanged);
  }

  @override
  void dispose() {
    pannumber.removeListener(_onTextChanged);
    pannumber.dispose();
    mobilenumber.dispose();
    super.dispose();
  }

  void _onTextChanged() {
    final String text = pannumber.text.toUpperCase();
    if (pannumber.text != text) {
      pannumber.value = pannumber.value.copyWith(
        text: text,
        selection: TextSelection(
          baseOffset: text.length,
          extentOffset: text.length,
        ),
        composing: TextRange.empty,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Applicant Details",
          style: TextStyle(
            color: kWhite,
          ),
        ),
      ),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.all(10),
                  child: const Text(
                    "Your Mobile Number should be linked with your PAN Number",
                    style: TextStyle(
                      fontSize: 18,
                      color:navyBlueColor,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: mobilenumber,
                    style: const TextStyle(color:greyColor),
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color: greyColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color:greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Mobile No.',
                      isDense: true,
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter mobile no.';
                      }
                      if (value.length != 10) {
                        return 'Mobile no. must be 10 digits';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  margin: const EdgeInsets.all(10),
                  child: TextFormField(
                    style: const TextStyle(color: greyColor),
                    cursorColor: greyColor,
                    decoration: InputDecoration(
                      counterStyle: const TextStyle(color: greyColor),
                      focusedBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      disabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: greyColor),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      labelStyle: const TextStyle(color: navyBlueColor),
                      // hintText: 'Email / Mobile No.',
                      labelText: 'Pan No.',
                      isDense: true,
                    ),
                    controller: pannumber,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter PAN';
                      }
                      if (value.length != 10) {
                        return 'PAN must be 10 characters';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  height: 50,
                  margin: const EdgeInsets.all(20),
                  child: Center(
                    child: ElevatedButton(
                      onPressed: () {
                        submitDetail(mobilenumber.text, isUserValidated,
                            isPanValidated, pannumber.text, widget.leadtype);
                      },
                      child: const Text(
                        "Next",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                        backgroundColor: navyBlueColor,
                        //shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      )),
    );
  }

  dynamic customerId = "";
  Future<void> submitDetail(String mobilenumber, String isUserValidated,
      String isPanValidated, String pannumber, String leadtype) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      String categoryId = "";
      if (leadtype == "Credit Card") {
        categoryId = credit_card_category_Id;
      } else if (leadtype == "saving_account" || leadtype=="current_account") {
        categoryId = personal_category_Id;
      } else if (leadtype == "personal_loan") {
        categoryId = isPersonalLoan;
      }else if(leadtype == "credit_lines"){
        categoryId = iscredit_line;
      }else if (leadtype == "demat_account"){
        categoryId = isDemat;
      }
      try {
        String url =
            "https://leadapi.banksathi.com/api/b2b/checkCustomerExists?mobile_no=$mobilenumber&is_user_validated=$isUserValidated&is_pan_validated=$isPanValidated&pan=$pannumber&category_id=$categoryId";
        final response = await ApiHandler.shared.getCustomerExist(url);
        if (response != null) {
          dynamic data = response.data;

          if (data.profileDetails != null) {
            customerId = data.profileDetails.customerId ?? "";
          }
          mobilenumber = data.mobileNo;
        }
        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: navyBlueColor,
            textColor: Colors.white,
            fontSize: 16.0);
        if (response.message == "Existing customer") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreditCardLeadGeneration(
                        mobilenumber: mobilenumber,
                        categoryid: categoryId,
                        customerid: customerId,
                        bankname: widget.bankname,
                        leadtype: widget.leadtype,
                        account: widget.account,
                      )));
        } else if (response.message == "OTP Sent to Mobile Number" ||
            response.message == "OTP Resent") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => OTPScreen(
                        pan: pannumber,
                        mobilenumber: mobilenumber,
                    customerId: customerId,
                        categoryid: categoryId,
                        bankname: widget.bankname,
                        leadtype: widget.leadtype,
                        account: widget.account,
                      )));
        }
      } catch (e) {
        if (kDebugMode) {
          print(e);
          ApiHandler.shared.showErrorDialog(context, "Url is not Available");
        }
      }
    }
  }
}
