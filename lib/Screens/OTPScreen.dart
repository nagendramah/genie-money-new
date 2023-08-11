import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
import 'package:genie_money/Screens/terms_condition.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/otp_field_style.dart';
import 'package:otp_text_field/style.dart';
import 'package:genie_money/Model/OTPvalidation_model_class.dart';

class OTPScreen extends StatefulWidget {
  final String? bankname, leadtype, account, pan, mobilenumber, categoryid,  customerId;

  const OTPScreen(
      {Key? key,
        this.customerId,
      this.pan,
      this.mobilenumber,
      this.categoryid,
      this.bankname,
      this.leadtype,
      this.account})
      : super(key: key);

  @override
  State<OTPScreen> createState() => _OTPScreenState();
}

class _OTPScreenState extends State<OTPScreen> {
  bool isVisible = true;
  bool isVisibleContinue = false;

  String Otp = "";
  // final _formKey = GlobalKey<FormState>();
  FocusNode button = FocusNode();
  String getModifiedMobileNumber(String? mobileNumber) {
    if (mobileNumber == null || mobileNumber.length <= 2) {
      return '';
    }
    final frontDigits = mobileNumber.substring(0, mobileNumber.length - 8);
    final lastTwoDigits = mobileNumber.substring(mobileNumber.length - 2);
    return '$frontDigits******$lastTwoDigits';
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kWhite,
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
                          text: 'Enter the OTP sent on your mobile number ',
                          style: const TextStyle(
                              fontSize: 16, color: navyBlueColor),
                          children: <TextSpan>[
                            TextSpan(
                                text: getModifiedMobileNumber(
                                    widget.mobilenumber),
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: navyBlueColor,
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
                              focusBorderColor: navyBlueColor,
                              enabledBorderColor: navyBlueColor,
                              backgroundColor: navyBlueColor),
                          onChanged: (value) {},
                          contentPadding: const EdgeInsets.all(20),
                          length: 4,
                          width: width * .87,
                          fieldWidth: 60,
                          style: const TextStyle(
                            fontSize: 18,
                            color: kWhite,
                          ),
                          textFieldAlignment: MainAxisAlignment.spaceAround,
                          fieldStyle: FieldStyle.box,
                          onCompleted: (pin) {
                            Otp = pin.toUpperCase();
                          },
                          keyboardType: TextInputType.text,
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
                              OTPValidation(Otp);
                            },
                            child: Text(
                              "Validate",  style: const TextStyle(
                              fontSize: 16, color: kWhite)
                            ),
                            color: navyBlueColor,
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Center(
                          child: MaterialButton(
                              color: navyBlueColor,
                              onPressed: () {
                                resendOtp(widget.mobilenumber!, widget.pan!,
                                    widget.categoryid!);
                              },
                              child: Text(
                                "Resend", style: const TextStyle(
                              fontSize: 16, color: kWhite)
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
      ),
    );
  }

  var customer_profile_id;
  Future<void> OTPValidation(String Otp) async {
    try {
      if (Otp.isEmpty) {
        Fluttertoast.showToast(
          msg: "Please enter the OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0,
        );
        return;
      }
      final url = 'https://leadapi.banksathi.com/api/b2b/validateOtp';
      Map<String, dynamic> body = {
        "mobile_no": widget.mobilenumber,
        "pan": widget.pan,
        "category_id": widget.categoryid,
        "otp": Otp
      };

      final response = await ApiHandler.shared.getOTP(url, body);
      dynamic data = response.data!;
      var customer_profile_id = "";
      if (data is List<Data> && data.isNotEmpty) {
        // Assuming you want to access the first element in the list
        customer_profile_id = data[0].customerProfileId ?? "";
      } else if (data is Data) {
        // Handle the case when data is a single instance of Data
        customer_profile_id = data.customerProfileId ?? "";
      }

/*if(data.customerProfileId != null) {
  customer_profile_id = data.customerProfileId ?? "";
}*/
      if (response != null) {
        Fluttertoast.showToast(
            msg: response.message,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor:
                (response.status == false) ? Colors.red : Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        if (response.message == "Customer profile has been created." ||
            response.message == "Customer Profile already exists." ||
            response.message == "Customer created successfully") {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CreditCardLeadGeneration(
                      bankname: widget.bankname!,
                      leadtype: widget.leadtype!,
                      account: widget.account!,
                      mobilenumber: widget.mobilenumber,
                      categoryid: widget.categoryid,
                      customerid:
                          customer_profile_id) /*TermAndCondition(
                    bankname: widget.bankname,
                      leadtype: widget.leadtype,
                      account: widget.account,
                      mobilenumber: widget.mobilenumber,
                      categoryid: widget.categoryid,
                      customerid: customer_profile_id)*/
                  ));
        }
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        ApiHandler.shared.showErrorDialog(context, "Url is not Available");
      }
    }
  }

  Future<void> resendOtp(String mobile, String pan, String categoryid) async {
    try {
      final url =
          'https://leadapi.banksathi.com/api/b2b/resendOtp?mobile_no=$mobile&pan=$pan&category_id=$categoryid';
      dynamic response = await ApiHandler.shared.getResendOtp(url);

      if (response != null) {
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
