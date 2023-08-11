import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:genie_money/Screens/profile_settings_screen.dart';
import 'package:genie_money/Screens/signin_screen.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/silver_delegate.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';


import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';

import 'change_password_screen.dart';
import 'feedback_screen.dart';

class SettingsScreen extends StatefulWidget {

  String title;

  SettingsScreen(this.title, {Key? key}) : super(key: key);

  @override
  State createState() {
    return _SettingsScreen();
  }
}

class _SettingsScreen extends State<SettingsScreen> {
  bool isToggle = true;
  bool showPermanentAddress = false;


  late List<HomePageList> homepageList;
  late String version = "";
  late String referalcode = "";
  late List<String> languages = [
    "English",
    "मराठी",
    "हिन्दी",
    "ગુજરાતી",
    "ਪੰਜਾਬੀ",
    "ಕನ್ನಡ",
    "తెలుగు",
    "தமிழ்",
    "മലയാളം",
    "বাংলা",
    "ଓଡିଆ",
  ];

  @override
  void initState() {

getreferal();

// TODO: implement initState
    if (widget.title == "Customer") {
      homepageList = [
        HomePageList(
            id: "6",
            name: "Profile",
            image: "images/Profile.png", type: ''),
        HomePageList(
            id: "7",
            name: "Change Password",
            image: "images/Change Password.png", type: ''),
HomePageList(
            id: "11", name: "Help", image: 'images/Help.png', type: ''),

        // HomePageList(
        //     id: "8",
        //     name: "Payment Setting",
        //     image: "images/payment_setting.png", type: ''),
        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png", type: ''),
        // HomePageList(
        //     id: "11", name: "Help", image: 'images/feedback.png', type: ''),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png", type: '')
      ];
    } else if (widget.title == "Employee")
    {
      homepageList = [
 HomePageList(
            id: "6",
            name: "Profile",
            image: "images/Profile.png", type: ''),

        HomePageList(
            id: "7",
            name: "Change Password",
            image: "images/Change Password.png", type: ''),
        HomePageList(id: "8", name: "Help", image: "images/Help.png", type: ''),
        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png", type: ''),
        HomePageList(
            id: "11", name: "Help", image: 'images/feedback.png', type: ''),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png", type: ''),

      ];
    } else {
      homepageList = [
   /*     HomePageList(
            id: "7",
            name: "My Topup History",
            image: "images/topup_history.png"),*/

 HomePageList(
            id: "6",
            name: "Profile",
            image: "images/Profile.png", type: ''),

        HomePageList(
            id: "7",
            name: "Change Password",
            image: "images/Change Password.png", type: ''),
      //  HomePageList(id: "8", name: "Help", image: "images/help.png", type: ''),
      HomePageList(id: "8", name: "Help", image: "images/Help.png", type: ''),

//  HomePageList(
//             id: "11", name: "Help", image: 'images/feedback.png', type: ''),

        HomePageList(
            id: "9",
            name: "Change Language",
            image: "images/change_language.png", type: ''),
//HomePageList(id: "8", name: "Help", image: "images/help.png", type: ''),

        // HomePageList(
        //     id: "11", name: "Feedback", image: 'images/feedback.png', type: ''),
        HomePageList(id: "10", name: "Logout", image: "images/logout.png", type: ''),

      ];
    }
    super.initState();
  }


