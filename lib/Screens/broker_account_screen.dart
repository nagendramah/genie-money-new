import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/web_view_screen.dart';
import 'package:scgateway_flutter_plugin/scgateway_flutter_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Model/BrokerResponseModel.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
class BrokerAccountPage extends StatefulWidget {
  String bankname;
  BrokerAccountPage( {Key? key,required this.bankname}) : super(key: key);

  @override
  State<BrokerAccountPage> createState() => _BrokerAccountPageState();
}
var appPassword;
late List<String> brokers;

@override
void initState() {
  String gtwayname="geniemoney";
  bool leprechaunMode = false;

  ScgatewayFlutterPlugin.setConfigEnvironment(GatewayEnvironment.PRODUCTION, gtwayname, leprechaunMode, brokers);


  brokers = [
    "fivepaisa",
    "iifl",
    "kite",
    "kotak"

  ];
}


class _BrokerAccountPageState extends State<BrokerAccountPage> {
  TextEditingController _name = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _pincode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title:  Text(
          widget.bankname.toString(),
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFAE00),
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
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
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
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
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
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
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
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  keyboardType: TextInputType.text,
                  //controller: _email_controller,
                  decoration: InputDecoration(
                    counterStyle: TextStyle(color: Color(0xFFFFAE00)),
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
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
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
                            backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
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
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                    else
                    {
                      getdata();
                    //  ScgatewayFlutterPlugin.initGateway(authToken);

                      ScgatewayFlutterPlugin.leadGen(_name.text, _email.text, _phone.text, _pincode.text);
                   //   ScgatewayFlutterPlugin.leadGenWithStatus(_name.text, _email.text, _phone.text);
                      getpass();

                  /*    Fluttertoast.showToast(
                          msg: "Success",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);*/
                  /*    if(_pincode.text.isNotEmpty)
                        {
                          if (widget.bankname.toString() == "5Pasia") {
                            _launchURL("https://www.5paisa.com/landing/open-demat-online");


                          }
                          else   if (widget.bankname.toString()  == "Kotak Securities") {
                            _launchURL("https://www.kotaksecurities.com/open-demat-account/");
                          }

                          else if (widget.bankname.toString()== "IIFL") {
                            _launchURL("https://www.indiainfoline.com/open-demat-account");
                          }
                          else {
                     //       _launchURL("https://zerodha.com/open-account");
                            _launchURL("https://zerodha.com/open-account");


                          }
                        }*/
                    }
                   // _launchURL();

                    // Navigator.pop(context);
                    //             Navigator.push(context, MaterialPageRoute(builder: context) => VendorPaymentPage));


                  },
                  child: Text(
                    "Submit",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  style: ElevatedButton.styleFrom(
                    //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
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

  _launchURL(String s) async{
    var url = s;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appPassword = prefs.getString("leadgen")??"";
  }

  Future<void> getdata() async {
    Map<String, String> jsonbody = {
        "bank_name": widget.bankname.toString(),
        "name":_name.text.toString(),
        "email":_email.text.toString(),
        "phone":_phone.text.toString(),
        "pincode":_pincode.text.toString(),
        "user_id": Constants.userid.toString(),
        "accoun_type": "demat",

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
          msg: msg,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.green,
          textColor: Colors.white,
          fontSize: 16.0);
      if (widget.bankname.toString() == "5Pasia") {
    //    _launchURL("https://www.5paisa.com/landing/open-demat-online");

        Route route = MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(
                    "https://www.5paisa.com/landing/open-demat-online",
                    "5Pasia"));
        Navigator.of(context).push(route);
      }
      else   if (widget.bankname.toString()  == "Kotak Securities") {
    //    _launchURL("https://www.kotaksecurities.com/open-demat-account/");

        Route route = MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(
                    "https://www.kotaksecurities.com/open-demat-account/",
                    "Kotak Securities"));
        Navigator.of(context).push(route);
      }

      else if (widget.bankname.toString()== "IIFL") {

        Route route = MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(
                    "https://www.indiainfoline.com/open-demat-account",
                    "IIFL"));
        Navigator.of(context).push(route);

       // _launchURL("https://www.indiainfoline.com/open-demat-account");
      }
      else {
        //       _launchURL("https://zerodha.com/open-account");
     //   _launchURL("https://zerodha.com/open-account");
        Route route = MaterialPageRoute(
            builder: (context) =>
                WebViewScreen(
                    "https://zerodha.com/open-account",
                    "Zerodha"));
        Navigator.of(context).push(route);
      }
    }
    else {
      Fluttertoast.showToast(
          msg: "Somthing Went Wrong",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }

}
