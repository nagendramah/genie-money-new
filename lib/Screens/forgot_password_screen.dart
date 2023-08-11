import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';

import '../Model/ForgetPasswordResponse.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ForgotPassword();
  }
}

class _ForgotPassword extends State<ForgotPassword> {
  TextEditingController _email_mobile_controller = TextEditingController();
  bool _isEmailValid = true; 
  bool _isMobileValid = true;
  void _validateFields() {
    final String input = _email_mobile_controller.text.trim();

    // Email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[a-zA-Z0-9-]+(\.[a-zA-Z0-9-]+)+$');
    final isEmailValid = emailRegex.hasMatch(input);

    // Mobile number validation
    final mobileRegex = RegExp(r'^[0-9]{10}$');
    final isMobileValid = mobileRegex.hasMatch(input);

    setState(() {
      _isEmailValid = isEmailValid;
      _isMobileValid = isMobileValid;

      if (isEmailValid || isMobileValid) {
        // Perform password recovery logic here
       getnewPassword();
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        title: Text("Forgot Password",style: TextStyle(color:kWhite,),),
        backgroundColor: navyBlueColor,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              margin: const EdgeInsets.only(left: 10.0, right: 10.0, top: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Card(
                    color: navyBlueColor,
                   // shadowColor: const Color(0xFF3A3A3A),
                    child: Column(
                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: const Center(
                            child: Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 30.0,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(10.0),
                          child: const Center(
                            child: Text(
                              "Enter Your Registered Email id / Mobile No",
                              style: TextStyle(
                                color: kWhite,
                                fontSize: 20.0,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.all(20.0),
                          child: TextField(
                            style: TextStyle(
                              color: kWhite,
                            ),
                            cursorColor: kWhite,
                            controller: _email_mobile_controller,
                            decoration: InputDecoration(

                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide: const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Email / Mobile No.',
                              labelStyle: const TextStyle(color: kWhite),
                                errorText: (_isEmailValid || _isMobileValid) ? null : 'Invalid email/mobile number',
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 30.0),
                    child: ElevatedButton(
                      child: const Text(
                        "Submit",
                        style: TextStyle(
                            color: kWhite,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, 25.0), backgroundColor: navyBlueColor,
                        //shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                       // getnewPassword();
                         _validateFields();
                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) => const Home()));
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

 // void getnewPassword() {}
  Future<void> getnewPassword() async {

    if(_email_mobile_controller.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Please Enter Mobile Number or Email",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    else{
      Map<String, String> jsonbody = {

        "email":_email_mobile_controller.text,

      };
      var network = NewVendorApiService();

      String urls =
          "https://geniemoneyy.com/genie_money/index.php/forgetpass";
      var res = await network.postresponse(urls, jsonbody);
      var model = ForgetPasswordResponse.fromJson(res);
      String stat = model.status.toString();
      String errormsgs = model.messages!.error.toString();
      String errormsg = model.messages.toString();




      if (model.status == 201) {
        Fluttertoast.showToast(
            msg: "Otp send to Your email successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

Navigator.pop(context);
      }
      else {
        Fluttertoast.showToast(
            msg: errormsgs,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
      print("" + res!.toString());
    //  print("vvvvvvvvvvvvv" + Constants.userid.toString());

    }

  }

}