import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Model/ChangePasswordModel.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
import 'package:genie_money/utils/constants.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();

}

class _ChangePasswordState extends State<ChangePassword> {
  @override
  _savebool() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
await prefs.setBool("lock", isToggle);
  }

  TextEditingController _Password = TextEditingController();
  TextEditingController _newPassword = TextEditingController();
  TextEditingController _appPassword = TextEditingController();
  TextEditingController _comfirmAPassword = TextEditingController();
  bool isToggle = false;
  bool showPermanentAddress = false;

  bool _passwordVisible=true;
  var sharePassword;


  @override
  void initState() {
    _passwordVisible = false;
loadData();
    getpass();
    super.initState();

  }

  loadData()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
setState(() {
  isToggle = prefs.getBool("lock")!;
});
  }


  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: kWhite,

      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Change Password",
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),

      body: SingleChildScrollView(
        child: Container(

          child: Column(
            children: [
              Card(
                color: navyBlueColor,

                child: Padding(

                  padding: const EdgeInsets.only(
                      top: 10.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: const Text('Enable Default Lock For Genie Moneyy ',style: TextStyle(
                       color: kWhite,fontSize: 20
                   ),
                   ),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color:kWhite,
                    ),
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Column(
                              children: [
                                Text(
                                  "Enable Default Lock",
                                  style: TextStyle(
                                      color: kWhite, fontSize: 20.0),
                                  textAlign: TextAlign.left,
                                ),
                              ],
                            ),
                            FlutterSwitch(
                              activeColor: kWhite,
                              inactiveColor: kWhite,
                              toggleColor: navyBlueColor,
                              width: width * 0.15,
                              height: height * 0.05,
                              toggleSize: 25.0,
                              value: isToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {

                                  isToggle = val;
                                  _savebool();
                                });
                              },
                            ),
                          ],
                        ),
                      ),




                    ],
                  ),
                ),
              ),


              Card(
                color: navyBlueColor,

                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: const Text('Set Login Password',style: TextStyle(
                        color: kWhite ,fontSize: 20
                    ),),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color:kWhite,
                    ),
                    children: <Widget>[
                      Container(

                        margin: const EdgeInsets.all(10),
                        child: TextField(
                            obscureText: _passwordVisible,

                            controller: _Password,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color:kWhite),
                            cursorColor: kWhite,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(color:kWhite),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color:kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: kWhite),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Password',
                              isDense: true,
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }, icon:  Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: navyBlueColor,
                              ),),

                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                            obscureText: _passwordVisible,

                            controller: _newPassword,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color: kWhite),
                            cursorColor: kWhite,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(color: kWhite),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color:kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: kWhite),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Confirm Password',
                              isDense: true,
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }, icon:  Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kWhite,
                              ),),

                            )),
                      ),

                      Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              //Navigator.pop(context);
                              setState(() {
                                changepass();
                               // Navigator.of(context).pop();
                              });
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                              backgroundColor: kWhite,
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
              ),


              Card(
                color:navyBlueColor,

                child: Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, left: 6.0, right: 6.0, bottom: 6.0),
                  child: ExpansionTile(
                    title: const Text('Set Password for Genie Moneyy App',style: TextStyle(
                        color:kWhite,fontSize: 20
                    ),),
                    trailing: const Icon(
                      Icons.keyboard_arrow_down,
                      color:kWhite,
                    ),
                    children: <Widget>[
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                            obscureText: _passwordVisible,

                            controller: _appPassword,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color:kWhite),
                            cursorColor: kWhite,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(color:kWhite),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: kWhite),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Password',
                              isDense: true,
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }, icon:  Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kWhite,
                              ),),

                            )),
                      ),
                      Container(
                        margin: const EdgeInsets.all(10),
                        child: TextFormField(
                            obscureText: _passwordVisible,

                            controller: _comfirmAPassword,
                            //controller: _email_mobile_controller,
                            style: const TextStyle(color:kWhite),
                            cursorColor: kWhite,
                            keyboardType: TextInputType.text,
                            //controller: _email_controller,
                            decoration: InputDecoration(
                              counterStyle: const TextStyle(color: kWhite),
                              focusedBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color:kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              disabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color:kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              enabledBorder: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              border: OutlineInputBorder(
                                borderSide:
                                const BorderSide(color: kWhite),
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              labelStyle: const TextStyle(color: kWhite),
                              // hintText: 'Email / Mobile No.',
                              labelText: 'Confirm Password',
                              isDense: true,
                              suffixIcon: IconButton(onPressed: () {
                                setState(() {
                                  _passwordVisible = !_passwordVisible;
                                });
                              }, icon:  Icon(
                                // Based on passwordVisible state choose the icon
                                _passwordVisible
                                    ? Icons.visibility_off
                                    : Icons.visibility,
                                color: kWhite,
                              ),),

                            )),
                      ),

                      Container(
                        height: 40,
                        margin: const EdgeInsets.all(10),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () {
                              //Navigator.pop(context);
                              setState(() async {
                                if(_appPassword.text.isEmpty||_comfirmAPassword.text.isEmpty){
                                  SharedPreferences prefs = await SharedPreferences.getInstance();
                                  // Constants.changeloginpass = _Password.text;
                                  // Constants.confirmchangeloginpass = _newPassword.text;
                                  // Constants.apppass = _appPassword.text;
                                  // Constants.confirmapppass = _comfirmAPassword.text;
                                  // await prefs.setBool('isLoggedIn', true);
                                  await prefs.setString("apppass", "1");
                                  await prefs.setString("confirmapppass", _comfirmAPassword.text);                                    Navigator.of(context).pop();
                                  Navigator.of(context).pop();


                                }
                                else
                                  {
                                    SharedPreferences prefs = await SharedPreferences.getInstance();
                                    await prefs.setString("apppass", _appPassword.text);
                                    await prefs.setString("confirmapppass", _comfirmAPassword.text);
                                    Navigator.of(context).pop();
                                  }
                                  // if (_appPassword.text.isEmpty){
                                  //   et= "1";
                                  //   SharedPreferences prefs = await SharedPreferences.getInstance();
                                  //   Constants.apppass = et.toString();
                                  //
                                  //   await prefs.setString("apppass", Constants.apppass);
                                  //   Navigator.of(context).pop();
                                  //
                                  // }
                                  // else{
                                    // Constants.changeloginpass = _Password.text;
                                    // Constants.confirmchangeloginpass = _newPassword.text;
                                    // Constants.apppass = _appPassword.text;
                                    // Constants.confirmapppass = _comfirmAPassword.text;
                                    // await prefs.setBool('isLoggedIn', true);



                                // SharedPreferences pref = await SharedPreferences.getInstance();
                                // var mobilenumber = pref.getString("mobileNumber")??"";
                                // var benefId = widget.benefid;
                                // var isdel = await deletedBeneficiary(mobilenumber,benefId);
                              });
                            },
                            child: const Text(
                              "Submit",
                              style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                            style: ElevatedButton.styleFrom(
                              //fixedSize: Size(width, MediaQuery.of(context).size.height * 0.05),
                              backgroundColor: kWhite,
                             // shadowColor: const Color(0xFFFFAE00),
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
              ),



            ],
          ),
        ),
      ),

    );
  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    sharePassword = prefs.getString("apppass")??"";
    if(sharePassword.toString()=="1")
      {
        _appPassword.clear();
        _comfirmAPassword.clear();
      }
    else
      {
        _appPassword.text= sharePassword;
        _comfirmAPassword.text=sharePassword;

      }


  }

  Future<void> changepass() async {

    if(_newPassword.text==_Password.text){
      Map<String, String> jsonbody = {
        "userid": Constants.userid,
        "admin_type": Constants.type,
        //"cpass": _Password.text.toString(),

        "npass": _newPassword.text.toString(),

      };


      // "user_id:": user.toString(),

      //  "district": _DistrictController.text.toString(),



      var network = NewVendorApiService();
      String urls =
          "https://geniemoneyy.com/genie_money/public/index.php/passchange";
      var res = await network.postresponse(urls, jsonbody);
      print(res);
      var model = ChangePasswordModel.fromJson(res);
      String stat = model.status.toString();
      String? msg = model.messages?.error.toString();

      if(stat.toString().contains("201"))
      {
        Fluttertoast.showToast(
            msg: "Update Password successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

      }
      else {
        Fluttertoast.showToast(
            msg: msg.toString(),
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
      }
    }

    else{
      Fluttertoast.showToast(
          msg: "Password do not match",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

  }
}
