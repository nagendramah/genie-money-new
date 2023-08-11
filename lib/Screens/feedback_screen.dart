import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:intl/intl.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:url_launcher/url_launcher.dart';
import 'dart:core';
import '../Model/IconModel.dart';
import '../Model/feedBackResponseModel.dart';
import '../data/remote/network/NetworkApiServiceNewVendor.dart';
import '../utils/constants.dart';
// ignore: depend_on_referenced_packages
//import 'package:mailto/mailto.dart';
class FeedbackScreen extends StatefulWidget {
  FeedbackScreen({Key? key}) : super(key: key);

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController feedbackController = TextEditingController();

  TextEditingController dateController = TextEditingController();

  TextEditingController descriptionController = TextEditingController();

  TextEditingController titleController = TextEditingController();
  late String user;
 IconModel? iconIndex;
  @override
  void initState() {
    getuserid();

    super.initState();

  }

  /*
  late List<IconModel> Iconss;
*/
  var dateTime = DateFormat('yyyy-MM-dd kk:mm:ss').format(DateTime.now());

  List<Widget> icons = [
    Image.asset('images/Web.png'),
    Image.asset('images/Email1.png'),
   Image.asset("images/Whatsapp.png"),
    Image.asset('images/Linkedin.png'),
    Image.asset('images/Facebook.png'),
     Image.asset("images/Instagram.png"),
      Image.asset('images/Youtube.png'),
    Image.asset('images/Twitter.png'),  
  ];

   List<IconModel> Iconss = [
  IconModel(
 name: "Mobile", image: "images/Web.png",),
  IconModel(
  name: "email", image: "images/Email1.png",),
  IconModel(
  name: "whatsapp", image: "images/Whatsapp.png", ),
   IconModel(
  name: "linkedin", image: "images/Linkedin.png",),

  IconModel(
  name: "facebook", image: "images/Facebook.png",),
    IconModel(
  name: "instagram", image: "images/Instagram.png", ),
   IconModel(
  name: "youtube", image: "images/Youtube.png", ),

  IconModel(
  name: "twitter", image: "images/Twitter.png",),
  
  ];

