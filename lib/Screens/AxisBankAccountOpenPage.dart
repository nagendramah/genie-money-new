import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/AccountOpeninModel.dart';
import 'package:genie_money/Screens/web_view_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/data/remote/network/NetworkApiServicePaySprint.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/BrokerResponseModel.dart';
import '../data/remote/network/ApiEndPointsPaySprint.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
class AxisBankOpening extends StatefulWidget {
  final int banktype;
  final String account;
  final String bankname;

  const AxisBankOpening({Key? key, required this.banktype, required this.account, required this.bankname}) : super(key: key);
  @override
  State<AxisBankOpening> createState() => _AxisBankOpeningState();
}

class _AxisBankOpeningState extends State<AxisBankOpening> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pincode = TextEditingController();
  var accounttype;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title:  Text(
          widget.bankname.toString(),
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: kWhite,
          onPressed: () {
            /*  Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Home()));*/
            Navigator.of(context).pop();
          },
        ),

      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _name,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
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
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Name',
                    isDense: true,
                  )),
            ),

            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _email,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
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
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Email',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _phone
                  ,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color:greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
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
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Phone no',
                    isDense: true,
                  )),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: TextFormField(
                  controller: _pincode,
                  //controller: _email_mobile_controller,
                  style: const TextStyle(color: greyColor),
                  cursorColor: greyColor,
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: navyBlueColor),
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
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Pincode',
                    isDense: true,
                  )),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.all(10),
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    if(_name.text.isEmpty)
                    {
                      Fluttertoast.showToast(
                          msg: "Please enter name",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else if(_email.text.isEmpty)
                    {
                      Fluttertoast.showToast(
                          msg: "Please enter email",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else  if(_phone.text.isEmpty)
                    {
                      Fluttertoast.showToast(
                          msg: "Please enter phone no",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else  if(_pincode.text.isEmpty)
                    {
                      Fluttertoast.showToast(
                          msg: "Please enter pincode",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: navyBlueColor,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else
                    {
                      getdata();
                      //  ScgatewayFlutterPlugin.initGateway(authToken);

                      // ScgatewayFlutterPlugin.leadGen(_name.text, _email.text, _phone.text, _pincode.text);
                      // //   ScgatewayFlutterPlugin.leadGenWithStatus(_name.text, _email.text, _phone.text);
                      getpass();

                /*      Fluttertoast.showToast(
                          msg: "Success",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);*/
                      if(_pincode.text.isNotEmpty)
                      {
                        openaccount();
                     //   getdata();


                      }
                    }
                    // _launchURL();

                    // Navigator.pop(context);
                    //             Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));


                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: kWhite,
                        fontSize: 16,
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
            ),

          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    print(widget.banktype);
    print(widget.account);
    if(widget.account=="Current Account")
      {
        accounttype="current_account";
      }
    else{
      accounttype="saving_account";

    }

  }

  Future<void> getdata() async {
    Map<String, String> jsonbody = {
      "bank_name": widget.bankname.toString(),
      "name":_name.text.toString(),
      "email":_email.text.toString(),
      "phone":_phone.text.toString(),
      "pincode":_pincode.text.toString(),
      "user_id": Constants.userid.toString(),
      "accoun_type": accounttype.toString(),

    };
    var network = NewVendorApiService();
    String urls =
        "https://geniemoneyy.com/genie_money/index.php/saveDemateAccount";
    var res = await network.postresponse(urls, jsonbody);
    var model = BrokerResponseModel.fromJson(res);
    print("ApiResponse"+res.toString());
    String stat = model.status.toString();
    String msg = model.messages!.success.toString();
    if (stat.toString().contains("201")) {
      Fluttertoast.showToast(
          msg: "Account Register successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    else {
      Fluttertoast.showToast(
          msg: "Somthing Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: navyBlueColor,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

  void getpass() {}

  Future<void> openaccount() async {
    try{
      loadProgress();
      var network =  NetworkApiServicePaySprint();

      ;
      Map<String,String> jsonbody = {
        "merchantcode": "A002",
        "type": widget.banktype.toString()



      };
      var res = await network.postResponse(ApiEndPointsPaySprint().AxisAccountopening, jsonbody);
      print(res);
      print("Account Opnening");

      Map<String, dynamic> jsonres = res;
      var model = AccountOpeninModel.fromJson(jsonres);
      if(model.status==true){
        setState(() {
          String data = model.data.toString();
         // _launchURL(data);
          Route route = MaterialPageRoute(
              builder: (context) =>
                    WebViewScreen(
                      data,
                      "Axis Account Opening"));
          Navigator.of(context).push(route);

        });
      }
      setState(() {
      });
      loadProgress();
    }catch(e){
      loadProgress();
      print(e);
    }

  }

  _launchURL(String s) async{
    var url = s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void loadProgress() {}

}
