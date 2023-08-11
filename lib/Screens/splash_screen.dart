import 'dart:async';

import 'package:flutter/material.dart';
import 'package:genie_money/Screens/Onboarding1.dart';
import 'package:genie_money/Screens/enter_password_screen.dart';
import 'package:genie_money/Screens/onboard_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late String pass;


  void _nextScreen(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => OnBoardScreen("splash", ""))));

  }
    void _next1Screen(BuildContext context)  {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) =>  Onboarding1())));
  }
  void _nextScreens(BuildContext context) {
    Timer(
        Duration(seconds: 5),
            () =>
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (BuildContext context) => EnterPasswordScreen())));
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Splash Screen 1.png"),
            fit: BoxFit.cover
        ) ,
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    getpass();


  }

  Future<void> getpass() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    pass = prefs.getString("apppass")??"";
    print(pass.toString());

    if(pass.toString()=="1")
      {
        _nextScreen(context);

      }
    else if(pass.isEmpty)
      {
        _next1Screen(context);

      }
    else{
      _nextScreens(context);


    }
  }



}

