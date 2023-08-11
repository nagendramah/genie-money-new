import 'package:flutter/material.dart';

class Onboarding5 extends StatefulWidget {
  const Onboarding5({Key? key}) : super(key: key);

  @override
  State<Onboarding5> createState() => _Onboarding5State();
}

class _Onboarding5State extends State<Onboarding5> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
     backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
            children: [
        SizedBox(
          height: 100,
        ),
        Center(
          child: Image(
            image: AssetImage("images/Logo.png"),
           // height: 200,
            width: 250,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Image(
            image: AssetImage("images/WhatsApp Image 2023-07-17 at 6.12.11 PM.jpeg"),
          //  height: 500,
            width: 600,
          ),
        ),
          SizedBox(
          height: 120,
        ),
 Center(
         child: Text(
            "Asia's first hybrid Neo Bank",
            style: TextStyle(
              color: Color.fromARGB(255, 26, 84, 161),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
        ),
      ),
    );
  }
}