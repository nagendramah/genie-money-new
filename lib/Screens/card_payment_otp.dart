import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'credit_card_payment.dart';
import 'package:genie_money/Screens/portfolio.dart';
import 'package:genie_money/utils/network.dart';
import 'package:shared_preferences/shared_preferences.dart';


class OTPScreenCard extends StatefulWidget {
  String username, password, type;

  OTPScreenCard(this.username, this.password, this.type, {Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _OtpScreenCard();
}

class _OtpScreenCard extends State<OTPScreenCard> {
  Color boxColor = const Color(0xFFFFAE00);

  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Card(
                          color: const Color(0xFF3A3A3A),
                          shadowColor: const Color(0xFF3A3A3A),
                          child: Column(
                            // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: const Center(
                                  child: Text(
                                    "Enter the OTP here",
                                    style: TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontSize: 23.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: Center(
                                  child: Text(
                                    "Enter the 4-digit verification code that was sent to the number\nYour Mobile No." +
                                        widget.username,
                                    style: const TextStyle(
                                      color: Color(0xFFFFAE00),
                                      fontSize: 14.0,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.all(10.0),
                                child: OtpTextField(

                                  numberOfFields: 6,
                                  borderColor: boxColor,
                                  focusedBorderColor: boxColor,
                                  cursorColor: boxColor,
                                  keyboardType: TextInputType.number,
                                  borderRadius:
                                  const BorderRadius.all(Radius.circular(10.0)),
                                  fieldWidth: width * 0.10,
                                  textStyle: const TextStyle(
                                      color: Color(0xFFFFAE00), fontSize: 10.0),
                                  //set to true to show as box or false to show as dash
                                  showFieldAsBox: true,
                                  //runs when a code is typed in
                                  onCodeChanged: (String code) {
                                    //handle validation or checks here
                                  },
                                  //runs when every textfield is filled
                                  onSubmit: (String verificationCode) async {
                                    DeviceInfoPlugin deviceInfo =
                                    DeviceInfoPlugin();
                                    var model, manufacturer, release, sdkInt, id;
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    if (Platform.isAndroid) {
                                      AndroidDeviceInfo androidInfo =
                                      await deviceInfo.androidInfo;
                                      model = androidInfo.model;
                                      manufacturer = androidInfo.manufacturer;
                                      release = androidInfo.version.release;
                                      sdkInt = androidInfo.version.sdkInt;
                                      id = androidInfo.androidId;
                                    } else {
                                      IosDeviceInfo iosDevice =
                                      await deviceInfo.iosInfo;
                                      model = iosDevice.name;
                                      manufacturer = iosDevice.model;
                                      release = iosDevice.systemName;
                                      sdkInt = iosDevice.systemVersion;
                                      id = iosDevice.identifierForVendor;
                                    }

                                    String sdk = "$sdkInt";
                                    NetworkCall networkcall = NetworkCall();
                                    setState(() {
                                      //isLoading = true;
                                    });
                                    /*bool status = await networkcall.fetchLoginPosts(
                                        widget.username,
                                        widget.password,
                                        verificationCode,
                                        widget.type,
                                        context);
                                    setState(() {
                                      isLoading = false;
                                    });*/
                                    bool status = true;

                                  }, // end onSubmit
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.05,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                            left: 10.0, right: 10.0, top: 30.0),
                        child: ElevatedButton(
                          child: const Text(
                            "Pay",
                            style: TextStyle(
                                color: Color(0xFF111111),
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold),
                          ),
                          style: ElevatedButton.styleFrom(
                            fixedSize: Size(width, 25.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          onPressed: () async {
                            NetworkCall networkCall = NetworkCall();
                            setState(() {
                              isLoading = true;
                            });
                           /* await networkCall.resendOtp(widget.username, widget.password, context);
                            setState(() {
                              isLoading = false;
                            });*/
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Visibility(
              visible: isLoading,
              child: Center(
                child: CircularProgressIndicator(
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
