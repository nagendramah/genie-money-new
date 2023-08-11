import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:genie_money/Screens/cashback_screen.dart';
import 'package:genie_money/Screens/offer_screen.dart';
import 'package:genie_money/Screens/photo_proof_upload_screen.dart';
import 'package:genie_money/Screens/refer_and_earn_screen.dart';
import 'package:genie_money/Screens/settings_screen.dart';
import 'package:genie_money/Screens/wallet_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/constants.dart';

import 'essentials_screen.dart';
import 'optionsfile.dart';
import 'package:image_picker/image_picker.dart';
class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  _MenuScreen createState() {
    // TODO: implement createState
    return _MenuScreen();
  }
}

class _MenuScreen extends State<MenuScreen> {
 File _image = File('');
  final picker = ImagePicker();
Future getImageFromGallery() async {
    final pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  Future getImageFromCamera() async {
    final pickedFile = await picker.getImage(source: ImageSource.camera);

    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    print(""+height.toString());

    return Scaffold(
      backgroundColor: kWhite,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(right: width * 0.34),
              height: height<600?height * 0.2200:height * 0.1960,
              width: width,
              child: DrawerHeader(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Center(
                        child: GestureDetector(
                   onTap: () {
                     showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      backgroundColor: kWhite,
                            shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
          // side: const BorderSide(
          //   color: Colors.orange, // Set the border color here
          //   width: 2.0, // Set the border width here
          // ),
        ),
                      title: const Text('GenieMoneyy',style: TextStyle(color: navyBlueColor,),),
                      content: const Text('Change your profile image.',style: TextStyle(color:  navyBlueColor,),),
                      actions: [
                        ElevatedButton(
                                                  style: ElevatedButton.styleFrom(
                          backgroundColor: navyBlueColor, // Set the desired background color
                               ),
                          child: const Text('Camera'),
                          onPressed: () {
                            getImageFromCamera();
                            Navigator.of(context).pop();
                          },
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
    backgroundColor: navyBlueColor, // Set the desired background color
  ),
                          child: const Text('Gallery'),
                          onPressed: () {
                            getImageFromGallery();
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                );
                   
                     },
                        child: CircleAvatar (
                          radius: height * 0.04,
                backgroundColor: greyColor,
                backgroundImage: _image != null ? FileImage(_image) as ImageProvider : const AssetImage('path_to_default_profile_image'),

                child: _image == null
                    ? Icon(
                        CupertinoIcons.profile_circled,
                        color: const Color(0xFFFFAE00),
                        size: height * 0.08,
                      )
                    : null,
                        ),
                        )
                      ),
                      Center(
                        child: Container(
                            margin: EdgeInsets.only(top: height * 0.01),
                            child: Text(
                              Constants.name.isNotEmpty ? Constants.name : "User Name",
                              style: const TextStyle(
                                color: navyBlueColor,
                              ),
                              textAlign: TextAlign.center,
                            ),
                        ),
                      ),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              margin: EdgeInsets.only(top: height * 0.01),
                                child: Text(
                                  Constants.phone.isNotEmpty ? Constants.phone : "Mobile No",
                                  style: const TextStyle(
                                    color: navyBlueColor,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.01),
                              child: const Text(
                                "/",
                                style: TextStyle(
                                  color: navyBlueColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: height * 0.01),
                              child: const Text(
                                "Email-ID",
                                style: TextStyle(
                                  color: navyBlueColor,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 2,
            ),
            Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            if (ZoomDrawer.of(context)!.isOpen()) {
                              ZoomDrawer.of(context)!.toggle();
                            }
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.home,
                                  color: navyBlueColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Home",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Financial Services");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                Image(
                                  image: AssetImage("images/Financial Services.png"),
                                  color: navyBlueColor,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Financial Services",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Essentials");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                Image(
                                  image: AssetImage("images/Merchant Services.png"),
                                  color: navyBlueColor,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Merchant Services",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                     /* Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Travel");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/travel.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Travel",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Personal Security");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/personal_security.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Personal Security",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Device Security");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/device_security.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Device Security",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),*/
                     /* Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/valueaddition.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Value Added Services",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),*/
                      // const Divider(
                      //   thickness: 2,
                      // ),
                    /*  Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Entertainment");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/entertainment.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Entertainment",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),*/

                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const WalletScrreen()));
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                /*Image(
                                  image: AssetImage("images/w"),
                                  width: 24.0,
                                  height: 24.0,
                                ),*/
                                Icon(Icons.account_balance_wallet, color:  navyBlueColor,),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Wallet",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                 /*     const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const CashbackScreen()));
                            // _alertDialog();
                          },
                 *//*         child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: Row(
                              children: const [
                                Image(
                                  image: AssetImage("images/cashback.png"),
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Cashback & Deals",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),*//*
                        ),
                      ),*/
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                    const ReferAndEarnScreen()));

                           // _alertDialog();
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                Image(
                                  image: AssetImage("images/refer.png"),
                                  color: navyBlueColor,
                                  width: 24.0,
                                  height: 24.0,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Refer & Earn",
                                  style: TextStyle(
                                    color:navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Divider(
                        thickness: 2,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: InkWell(
                          onTap: () {
                            _navigate("Settings");
                          },
                          child: Container(
                            margin: const EdgeInsets.only(left: 10.0),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.settings,
                                  color: navyBlueColor,
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "Settings",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }

  void _navigate(String name) {
    if (ZoomDrawer.of(context)!.isOpen()) {
      ZoomDrawer.of(context)!.toggle();
    }
    if (name == "Essentials") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => const EssentialsScreen()));


    }
     else if(name == "Financial Services") {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => AllOptions("Financial\nServices")));


    }
    
     else if (name == "Settings") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsScreen("Customer")));
    }else if (name == "Offer") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => OfferScreen()));
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => AllOptions(name)));
    }
  }

  void _alertDialog() {
    showDialog(context: context, builder: (context){

      return AlertDialog(

        backgroundColor:  const Color(0xFF3A3A3A),

        content: Container(
          height: 100,
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin:  const EdgeInsets.only(top: 12,),

                child: const Text(
                  "Getting Activated Soon",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                ),
              ),
              Container(

                margin: const EdgeInsets.only(top: 20,bottom: 1),
                height: 40,
                width: 100,
                child: ElevatedButton(
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                        color:
                        Color(0xFF111111),
                        fontSize: 15.0,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize:
                    const Size(30, 80.0),


                    primary:
                    const Color(0xFFFFAE00),
                    shadowColor:
                    const Color(0xFFFFAE00),
                    shape:
                    RoundedRectangleBorder(
                     
                     
                     
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                  ),
                  onPressed: () async {

                    Navigator.pop(context);

                  }


                  ,
                ),
              ),



            ],




          ),

        ),
      );

    });
  }

}
