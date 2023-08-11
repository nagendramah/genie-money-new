import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Screens/eligible_products.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:genie_money/Model/CreditScoreOTPResponse.dart'
    as CreditScoreOtp;
import 'package:genie_money/Model/CreditScoreOtpValidation.dart'
    as CreditScoreValidation;
import 'package:genie_money/Model/resend_creditscoreOtp.dart'
    as CreditScoreResend;

class OTPCreditScoreCheck extends StatefulWidget {
  final String? customerid,
      terms,
      categord_id,
      mobilenumber,
      bankname,
      leadtype,
      account;
  const OTPCreditScoreCheck(
      {Key? key,
      this.customerid,
      this.bankname,
      this.account,
      this.leadtype,
      this.mobilenumber,
      this.terms,
      this.categord_id})
      : super(key: key);

  @override
  State<OTPCreditScoreCheck> createState() => _OTPCreditScoreCheckState();
}

class _OTPCreditScoreCheckState extends State<OTPCreditScoreCheck> {
  bool isLoading = true;
  String Otp = "";
  FocusNode button = FocusNode();
  dynamic refresheddata;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCreditScore();
  }

  String getModifiedMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.length <= 2) {
      return '';
    }
    final frontDigits = mobileNumber.substring(0, mobileNumber.length - 8);
    final lastTwoDigits = mobileNumber.substring(mobileNumber.length - 2);
    return '$frontDigits******$lastTwoDigits To Credit Score';
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    if (isLoading) {
      return const Scaffold(
        backgroundColor: Color(0xFFFFAE00),
        body: SafeArea(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    }
    return refresheddata == "You are not allowed to refresh credit score yet !"
        ?  const Scaffold(
                backgroundColor: Color(0xFFFFAE00),
                body: SafeArea(child: Text("Credit score")),
              )
        : Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: const Color(0xFFFFAE00),
            body: SafeArea(
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: const BoxDecoration(
                        color: Color(0xFF111111),
                      ),
                      // color: Colors.white,
                      width: double.infinity,
                      // height: MediaQuery.of(context).size.height * 0.7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 80,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: RichText(
                              textAlign: TextAlign.center,
                              text: TextSpan(
                                text:
                                    'Enter the OTP sent on your mobile number ',
                                style: const TextStyle(
                                    fontSize: 16, color: Color(0xFFFFAE00)),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: getModifiedMobileNumber(
                                          widget.mobilenumber),
                                      style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xFFFFAE00),
                                          fontSize: 18)),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              OTPTextField(
                                otpFieldStyle: OtpFieldStyle(
                                    focusBorderColor: const Color(0xFFFFAE00),
                                    enabledBorderColor: const Color(0xFFFFAE00),
                                    backgroundColor: const Color(0xFFFFAE00)),
                                onChanged: (value) {},
                                contentPadding: const EdgeInsets.all(15),
                                length: 6,
                                width: width * .90,
                                fieldWidth: 50,
                                style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.black,
                                ),
                                textFieldAlignment:
                                    MainAxisAlignment.spaceAround,
                                fieldStyle: FieldStyle.box,
                                onCompleted: (pin) {
                                  Otp = pin.toUpperCase();
                                },
                                keyboardType: TextInputType.number,
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Center(
                                child: MaterialButton(
                                  onPressed: () {
                                    validateCreditScore();
                                  },
                                  child: const Text(
                                    "Validate",
                                  ),
                                  color: const Color(0xFFFFAE00),
                                ),
                              ),
                              const SizedBox(
                                width: 30,
                              ),
                              Center(
                                child: MaterialButton(
                                    color: const Color(0xFFFFAE00),
                                    onPressed: () {
                                      resendCreditScoreOtp();
                                    },
                                    child: const Text(
                                      "Resend",
                                    )),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                  // SizedBox(height: ,)
                ],
              ),
            ));
  }

  String stageOneId = "";
  String stageTwoId = "";

  Future<void> getCreditScore() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/generateCreditSocreOtp";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "terms": widget.terms,
        "category_id": widget.categord_id,
        "mobile_no": widget.mobilenumber
      };
      final response = await ApiHandler.shared.postCreditScoreOTP(url, body);
      dynamic data = response.data;
      refresheddata = response.message;
      if (data is List<CreditScoreOtp.Data> && data.isNotEmpty) {
        stageOneId = data[0].stageOneId ?? "";
        stageTwoId = data[0].stageTwoId ?? "";
      } else if (data is CreditScoreOtp.Data) {
        stageOneId = data.stageOneId!;
        stageTwoId = data.stageTwoId!;
      }

      Fluttertoast.showToast(
          msg: refresheddata,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor:
              (response.status == false) ? Colors.red : Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (refresheddata ==
          "You are not allowed to refresh credit score yet !") {
        setState(() {
          isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EligibleProduct(
                      customerid: widget.customerid,
                      category_id: widget.categord_id,
                      bankname: widget.bankname,
                      leadtype: widget.leadtype,
                      account: widget.account,
                    )));
      }else if(refresheddata == "OTP is sent to your mobile number."){
        setState(() {
          isLoading = false;
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        ApiHandler.shared.showErrorDialog(context, "Url is not Available");
      }
    }
  }

  Future<void> validateCreditScore() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/validateCreditScoreOtp";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "stage_one_id": stageOneId,
        "stage_two_id": stageTwoId,
        "otp": Otp,
        "mobile_no": widget.mobilenumber,
        "is_masked": "false",
        "category_id": widget.categord_id
      };
      final response =
          await ApiHandler.shared.postCreditScoreOtpValidation(url, body);
      CreditScoreValidation.Data data = response.data;
      Fluttertoast.showToast(
          msg: response.message,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor:
              (response.status == false) ? Colors.red : Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (response.message == "Credit score generated") {
        setState(() {
          isLoading = false;
        });
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EligibleProduct(
                      customerid: widget.customerid,
                      category_id: widget.categord_id,
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

  Future<void> resendCreditScoreOtp() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/resendCreditScoreOtp";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "stage_one_id": stageOneId,
        "stage_two_id": stageTwoId,
        "category_id": widget.categord_id,
        "mobile_no": widget.mobilenumber,
        "is_masked": "false"
      };
      final response =
          await ApiHandler.shared.postCreditScoreResendOtp(url, body);
      if (response != null) {
        CreditScoreResend.Data data = response.data;

        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor:
                (response.status == false) ? Colors.red : Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        ApiHandler.shared.showErrorDialog(context, "Url is not Available");
      }
    }
  }
}
