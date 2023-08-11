import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:genie_money/Model/home_menu_list_model.dart';
import 'package:url_launcher/url_launcher.dart'as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class EssentialDetailsScreen extends StatefulWidget {
  final String companyName;
  final String companyAddress;
  final String companyAddress2;
  final String companyEmail;
  final String companyPhone;
  final String pincode;
  final String taluka;
  final String district;
  final String state;
  final String remark;
  final String title;
  final String ad1;
  final String ad2;
  final String ad3;
  final String ad4;
  //double rating;

  /* EssentialDetailsScreen(categoryName, String string, String companyAddress2, String companyEmail, String companyPhone, String ad1, String ad2, String ad3, String ad4
      );*/

 // EssentialDetailsScreen({Key? key, required this.tittle, required this.categoryName, required this.companyAddress, required this.companyAddress2, required this.companyEmail, required this.companyPhone, required this.ad1, required this.ad2, required this.ad3, required this.ad4}) : super(key: key);


 EssentialDetailsScreen( {Key? key,required this.companyName, required this.companyAddress, required this.companyAddress2, required this.companyEmail, required this.companyPhone, required this.ad1, required this.ad2, required this.ad3, required this.ad4, required this.title, required this.pincode, required this.taluka, required this.district, required this.state, required this.remark}) : super(key: key);

  @override
  _EssentialDetailsScreenState createState() => _EssentialDetailsScreenState();
}

class _EssentialDetailsScreenState extends State<EssentialDetailsScreen> {
  int _currentPosition = 0;

  late List<HomePageList> homepageList;

  late List<String> imgList = [];
  late List<String> imgList2 = [];

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  void initState() {

    imgList = [widget.ad1,widget.ad2,widget.ad3,widget.ad4];
    print("kkk"+widget.ad4.toString());
    /*if (widget.title == "Atharva Enterprises" ||
        widget.title == "Pawan Enterprises") {
      imgList = ["images/ac_banner_1.jpg"];
    } else if (widget.title == "Dmart") {
      imgList = [
        "images/dmart_banner.jpg",
        "images/dmart_banner_2.jpeg",
        "images/dmart_banner_3.jpg",
      ];
    } else if (widget.title == "Big Bazzar") {
      imgList = ["images/bigbazzar_logo.png"];
    } else if (widget.title == "Metro Mall") {
      imgList = [
        "images/metro_banner_1.jpg",
        "images/metro_banner_2.jpg",
        "images/metro_banner_3.jpg",
      ];
    } else if (widget.title == "Harbans Karyana Store") {
      imgList = ["images/hasbans_banner.png"];
    }*/
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: Text(
            widget.companyName,
            style:  TextStyle(
              color: Color(0xFFFFAE00),
            ),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                height: height * 0.75,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      CarouselSlider(
                        options: CarouselOptions(
                          height: height * 0.25,
                          viewportFraction: 0.85,
                          enlargeCenterPage: true,
                          enableInfiniteScroll: true,
                          autoPlayAnimationDuration: const Duration(seconds: 3),
                          autoPlay: true,
                          onPageChanged: (index, reason) {
                            _currentPosition = index;
                            print("ssss"+index.toString());
                            print("fffff"+_currentPosition.toString());

                            /* setState(() {
                            });*/
                          },
                        ),
                        items: imgList
                            .map(
                              (e) => ClipRRect(
                            borderRadius: BorderRadius.circular(8.0),
                            child: Stack(
                              fit: StackFit.expand,
                              children: <Widget>[
                                Image.network(e, width: width,
                                height: height,
                                 fit: BoxFit.fill,)

                                // Image(
                                //   image: NetworkImage(
                                //  /*   imgList[_currentPosition],*/
                                //     e.[_currentPosition]
                                //
                                //   ),
                                //   width: width,
                                //   height: height,
                                //   fit: BoxFit.fill,
                                // )


                              ],
                            ),
                          ),
                        )
                            .toList(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
              /*        Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: map<Widget>(
                          imgList,
                              (index, url) {
                            return Container(
                              width: 5.0,
                              height: 5.0,
                              margin: const EdgeInsets.symmetric(
                                  vertical: 10.0, horizontal: 2.0),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: _currentPosition == index
                                    ? const Color(0xFFFFAE00)
                                    : Colors.grey,
                              ),
                            );
                          },
                        ),
                      ),*/
                   /*   Row(

                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.network(
                          widget.ad2.toString(),
                            width: 250.0,
                            height: 200.0,
                            fit: BoxFit.cover,
                          ),



                        ],
                      ),*/
                   /*   Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "Name:",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child: const Text(
                                "Harvinder Singh",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),*/
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              child: const Text(
                                "Name:",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.companyName,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),

                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [

                            SizedBox(
                              child: const Text(
                                "Mobile No.:",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                  widget.companyPhone,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "Rating:",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00), fontSize: 18.0),
                              ),
                            ),
                           /* SizedBox(
                              width: width * 0.50,
                              child: RatingBarIndicator(
                                rating: widget.rating,
                                unratedColor: const Color(0xFF3A3A3A),
                                itemBuilder: (context, index) => const Icon(
                                  Icons.star,
                                  color: Color(0xFFFFAE00),
                                ),
                                itemCount: 5,
                                itemSize: 20.0,
                                direction: Axis.horizontal,
                              ),
                            ),*/
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "Address:",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.companyAddress,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "Taluka",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.taluka,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "District",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.district,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "State",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.state,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "Pincode",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.pincode,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),  Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.44,
                              child: const Text(
                                "remark",
                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.50,
                              child:  Text(
                                widget.remark,

                                style: TextStyle(
                                  color: Color(0xFFFFAE00),
                                  fontSize: 18.0,
                                ),
                                textAlign: TextAlign.left,
                              ),
                            )
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.45, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      //launch(widget.companyPhone.toString());
                   //   UrlLauncher.launch('9004113634');
                      launchPhoneDialer(widget.companyPhone.toString());
                    },
                    child: const Text(
                      "Call",
                      style: TextStyle(color: Color(0xFF111111)),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(width * 0.45, 25.0),
                      primary: const Color(0xFFFFAE00),
                      shadowColor: const Color(0xFFFFAE00),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      launchMsg(widget.companyPhone.toString());
                    },
                    child: const Text(
                      "Send Message",
                      style: TextStyle(color: Color(0xFF111111),),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _callNumber() {

  }

  Future<void> launchPhoneDialer(String contactNumber) async {
    final Uri _phoneUri = Uri(
        scheme: "tel",
        path: contactNumber
    );
    try {
      if (await canLaunch(_phoneUri.toString()))
        await launch(_phoneUri.toString());
    } catch (error) {
      throw("Cannot dial");
    }
  }

  void launchMsg(String string) async{

    final Uri _phoneUri = Uri(
        scheme: "sms",
        path: string
    );
    try {
      if (await canLaunch(_phoneUri.toString()))
    await launch(_phoneUri.toString());
    } catch (error) {
    throw("Cannot dial");
    }

  }

}