  @override
  Widget build(BuildContext context) {
    
    dateController.text = dateTime;
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: kWhite,
      appBar: AppBar(
        backgroundColor: navyBlueColor,
        title: const Text(
          "Help",
          style: TextStyle(color: kWhite),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kWhite,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
                onPressed: () {
            //     Fluttertoast.showToast(msg: "sss");
           //      shareapp();
              //   Share.share('http://165.22.219.135/genie_money/apk/geniemoney.apk');
                 Share.share('Download the GenieMoney From Below Link ttps://tinyurl.com/4vhf5udx');



                }, icon: Image.asset("images/share.png",width: 20,height: 20,color: kWhite,)),
          )
        ],
      ),
      body: Column(
        children: [
/*          Expanded(
            flex: 1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Center(
                    child: Text(
                      'Customer Feedback',
                      textScaleFactor: 2,
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )),
              ],
            ),
          )*/
          Expanded(
            flex: 4,
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                width: 400,
                // height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: kWhite),
                child: Column(
                  children: [
                    // For Showing Current Date and time
                    Container(
                      margin:EdgeInsets.only(top: 20),
                      child: TextField(

                        style: const TextStyle(color: greyColor),
                        controller: dateController,
                        readOnly: true,
                        decoration: InputDecoration(
                            labelText: "Date & Time",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(color: navyBlueColor)),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    // For Title
                    Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: TextField(
                        style: const TextStyle(color:greyColor),
                        controller: titleController,
                        decoration: InputDecoration(
                            hintStyle: const TextStyle(color: navyBlueColor),
                            hintText: 'Title',
                            // labelText: "Title",
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                              const BorderSide(color: greyColor),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelStyle: const TextStyle(color: navyBlueColor)),
                        keyboardType: TextInputType.text,
                      ),
                    ),

                    const SizedBox(height: 20),
                    // For Message Description
                    TextField(
                      maxLines: 7,
                      cursorColor: greyColor,
                      style: const TextStyle(color: greyColor),
                      controller: descriptionController,
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color:greyColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        disabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color:greyColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        border: OutlineInputBorder(
                          borderSide:
                          const BorderSide(color: greyColor),
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        labelStyle: const TextStyle(color:navyBlueColor),
                        hintText: 'Description',
                        hintStyle: const TextStyle(color: navyBlueColor),
                        isDense: true,
                      ),
                    ),
                    const SizedBox(height: 15),
                    //Material Button for submission
                    MaterialButton(
                      minWidth: width * 0.622,
                      shape: const RoundedRectangleBorder(
                          borderRadius:
                          BorderRadius.all(Radius.circular(20.0))),
                      color: navyBlueColor,
                      onPressed: () {
                       // sendFeedBack();
                     _launchEmail();
                      },
                      child: const Text('Submit',style: TextStyle(color: kWhite,fontSize: 20),),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: kWhite),
                            height: 150,
                            width: 400,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 140,
                                  child: Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: GridView.builder(
                                      gridDelegate:
                                      const SliverGridDelegateWithFixedCrossAxisCount(
                                        
                                        mainAxisSpacing: 0,
                                        crossAxisSpacing: 1,
                                        crossAxisCount: 4,
                                      ),
                                      
                                      // shrinkWrap: true,
                                      itemCount: Iconss.length,
                                      itemBuilder: (context, index) {
                                        var iconIndex = Iconss[index];
                                        return SingleChildScrollView(
                                          child: Container(
                                            height: 200,
                                            width: 200,
                                            // color: Colors.grey,
                                            padding: const EdgeInsets.only(top: 0),
                                            decoration: const BoxDecoration(
                                              // color: Colors.transparent,
                                                shape: BoxShape.circle),
                                            child: Column(
                                              children: [
                                                IconButton(
                                                    onPressed: () {
                                                      //iconIndex.name=="Mobile"?_launchURL(): print("clicke"+icons[0].toString());
                                                     // iconIndex.name=="Email"?_launch1URL(): print("clicke"+icons[0].toString());
                                                      
// if (iconIndex != null) {
//           if (iconIndex.name.toLowerCase() == "mobile") {
//             _launchURL();
//           } else if (iconIndex.name.toLowerCase() == "email") {
//             _launch1URL();
//           }
// }
_handleIconClick(iconIndex);
                                                      
                                                    },

                                                    icon: Image.asset(iconIndex != null ? iconIndex.image : ""),
                                                   // icon: Image.asset(iconIndex.image)),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ),
/*
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    IconButton(
                                        onPressed: () {},
                                        icon: Image.asset('images/callcenter.png')),
                                    const Text(
                                      '1800 120 999 333',
                                      textScaleFactor: 2,
                                      style: TextStyle(color: Color(0xFFFFAE00)),
                                    )
                                  ],
                                ),
*/
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),

                  ],
                ),
              ),
            ),
          ),
          // For ListViewBuilder Items
        ],
      ),
    );
  }

  _launchURL() async{
    const url = 'http://geniemoney.in/';
    if (await canLaunch(url)) {
    await launch(url);
    } else {
    throw 'Could not launch $url';
    }
  }
_launch1URL() async {
  final Uri params = Uri(
    scheme: 'mailto',
    path: 'contact@geniemoney.in',
  );
  final emailLaunchUri = params.toString();

  if (await canLaunch(emailLaunchUri)) {
    await launch(emailLaunchUri);
  } else {
    throw 'Could not launch $emailLaunchUri';
  }
}
_launch2URL() async {
  const url = 'https://wa.me/message/HG2YLVDFYO7YO1'; // This is a WhatsApp URL
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

_launch3URL() async {
  const url = 'https://www.linkedin.com/company/geniemoneyy/'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launch4URL() async {
  const url = 'https://www.facebook.com/geniemoneyy/'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launch5URL() async {
  const url = 'https://www.instagram.com/genie_moneyy/'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launch6URL() async {
  const url = 'https://www.youtube.com/@geniemoneyy'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
_launch7URL() async {
  const url = 'https://twitter.com/GenieMoneyy'; 
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}



  Future<void> sendFeedBack() async {

    if(titleController.text.isEmpty){
      Fluttertoast.showToast(
          msg: "Please Enter Title",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }

    else if(descriptionController.text.isEmpty){

      Fluttertoast.showToast(
          msg: "Please Enter Description",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    else{
      Map<String, String> jsonbody = {
        "userid":Constants.userid,
        "phone":Constants.phone,

        "admin_type":Constants.admin_type,
        "email":Constants.email,
        // "user_id:": user.toString(),
        "title": titleController.text.toString(),

        "description": descriptionController.text.toString(),

      };
      var network = NewVendorApiService();

      String urls =
          "https://geniemoneyy.com/genie_money/public/index.php/feedbacksave";
      var res = await network.postresponse(urls, jsonbody);
      var model = FeedBackResponseModel.fromJson(res);
      String stat = model.status.toString();

      if (model.status == 201) {
        Fluttertoast.showToast(
            msg: "FeedBack Added Succesfully  ",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
        titleController.clear();
        descriptionController.clear();

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
     print("" + res!.toString());
     print("vvvvvvvvvvvvv" + Constants.userid.toString());

    }

  }
  Future<void> getuserid() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    setState((){
      user = sharedPreferences.getString('id')??"";
      print("lalalalala"+user.toString());
    });

  }

 /* Future<void> shareapp() async {
    await FlutterShare.share(
        title: 'Genie Moneyy',
        text: 'Download the GenieMoney From Below Link',
        linkUrl: 'https://tinyurl.com/4vhf5udx',
        chooserTitle: 'Download the GenieMoney From Below Link'
    );
  }*/




void _launchEmail() async {
  String title = titleController.text.trim();
  String description = descriptionController.text.trim();

  final String emailUri = 'mailto:contact@geniemoney.in?subject=${Uri.encodeComponent(title)}&body=${Uri.encodeComponent(description)}';

  if (await canLaunch(emailUri)) {
    await launch(emailUri);
  } else {
    throw 'Could not launch email';
  }
}







void _handleIconClick(IconModel clickedIcon) {
  if (clickedIcon != null) {
    if (clickedIcon.name.toLowerCase() == "mobile") {
      _launchURL();
    } else if (clickedIcon.name.toLowerCase() == "email") {
      _launch1URL();
    }else if (clickedIcon.name.toLowerCase() == "whatsapp") {
      _launch2URL();
    }
    else if (clickedIcon.name.toLowerCase() == "linkedin") {
      _launch3URL();
    }
    else if (clickedIcon.name.toLowerCase() == "facebook") {
      _launch4URL();
    }
     else if (clickedIcon.name.toLowerCase() == "instagram") {
      _launch5URL();
    }
     else if (clickedIcon.name.toLowerCase() == "youtube") {
      _launch6URL();
    }
     else if (clickedIcon.name.toLowerCase() == "twitter") {
      _launch7URL();
    }
  }
}


}