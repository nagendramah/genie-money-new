import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// ignore: unused_import
import 'package:genie_money/Screens/splash_screen.dart';


class FingerprintAuth extends StatefulWidget {
  const FingerprintAuth({Key? key}) : super(key: key);

  @override
  _FingerprintAuthState createState() => _FingerprintAuthState();
}

class _FingerprintAuthState extends State<FingerprintAuth> {
  
  // ignore: unused_field
  _SupportState _supportState = _SupportState.unknown;
  
  
 

  @override
  void initState() {
  
    super.initState();
   
  }
  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }




      
  
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
    );
  }


 


enum _SupportState {
  unknown,
  supported,
  unsupported,
}
