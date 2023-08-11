import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/splash_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';
import 'onboard_screen.dart';


class EnterPasswordScreen extends StatefulWidget {
  const EnterPasswordScreen({Key? key}) : super(key: key);

  @override
  State<EnterPasswordScreen> createState() => _EnterPasswordScreenState();
}

class _EnterPasswordScreenState extends State<EnterPasswordScreen> {
  TextEditingController _enterPassword = TextEditingController();
  bool _passwordVisible=true;
  var appPassword;
  var p="1";


  @override
  void initState() {
     _passwordVisible = false;
   //  appPassword = Constants.apppass;
     getpass();



  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 150),
                child: Center(
                  child: Image(
                    image: AssetImage("images/genielogo.png"),
                    height: 100,
                    width: 100,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),

                child: Text("Genie Moneyy",style: TextStyle(
                  fontSize: 35,color: Color(0xFFFFAE00),fontWeight:FontWeight.bold
                ),),
              ),

              Container(
                margin: EdgeInsets.only(top: 50,left: 10,right: 10),
                child: TextField(
                   // keyboardType: TextInputType.visiblePassword,

                    obscureText: _passwordVisible,

                    controller: _enterPassword,
                    //controller: _email_mobile_controller,
                    style: const TextStyle(color: Color(0xFFFFAE00)),
                    cursorColor: const Color(0xFFFFAE00),
                     keyboardType: TextInputType.visiblePassword,
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
                      labelText: 'Confirm Password',
                        suffixIcon: IconButton(onPressed: () {
                          setState(() {
                            _passwordVisible = !_passwordVisible;
                           // _passwordVisible = !_passwordVisible;
                          });
                        }, icon:  Icon(
                          // Based on passwordVisible state choose the icon
                          _passwordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Color(0xFFFFAE00),
                        ),),
                      isDense: true,

                    )),
              ),

              Container(
                margin:EdgeInsets.only(top: 30),
                height: 40,
                child: Center(
                  child: ElevatedButton(
                    onPressed: () {
                      //Navigator.pop(context);
                      setState(() {
                        if(_enterPassword.text==appPassword.toString())
                          {
                           // Navigator.of(context).pop();

                             Navigator.push(context, MaterialPageRoute(builder: (context) => OnBoardScreen("","")));

                          }
                        else if(_enterPassword.text.isEmpty){
                          Fluttertoast.showToast(
                              msg: "Enter Your App Password",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1);
                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Password Do Not Match",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1);
                        }
                      });
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
      ),
    );
  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    appPassword = prefs.getString("apppass")??"";
  }
}
