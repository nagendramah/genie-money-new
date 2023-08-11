import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/pincode_model.dart';
import 'package:genie_money/Screens/settings_screen.dart';
import 'package:genie_money/utils/location_finder.dart';
import 'package:genie_money/utils/network.dart';
import 'package:geocoding/geocoding.dart';
import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';

class PortfolioScreen extends StatefulWidget {
  String type;

  PortfolioScreen(this.type, {Key? key}) : super(key: key);

  @override
  _PortfolioScreenState createState() => _PortfolioScreenState();
}

class _PortfolioScreenState extends State<PortfolioScreen>
    with SingleTickerProviderStateMixin {
  final TextEditingController _name_controller = TextEditingController();
  final TextEditingController _mobile_no_controller = TextEditingController();
  final TextEditingController _email_controller = TextEditingController();
  final TextEditingController _address_controller = TextEditingController();
  final TextEditingController _pin_code_controller = TextEditingController();
  final TextEditingController _state_controller = TextEditingController();
  final TextEditingController _city_controller = TextEditingController();
  final TextEditingController _address_1_controller = TextEditingController();
  final TextEditingController _address_2_controller = TextEditingController();
  final TextEditingController _about_us_controller = TextEditingController();
  final TextEditingController _facebook_controller = TextEditingController();
  final TextEditingController _whatsapp_controller = TextEditingController();
  final TextEditingController _youtube_controller = TextEditingController();
  final TextEditingController _twitter_controller = TextEditingController();

  bool useCurrent = false;
  late String _currentAddress = "";
  late String longitude = '00.00000';
  late String latitude = '00.00000';
  late PermissionStatus permission;
  late bool serviceEnabled = false;

  late List<File> pageviewList = [];

  late AnimationController _animationController;
  late Animation<double> _nextPage;
  int _currentPage = 0;
  final PageController _pageController = PageController(initialPage: 0);

  String category = 'General Store';

  List<String> categoryList = [
    "General Store",
    "Vegetable Vendor",
    "AC/ Appliance Repair",
    "Electricians",
    "Plumber",
    "Carpenter",
    "Car / Bike Mechanic",
    "Cleaning",
    "Tutor",
    "Maid",
    "Laundry",
    "Cable Vendor",
    "Saloon, Spa, Massage",
    "Home Painting",
    "Pest Control",
    "Medicine Shop",
    "Emergency",
    "Gas/ Cylinder Vendor",
    "Internet Provider",
    "Restaurants",
    "Gardener"
  ];

  Future<void> GetAddressFromLatLong() async {
    if (_currentAddress.isEmpty) {
      LocationFinder locationFinder = LocationFinder();
      LocationData locationData = await locationFinder.getLocation();
      double longitude = locationData.longitude ?? 0.0000;
      double latitude = locationData.latitude ?? 0.0000;
      List<Placemark> placemarks =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemarks[0];
      setState(() {
        if (_currentAddress.isEmpty) {
          _currentAddress =
              '${place.name}, ${place.street}, ${place.subLocality}, ${place.locality}, ${place.thoroughfare}, ${place.subAdministrativeArea}, ${place.administrativeArea}, ${place.postalCode}, ${place.country}';
        }
      });
      print(_currentAddress);
    }
  }

  late Future<Pincode_model> pincode_model;
  var _adsImage;
  var _ads_1_file;
  var _ads_2_file;
  var _ads_3_file;
  var _ads_4_file;

  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 5));
    _nextPage = Tween(begin: 0.0, end: 1.0).animate(_animationController);

    //Add listener to AnimationController for know when end the count and change to the next page
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        _animationController.reset(); //Reset the controller
        const int page = 4; //Number of pages in your PageView
        if (_currentPage < page) {
          _currentPage++;
          _pageController.animateToPage(_currentPage,
              duration: const Duration(milliseconds: 5000),
              curve: Curves.easeInSine);
        } else {
          _currentPage = 0;
        }
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    GetAddressFromLatLong();
    if (pageviewList.length > 0) {
      _animationController.forward(); //Start controller with widget
      print(_nextPage.value);
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: widget.type == "Employee" ? AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Add Portfolio",
            style: TextStyle(color: Color(0xFFFFAE00)),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => SettingsScreen(widget.type)));
                },
                child: const Icon(
                  Icons.settings,
                  color: Color(0xFFFFAE00),
                ),
              ),
            ),
          ],
        ) : AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          title: const Text(
            "Add Portfolio",
            style: TextStyle(color: Color(0xFFFFAE00)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ads_1_Column(context),
                    ads_2_Column(context),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ads_3_Column(context),
                    ads_4_Column(context),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: DropdownButtonFormField<String>(
                  dropdownColor: const Color(0xFF111111),
                  isExpanded: true,
                  decoration: const InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    labelStyle: TextStyle(color: Color(0xFFFFAE00)),
                    label: Text("Category"),
                    isDense: true,
                  ),
                  value: category,
                  icon: const Icon(
                    Icons.arrow_drop_down,
                    color: Color(0xFFFFAE00),
                  ),
                  iconSize: 24,
                  elevation: 16,
                  style:
                  const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                  onChanged: (String? data) {
                    setState(() {
                      category = data!;
                    });
                  },
                  items: categoryList
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _name_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Name",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.phone,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.number,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _mobile_no_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Mobile No.",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.mail,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _email_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Email",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.location,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        minLines: 1,
                        maxLines: 5,
                        readOnly: true,
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.emailAddress,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _address_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Address",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                        onTap: () {
                          _showDialog(width);
                        },
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.person_alt_circle,
                      color: Color(0xFFFFAE00),
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _about_us_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "About us",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/facebook.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _facebook_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Facebook",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/whatsapp.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _whatsapp_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Whatsapp",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/youtube.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _youtube_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Youtube",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(left: 10.0, right: 10.0, top: 10.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage("images/twitter.png"),
                      width: 20.0,
                      height: 20.0,
                    ),
                    Container(
                      width: width * 0.85,
                      margin: const EdgeInsets.only(left: 10.0),
                      child: TextField(
                        cursorColor: const Color(0xFFFFAE00),
                        keyboardType: TextInputType.name,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        controller: _twitter_controller,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          border: OutlineInputBorder(
                            borderSide: const BorderSide(
                              color: Color(0xFFFFAE00),
                            ),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          isDense: true,
                          label: const Text(
                            "Twitter",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                            ),
                          ),
                          labelStyle: const TextStyle(
                            color: Color(0xFFFFAE00),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin:
                    const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
                child: ElevatedButton(
                  onPressed: () async {},
                  child: const Text(
                    "SUBMIT",
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 16.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(width, 40.0),
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
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

  _showDialog(double width) {
    showDialog<String>(
      context: context,
      builder: (context) =>
          StatefulBuilder(builder: (BuildContext context, setState) {
        return AlertDialog(
          contentPadding: const EdgeInsets.all(5.0),
          content: Container(
            margin: const EdgeInsets.all(5.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        if (useCurrent) {
                          useCurrent = false;
                          // setVisibility(false);
                        } else {
                          useCurrent = true;
                          // setVisibility(true);
                        }
                      });
                    },
                    child: Card(
                      color: const Color(0xFF3A3A3A),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.0),
                        ),
                        side: BorderSide(
                          color: Color(0xFFFFAE00),
                          width: 2.0,
                        ),
                      ),
                      child: Container(
                        margin: const EdgeInsets.all(10.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.my_location,
                              color: Color(0xFFFFAE00),
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Use My Current Location",
                                style: TextStyle(
                                    color: Color(0xFFFFAE00), fontSize: 16.0),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Visibility(
                    visible: useCurrent == true ? true : false,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: Text(
                        _currentAddress,
                        style: const TextStyle(
                          color: Color(0xFFFFAE00),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Visibility(
                    visible: useCurrent == false ? true : false,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 20.0),
                          child: const Text(
                            "OR",
                            style: TextStyle(
                              color: Color(0xFFFFAE00),
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 10.0),
                          child: const Text(
                            "Enter Address",
                            style: TextStyle(
                                color: Color(0xFFFFAE00), fontSize: 18.0),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.number,
                            controller: _pin_code_controller,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'Pin Code',
                              isDense: true,
                            ),
                            onChanged: (text) {
                              if (text.isNotEmpty) {
                                if (text.length == 6) {
                                  NetworkCall networkCall = NetworkCall();
                                  networkCall
                                      .getStateAndCity(
                                          _pin_code_controller.text, context)
                                      .then((value) => {
                                            setState(() {
                                              _state_controller.text = value
                                                      .postOffice
                                                      ?.elementAt(0)
                                                      .state ??
                                                  "";
                                              _city_controller.text = value
                                                      .postOffice
                                                      ?.elementAt(0)
                                                      .district ??
                                                  "";
                                            })
                                          });
                                } else if (text.length > 6) {
                                  _createToast("Please enter valid pin code");
                                }
                              }
                            },
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.streetAddress,
                            controller: _state_controller,
                            maxLines: 1,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'State',
                              isDense: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.streetAddress,
                            controller: _city_controller,
                            maxLines: 1,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'City',
                              isDense: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.streetAddress,
                            controller: _address_1_controller,
                            minLines: 1,
                            maxLines: 10,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'Address Line 1',
                              isDense: true,
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(top: 10.0),
                          child: TextField(
                            cursorColor: const Color(0xFFFFAE00),
                            keyboardType: TextInputType.streetAddress,
                            controller: _address_2_controller,
                            minLines: 1,
                            maxLines: 10,
                            style: const TextStyle(color: Color(0xFFFFAE00)),
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
                              labelText: 'Address Line 2',
                              isDense: true,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (useCurrent) {
                          setState(() {
                            _address_controller.text = _currentAddress;
                          });
                        } else {
                          setState(() {
                            _address_controller.text =
                                _address_1_controller.text +
                                    ", " +
                                    _address_2_controller.text +
                                    ", " +
                                    _city_controller.text +
                                    ", " +
                                    _state_controller.text +
                                    ", " +
                                    _pin_code_controller.text;
                          });
                        }
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        "Save",
                        style: TextStyle(
                          color: Color(0xFF111111),
                          fontSize: 16.0,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(width, 40.0),
                        primary: const Color(0xFFFFAE00),
                        shadowColor: const Color(0xFFFFAE00),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void _showPicker(context, String which_image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery(which_image);
                      Navigator.of(context).pop();
                    }),
                ListTile(
                  leading: const Icon(Icons.photo_camera),
                  title: const Text('Camera'),
                  onTap: () {
                    _imgFromCamera(which_image);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromCamera(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = image == null ? null : File(image.path);
      }
    });
  }

  _imgFromGallery(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "ads_1") {
        _ads_1_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_2") {
        _ads_2_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_3") {
        _ads_3_file = image == null ? null : File(image.path);
      } else if (which_image == "ads_4") {
        _ads_4_file = image == null ? null : File(image.path);
      }
    });
  }

  Column ads_4_Column(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Advertisement 4",
            style: TextStyle(
              color: Color(0xFFFFAE00),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_4");
              },
              child: ClipRect(
                child: _ads_4_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_4_file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFFAE00),
                          size: 100,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column ads_3_Column(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Advertisement 3",
            style: TextStyle(
              color: Color(0xFFFFAE00),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_3");
              },
              child: ClipRect(
                child: _ads_3_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_3_file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFFAE00),
                          size: 100,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column ads_2_Column(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Advertisement 2",
            style: TextStyle(
              color: Color(0xFFFFAE00),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_2");
              },
              child: ClipRect(
                child: _ads_2_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_2_file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFFAE00),
                          size: 100,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Column ads_1_Column(BuildContext context) {
    return Column(
      children: [
        const Center(
          child: Text(
            "Advertisement 1",
            style: TextStyle(
              color: Color(0xFFFFAE00),
              fontWeight: FontWeight.bold,
              fontSize: 18.0,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0),
          child: Center(
            child: GestureDetector(
              onTap: () {
                _showPicker(context, "ads_1");
              },
              child: ClipRect(
                child: _ads_1_file != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.file(
                          _ads_1_file,
                          width: 100,
                          height: 100,
                          fit: BoxFit.fitHeight,
                        ),
                      )
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Color(0xFFFFAE00),
                          size: 100,
                        ),
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
