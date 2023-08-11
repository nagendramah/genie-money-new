import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/payment_option_screen.dart';
import 'package:genie_money/Screens/sales_partner_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'install_screen.dart';

class DigitalSecurityDetailScren extends StatefulWidget {
  String name;
  DigitalSecurityDetailScren({required this.name, Key? key}) : super(key: key);

  @override
  State<DigitalSecurityDetailScren> createState() => _DigitalSecurityDetailScrenState();
}

class _DigitalSecurityDetailScrenState extends State<DigitalSecurityDetailScren> {
  late List<String> image_list;
  late String _fileUrl = "";
  late String _fileName = "";
  late String open_path = "";
  final Dio _dio = Dio();

  late int percentage = 0;
  late String display_percent = "";
  bool install_visible = true;
  bool progress_visible = false;
  bool open_visible = false;
  late String app_package_name;
  late String title;
  late String description;
  String type = "";
  TextEditingController _activationCodeController = TextEditingController();

  @override
  void initState() {
    if (widget.name == "Spy Camera" ||
        widget.name == "Life Saver" ||
        widget.name == "Secure Chat" ||
        widget.name == "Anti Hacking" ||
        widget.name == "Anti Virus" ||
        widget.name == "Anti Theft" ||
        widget.name == "Wi-Fi Protect") {
      image_list = [
        "images/info_gs.png",
        "images/securechat_gs.png",
        "images/notification_gs.png",
        "images/antitheft_gs.png",
        "images/lock_gs.png",
      ];
      _fileUrl = "http://143.110.176.111/genieshield/security.apk";
      _fileName = "security.apk";
      app_package_name = "com.gss.genieshield";
      title = "Install the App to Secure you and your device..";
      description =
      "Some features are:- \n Spy Camera, Life Saver, Secure Chat, Scan, Anti Phishing, Secure, Permission, Social Media Checker, Device Status, Password Safe, Pay Safe, Hidden App Detector, Ad Detector, Full Scan, Application Scan, Battery Save, Phone Cooler, Alarm Alert, SMS Alert, Email Alert, Data Access Alert, Restart Alert, Plug-in / Plug-Out, Motion Alert, Pocket Alert, List, Alarm Alert, Device Location, Format Device, Photo Front Camera, Photo Back Camera, Show Message on Screen, Record Video Front Camera, Record Video Back Camera, Lock Device, Get Contact List, Get Call Log, Torch Light On, Torch Light Off, Location History, Call Filter, Privacy Protection & more…";
    } else if (widget.name == "YouTube Video") {
      image_list = [
        "images/youtube_gs_1.png",
        "images/youtube_gs_2.png",
        "images/youtube_gs_3.png",
        "images/youtube_gs_4.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/youtube.apk";
      _fileName = "youtube.apk";
      app_package_name = "com.vanced.android.youtube";
      title = "Youtube Video";
      description =
      "Enjoy the Ad-free youtube videos and also play when offline.";
    } else if (widget.name == "YouTube Music") {
      image_list = [
        "images/youtube_music_gs_1.png",
        "images/youtube_music_gs_2.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/youtubemusic.apk";
      _fileName = "youtubemusic.apk";
      app_package_name = "com.vanced.android.apps.youtube.music";
      title = "Youtube Music";
      description =
      "Enjoy the Ad-free youtube music and also play when offline.";
    } else if (widget.name == "OTT") {
      image_list = [
        "images/ott_gs_1.png",
        "images/ott_gs_2.png",
        "images/ott_gs_3.png",
        "images/ott_gs_4.png"
      ];
      _fileUrl = "";
      _fileName = "";
      app_package_name = "";
      title = "OTT";
      description =
      "Install app, We provides you a new perspective towards entertainment.";
    } else if (widget.name == "YouTube Download" ||
        widget.name == "News Channels" ||
        widget.name == "Other Channels" ||
        widget.name == "Facebook video") {
      image_list = [
        "images/youtube_video_downloader_gs_1.png",
        "images/channel_gs_1.png",
        "images/channel_gs_2.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/entertainment.apk";
      _fileName = "entertainment.apk";
      app_package_name = "com.gss.entertainment";
      title = "Youtube Download / Channels / Facebook video Download";
      description =
      "You can search, download any videos of youtube or facebook videos and save in your devices. Also you can watch your channels and various live news channels.";
    } else if (widget.name == "Jobs") {
      image_list = [
        "images/jobs_gs_1.png",
        "images/jobs_gs_2.png",
        "images/Jobs_gs_3.png",
        "images/jobs_gs_4.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/education.apk";
      _fileName = "education.apk";
      app_package_name = "com.gss.education";
      title = "Jobs";
      description =
      "Install the Jobs App to find and apply for Government, Private Jobs. You can search for any jobs according to your location. You can also create your resume in your favorite templates.";
    } else if (widget.name == "Education") {
      image_list = [
        "images/education_gs_1.png",
        "images/education_gs_2.png",
        "images/education_gs_3.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/education.apk";
      _fileName = "education.apk";
      app_package_name = "com.gss.education";
      title = "Education";
      description =
      "Install app for continuing your studies at home. App contains almost all Boards textbooks and its solutions as well as search nearest jobs and more ...";
    } else if(widget.name == "Health / Fitness"){
      image_list = [
        "images/fitness_gs_1.png",
        "images/fitness_gs_2.png",
        "images/fitness_gs_3.png",
        "images/fitness_gs_4.png",
      ];
      _fileUrl = "http://143.110.176.111/genieshield/health.apk";
      _fileName = "health.apk";
      app_package_name = "com.gss.gssfitness";
      title = "Health/Fitness";
      description =
      "Install Health & Fitness App, We provide you workout, Yoga, Pedometer & Meditation to keep physical fitness, healthy body and also provides dynamic and creative intellectual activity.";
    } else if(widget.name == "Financial Calculator") {
      image_list = [
        "images/fc_gs_!.png",
        "images/fc_gs_2.png",
        "images/fc_gs_3.png",
        "images/fc_gs_4.png",
      ];
      _fileUrl = "http://143.110.176.111/genieshield/calculator.apk";
      _fileName = "calculator.apk";
      app_package_name = "com.gss.financecalculator";
      title = "EMI Calculator";
      description = "Install the EMI Calculator, This is exclusively for Indians with the schemes available in Indian Banks, Post Office, Mutual Funds, Retirement, Income Tax, Insurance, Bonds and much more. Provides the calculator for Home loan, Credit card payoff, Mortgage Loan, Home Lease, Retirements, Saving (Recurring Deposit) etc.";
    } else if(widget.name == "I Have To Fly") {
      image_list = [
        "images/i_have_to_fly_banner.png",
        "images/i_have_to_fly2.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/fly.apk";
      _fileName = "fly.apk";
      app_package_name = "com.heyletscode.ihavetofly";
      title = "I Have To Fly";
      description = "Install the application for I have to Fly free games and enjoy your life.";
    } else if(widget.name == "Space Shooter") {
      image_list = [
        "images/space_shooter_banner.png",
        "images/space_shooter_banner_2.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/space.apk";
      _fileName = "space.apk";
      app_package_name = "com.gss.spaceshooter";
      title = "Space Shooter";
      description = "Install the application for Space Shooter free games and enjoy your life.";
    } else if(widget.name == "Flying Fish") {
      image_list = [
        "images/flying_fish_banner.png",
        "images/flying_fish_banner_2.png",
        "images/flying_fish_banner_3.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/fish.apk";
      _fileName = "fish.apk";
      app_package_name = "com.gss.salinda.flyingfishgame";
      title = "Flying Fish";
      description = "Install the application for Flying Fish free games and enjoy your life.";
    } else if(widget.name == "Plane Shooter") {
      image_list = [
        "images/plane_shooter_banner.png",
        "images/plane_shooter_banner_2.png",
        "images/plane_shooter_banner_3.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/planeshooter.apk";
      _fileName = "planeshooter.apk";
      app_package_name = "com.gss.planeshooter";
      title = "Plane Shooter";
      description = "Install the application for Plane Shooter free games and enjoy your life.";
    } else if(widget.name == "Ludo") {
      image_list = [
        "images/ludo_banner.png"
      ];
      _fileUrl = "http://143.110.176.111/genieshield/ludo.apk";
      _fileName = "ludo.apk";
      app_package_name = "com.gss.myludogame";
      title = "Ludo";
      description = "Install the application for Ludo free games and enjoy your life.";
    }
    getUserType();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    String option = widget.name;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          option,
          style: const TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: height * 0.05, left: 10.0, right: 10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                margin: const EdgeInsets.all(10.0),
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: height * 0.30,
                    viewportFraction: 1.0,
                    enlargeCenterPage: true,
                    enableInfiniteScroll: true,
                    autoPlayAnimationDuration: const Duration(seconds: 1),
                    autoPlay: true,
                    // onPageChanged: (index, reason) {
                    //   setState(() {
                    //     _currentPosition = index;
                    //   });
                    // },
                  ),
                  items: image_list
                      .map(
                        (e) => ClipRRect(
                      child: Column(
                        children: <Widget>[
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              child: Image(
                                image: AssetImage(e),
                                width: width,
                                height: height,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                      .toList(),
                ),
              ),
              Expanded(
                flex: 1,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: Center(
                          child: Text(
                            title,
                            style: const TextStyle(
                                color: Color(0xFFFFAE00),
                                fontSize: 20.0,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Text(
                          type=="Customer"?
                              "To Activate this features, You have to upgrade the PRO version of Genie Moneyy.\n"+
                                  "You can take the Activation code from online OR from your retailer.\n"+
                                      "Please pay Rs 150/- to upgrade the PRO version and access all the features for lifetime."+
                                          "Get your activation on registred mobile number":
                              "To activate this features for Customer. Please give the Activation code.",
                          style: const TextStyle(
                            color: Color(0xFFFFAE00),
                            fontSize: 18.0,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Visibility(
                visible: install_visible,
                child: Container(
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      ElevatedButton(
                        child: Text(
                          type=="Customer"?"Pay Online & Get Activation Code":"Generate Activation Code",
                          style: TextStyle(
                            color: Color(0xFF111111),
                            fontSize: 18.0,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          fixedSize: Size(width, 25.0),
                          primary: const Color(0xFFFFAE00),
                          shadowColor: const Color(0xFFFFAE00),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          if(type=="Customer"){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PaymentOptionScreen()));
                          }else{
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        SalesPartnerScreen("Generate Code")));
                          }
                          /*if (option == "OTT") {
                            _alertDialog();
                          } else {
                            _download();
                          }*/
                        },
                      ),
                      Visibility(
                        visible: type=="Customer"?true:false,
                        child: Container(
                          child: Column(
                            children: [
                              TextField(
                                style: const TextStyle(color: Color(0xFFFFAE00)),
                                cursorColor: const Color(0xFFFFAE00),
                                keyboardType: TextInputType.phone,
                                controller: _activationCodeController,
                                decoration: InputDecoration(
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
                                  labelStyle:
                                  const TextStyle(color: Color(0xFFFFAE00)),
                                  // hintText: 'Email / Mobile No.',
                                  labelText: 'Enter Activation Code',
                                  isDense: true,
                                ),
                              ),
                              ElevatedButton(
                                child: Text(
                                  "Submit",
                                  style: TextStyle(
                                    color: Color(0xFF111111),
                                    fontSize: 18.0,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  fixedSize: Size(width, 25.0),
                                  primary: const Color(0xFFFFAE00),
                                  shadowColor: const Color(0xFFFFAE00),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                                onPressed: () {
                                  if(_activationCodeController.text=="1234"){
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                InstallApps(widget.name)));
                                  }else{
                                    Fluttertoast.showToast(
                                        msg: "Invalid Activation Code!",
                                        toastLength: Toast.LENGTH_SHORT,
                                        gravity: ToastGravity.BOTTOM,
                                        timeInSecForIosWeb: 1);
                                  }

                                },
                              ),
                            ],
                          ),
                        ),
                      )
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
  Future getUserType()async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      type = (prefs.get("type") ?? "Customer").toString();
    });
  }
}