  Future<void> _getVersion() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    setState(() {
      version = packageInfo.version;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    _getVersion();

    return Scaffold(
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Settings",
          style: TextStyle(
            color: kWhite,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color:kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                 margin: const EdgeInsets.only(top: 15.0,left: 25,right: 25),
                child: GridView.builder(
                  gridDelegate:
                      SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
                    crossAxisCount: 2,
                    crossAxisSpacing: 25,
                    mainAxisSpacing: 25,
                    height: height * 0.22,
                  ),
                  itemCount: homepageList.length,
                  itemBuilder: (BuildContext ctx, index) {
                    return GestureDetector(
                      onTap: ()  {
                        if(homepageList[index].name == "Logout") {
                          _alertDialog("Logout", "Are you sure you want to logout?");
                        } else if (homepageList[index].name == "Profile") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => const ProfileSettingsScreen()));
                        } else if (homepageList[index].name == "Change Language") {
                         // showSelectDialog(context, width, height);
                          _alertDialog("", "Getting Activated Soon");

                        }else if (homepageList[index].name == "Help") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  FeedbackScreen()));

                        }
                        else if (homepageList[index].name == "Change Password") {
                          Navigator.push(context, MaterialPageRoute(builder: (context) =>  ChangePassword()));

                        }
                        else if (homepageList[index].name == "Help") {
                            Navigator.push(context, MaterialPageRoute(builder: (context) =>  FeedbackScreen()));
                        //  _launchURL();
                        }
                        else {
                          _alertDialog("", "Getting Activated Soon");
                        }
                      },
                      child: Card(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                            // side: BorderSide(
                            //   color: Color(0xFFFFAE00),
                            //   width: 2.0,
                            // )
                            ),
                        color: navyBlueColor,
                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              Container(
                                margin: const EdgeInsets.only(top: 15.0),
                                child: Image(
                                  image: AssetImage(homepageList[index].image),
                                  color: kWhite,
                                  width: 80.0,
                                  height: 80.0,
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(
                                    top: 10, left: 5.0, right: 5.0,bottom: 5),
                                child: Text(
                                  homepageList[index].name,
                                  style: const TextStyle(
                                    color: kWhite,
                                    fontSize: 20.0,
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
/*
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    const Text(
                      "Enable Default Lock",
                      style: TextStyle(
                          color: Color(0xFFFFAE00), fontSize: 18.0),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
                FlutterSwitch(
                  activeColor: const Color(0xFFFFAE00),
                  width: width * 0.15,
                  height: height * 0.05,
                  toggleSize: 25.0,
                  value: isToggle,
                  borderRadius: 15.0,
                  onToggle: (val) {
                    setState(() {
                      isToggle = val;
                      if (isToggle) {
                        showPermanentAddress = false;
                      } else {
                        showPermanentAddress = true;
                      }
                    });
                  },
                ),
              ],
            ),
*/
            Center(

              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(

                    margin: const EdgeInsets.all(10.0),
                    child: Text(

                      "Your Referal Code: " + referalcode,
                      style: const TextStyle(
                          color:navyBlueColor,
                          fontSize: 20.0
                      ),
                    ),
                  ),
                  Container(
                    child: IconButton(icon: Image.asset("images/clipboard.png",color: navyBlueColor,), onPressed: () {
                      Clipboard.setData(ClipboardData(text: referalcode));
                      Fluttertoast.showToast(msg: "Copied to clipboard");
                    },),
                  )
                ],
              ),
            ),



            Center(
              child: Container(
                margin: const EdgeInsets.all(10.0),
                child: Text(
                  "Version: " + version,
                  style: const TextStyle(
                    color:navyBlueColor,
                    fontSize: 20.0
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget setupAlertDialoadContainer(double width, double height) {
    return Container(
      color: kWhite,
      height: width * 0.70, // Change as per your requirement
      width: height * 0.70, // Change as per your requirement
      child: ListView.builder(
        shrinkWrap: false,
        itemCount: languages.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: (){
              Navigator.of(context).pop();
            },
            title: Text(languages[index], style: const TextStyle(
              color: greyColor
            ),),
          );
        },
      ),
    );
  }

  Future showSelectDialog(BuildContext context, double width, double height) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: kWhite,
            title: const Text("Select Language", style: TextStyle(color: navyBlueColor),),
            content: setupAlertDialoadContainer(width, height),
          );
        }
    );
  }

/*
  Future _alertDialog(String title, String message) {
    return showAnimatedDialog(

      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return ClassicGeneralDialogWidget(
          titleText: title,
          contentText: message,
          onPositiveClick: () async {
            if (title == "Logout") {
              SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
              sharedPreferences.clear();
              Navigator.pushAndRemoveUntil<dynamic>(
                context,
                MaterialPageRoute<dynamic>(
                  builder: (BuildContext context) => SignInScreen("0"),
                ),
                    (route) => false,
              );
            } else {
              Navigator.of(context).pop();
            }
          },
        );
      },
      animationType: DialogTransitionType.size,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(seconds: 1),
    );
  }
*/

  void _alertDialog(String title, String message) {
    showDialog(context: context, builder: (context){

      return AlertDialog(

        backgroundColor: kWhite,

        content: Container(
          height: 110,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 5),
                child: Text(

                  message,
                  style: TextStyle(color: navyBlueColor, fontSize: 18),
                ),
              ),
              Container(

                margin: const EdgeInsets.only(top: 20,bottom: 0),
                height: 40,
                width: 100,
                child: ElevatedButton(
                  child: const Text(
                    "Ok",
                    style: TextStyle(
                        color:
                           kWhite,
                        fontSize: 15.0,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize:
                    Size(30, 80.0), backgroundColor: navyBlueColor,
                   // shadowColor:
                   // const Color(0xFFFFAE00),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                  ),
                  onPressed: () async {

                    if (title == "Logout") {
                      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

                      sharedPreferences.clear();
                      Navigator.pushAndRemoveUntil<dynamic>(
                        context,
                        MaterialPageRoute<dynamic>(
                          builder: (BuildContext context) => SignInScreen("0"),
                        ),
                            (route) => false,
                      );
                    } else {
                      Navigator.of(context).pop();
                    }
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


  Future<void> getreferal() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      referalcode = sharedPreferences.getString('refer')??"";
      print("lalalalala"+referalcode.toString());
    });

  }

  _launchURL() async{
    const url = 'http://geniemoney.in/';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
