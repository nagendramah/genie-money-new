import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:genie_money/Screens/pdf_viewer.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/network.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/user_proof_model.dart';

class PhotoProofUploadScreen extends StatefulWidget {
  String title;

  PhotoProofUploadScreen(this.title, {Key? key}) : super(key: key);

  @override
  _PhotoProofUploadScreenState createState() => _PhotoProofUploadScreenState();
}

class _PhotoProofUploadScreenState extends State<PhotoProofUploadScreen> {
  bool isProfile = false;
  bool isPanCard = false;
  bool isAadharCard = false;
  bool isAadharToggle = false;
  bool isAadharFront = false;
  bool isAadharBack = false;
  bool isAadharBoth = false;
  bool isEmpBadge = false;
  bool isLast3Slips = false;
  bool is3SlipsToggle = false;
  bool is3SalarySlip = false;
  bool isSalarySlip = false;
  bool isLast3bank = false;
  bool is3BankStatement = false;
  bool is3BankToggle = false;
  bool isBankStatement = false;
  bool isAllOfferPages = false;
  bool is3offerPages = false;
  bool isAllOfferPagesToggle = false;
  bool isOffer = false;

  var profile_path;
  var pan_card_path;
  var aadhar_both_path;
  var aadhat_front_path;
  var aadhat_back_path;
  var emp_badge_path;
  var sal_first_month_path;
  var sal_second_month_path;
  var sal_third_month_path;
  var sal_all_three_month_path;
  var bank_first_month_path;
  var bank_second_month_path;
  var bank_third_month_path;
  var bank_all_3_month_path;
  var offer_first_page_path;
  var offer_second_page_path;
  var offer_third_page_path;
  var offer_all_page_path;

  NetworkCall _networkCall = NetworkCall();
  List<Docdetail>? docdetail = [];
  String base_url = "";
  String profile_url = "",
      pan_card_url = "",
      aadhar_both_url = "",
      aadhat_front_url = "",
      aadhat_back_url = "",
      emp_badge_url = "",
      sal_first_month_url = "",
      sal_second_month_url = "",
      sal_third_month_url = "",
      sal_all_three_month_url = "",
      bank_first_month_url = "",
      bank_second_month_url = "",
      bank_third_month_url = "",
      bank_all_3_month_url = "",
      offer_first_page_url = "",
      offer_second_page_url = "",
      offer_third_page_url = "",
      offer_all_page_url = "";

  File profile_file = File(""),
      pan_card_file = File(""),
      aadhar_both_file = File(""),
      aadhat_front_file = File(""),
      aadhat_back_file = File(""),
      emp_badge_file = File(""),
      sal_first_month_file = File(""),
      sal_second_month_file = File(""),
      sal_third_month_file = File(""),
      sal_all_three_month_file = File(""),
      bank_first_month_file = File(""),
      bank_second_month_file = File(""),
      bank_third_month_file = File(""),
      bank_all_3_month_file = File(""),
      offer_first_page_file = File(""),
      offer_second_page_file = File(""),
      offer_third_page_file = File(""),
      offer_all_page_file = File("");

  String profile_id = "",
      pan_card_id = "",
      aadhar_both_id = "",
      aadhat_front_id = "",
      aadhat_back_id = "",
      emp_badge_id = "",
      sal_first_month_id = "",
      sal_second_month_id = "",
      sal_third_month_id = "",
      sal_all_three_month_id = "",
      bank_first_month_id = "",
      bank_second_month_id = "",
      bank_third_month_id = "",
      bank_all_3_month_id = "",
      offer_first_page_id = "",
      offer_second_page_id = "",
      offer_third_page_id = "",
      offer_all_page_id = "";

  @override
  void initState() {
    _networkCall.getUserProofs().then((value) => {
          if (value.docdetail != null && value.docdetail!.isNotEmpty)
            {
              for (int i = 0; i < value.docdetail!.length; i++)
                {
                  docdetail!.add(value.docdetail![i]),
                },
              setState(() {
                base_url = value.baseUrl!;
                if (docdetail != null && docdetail!.isNotEmpty) {
                  for (int i = 0; i < docdetail!.length; i++) {
                    if (isProfile) {
                      if (docdetail![i].udType! == "profile") {
                        profile_id = docdetail![i].udId!;
                        profile_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        break;
                      }
                    } else if (isPanCard) {
                      if (docdetail![i].udType! == "pan") {
                        pan_card_id = docdetail![i].udId!;
                        pan_card_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        break;
                      }
                    } else if (isAadharCard) {
                      if (docdetail![i].udType! == "adhar" &&
                          docdetail![i].udDoctype == "front") {
                        aadhat_front_id = docdetail![9].udId!;
                        aadhat_front_url = base_url +
                            "/" +
                            docdetail![9].udUserid! +
                            "/" +
                            docdetail![9].udDocumentname!;
                        isAadharBoth = false;
                        isAadharFront = true;
                        isAadharBoth = false;
                        isAadharToggle = false;
                      } else if (docdetail![i].udType! == "adhar" &&
                          docdetail![i].udDoctype == "back") {
                        aadhat_back_id = docdetail![10].udId!;
                        aadhat_back_url = base_url +
                            "/" +
                            docdetail![10].udUserid! +
                            "/" +
                            docdetail![10].udDocumentname!;
                        isAadharBoth = false;
                        isAadharBack = true;
                        isAadharBoth = false;
                        isAadharToggle = false;
                      } else if (docdetail![i].udType! == "adhar" &&
                          (docdetail![i].udDoctype == "all" ||
                              docdetail![i].udDoctype == "both")) {
                        aadhar_both_id = docdetail![i].udId!;
                        aadhar_both_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isAadharBack = false;
                        isAadharFront = false;
                        isAadharBoth = true;
                        isAadharToggle = true;
                        break;
                      }
                    } else if (isEmpBadge) {
                      if (docdetail![i].udType! == "emp_badge") {
                        emp_badge_id = docdetail![i].udId!;
                        emp_badge_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        break;
                      }
                    } else if (isSalarySlip) {
                      if (docdetail![i].udType! == "salaryslip" &&
                          docdetail![i].udDoctype == "all") {
                        sal_all_three_month_id = docdetail![i].udId!;
                        sal_all_three_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        is3SalarySlip = false;
                        isLast3Slips = true;
                        is3SlipsToggle = false;
                        break;
                      } else if (docdetail![i].udType! == "salaryslip" &&
                          docdetail![i].udDoctype == "first") {
                        sal_first_month_id = docdetail![i].udId!;
                        sal_first_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        is3SalarySlip = true;
                        isLast3Slips = false;
                        is3SlipsToggle = true;
                      } else if (docdetail![i].udType! == "salaryslip" &&
                          docdetail![i].udDoctype == "second") {
                        sal_second_month_id = docdetail![i].udId!;
                        sal_second_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        is3SalarySlip = true;
                        isLast3Slips = false;
                        is3SlipsToggle = true;
                      } else if (docdetail![i].udType! == "salaryslip" &&
                          docdetail![i].udDoctype == "third") {
                        sal_third_month_id = docdetail![i].udId!;
                        sal_third_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        is3SalarySlip = true;
                        isLast3Slips = false;
                        is3SlipsToggle = true;
                      }
                    } else if (isBankStatement) {
                      if (docdetail![i].udType! == "bankstatement" &&
                          docdetail![i].udDoctype == "all") {
                        bank_all_3_month_id = docdetail![i].udId!;
                        bank_all_3_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isLast3bank = true;
                        is3BankStatement = false;
                        is3BankToggle = false;
                        break;
                      } else if (docdetail![i].udType! == "bankstatement" &&
                          docdetail![i].udDoctype == "first") {
                        bank_first_month_id = docdetail![i].udId!;
                        bank_first_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isLast3bank = false;
                        is3BankStatement = true;
                        is3BankToggle = true;
                      } else if (docdetail![i].udType! == "bankstatement" &&
                          docdetail![i].udDoctype == "second") {
                        bank_second_month_id = docdetail![i].udId!;
                        bank_second_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isLast3bank = false;
                        is3BankStatement = true;
                        is3BankToggle = true;
                      } else if (docdetail![i].udType! == "bankstatement" &&
                          docdetail![i].udDoctype == "third") {
                        bank_third_month_id = docdetail![i].udId!;
                        bank_third_month_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isLast3bank = false;
                        is3BankStatement = true;
                        is3BankToggle = true;
                      }
                    } else if (isOffer) {
                      if (docdetail![i].udType! == "offerletter" &&
                          docdetail![i].udDoctype == "all") {
                        offer_all_page_id = docdetail![i].udId!;
                        offer_all_page_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isAllOfferPages = true;
                        is3offerPages = false;
                        isAllOfferPagesToggle = true;
                        break;
                      } else if (docdetail![i].udType! == "offerletter" &&
                          docdetail![i].udDoctype == "first") {
                        offer_first_page_id = docdetail![i].udId!;
                        offer_first_page_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isAllOfferPages = false;
                        is3offerPages = true;
                        isAllOfferPagesToggle = false;
                      } else if (docdetail![i].udType! == "offerletter" &&
                          docdetail![i].udDoctype == "second") {
                        offer_second_page_id = docdetail![i].udId!;
                        offer_second_page_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isAllOfferPages = false;
                        is3offerPages = true;
                        isAllOfferPagesToggle = false;
                      } else if (docdetail![i].udType! == "offerletter" &&
                          docdetail![i].udDoctype == "third") {
                        offer_third_page_id = docdetail![i].udId!;
                        offer_third_page_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isAllOfferPages = false;
                        is3offerPages = true;
                        isAllOfferPagesToggle = false;
                      }
                    }
                  }
                }
              }),
            }
        });
    setState(() {
      if (widget.title == "Profile Photo") {
        isProfile = true;
      } else if (widget.title == "PAN Card") {
        isPanCard = true;
      } else if (widget.title == "Aadhar Card") {
        isAadharCard = true;
        isAadharFront = true;
        isAadharBack = true;
      } else if (widget.title == "Employee ID Card") {
        isEmpBadge = true;
      } else if (widget.title == "Salary Slip") {
        isLast3Slips = true;
        isSalarySlip = true;
      } else if (widget.title == "Bank Statement") {
        isLast3bank = true;
        isBankStatement = true;
      } else if (widget.title == "Offer/Appointment Letter") {
        is3offerPages = true;
        isOffer = true;
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor:navyBlueColor,
          title: Text(
            widget.title,
            style: const TextStyle(color: kWhite),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color:kWhite,
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: Container(
          margin: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: isProfile,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                    width: width * 0.5528,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRect(
                            child: profile_path != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      profile_path,
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : (profile_path == null ||
                                            profile_path.isEmpty) &&
                                        profile_url.isNotEmpty
                                    ? profile_url.contains(".pdf")
                                        ? InkWell(
                                            onTap: () {
                                              Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewerScreen(
                                                          profile_url.contains(
                                                                  "http")
                                                              ? true
                                                              : false,
                                                          profile_url,
                                                          profile_file));
                                              Navigator.of(context).push(route);
                                            },
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              color: navyBlueColor,
                                              size: 50.0,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image(
                                              image: NetworkImage(profile_url),
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: const Image(
                                          image: AssetImage(
                                              "images/personal_details.png"),
                                              color: navyBlueColor,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "Profile Photo",
                              style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.39,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: navyBlueColor,
                          onPressed: () {
                            _showPicker(context, "profile_image");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isPanCard,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.40,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRect(
                            child: pan_card_path != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      pan_card_path,
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : (pan_card_path == null ||
                                            pan_card_path.isEmpty) &&
                                        pan_card_url.isNotEmpty
                                    ? pan_card_url.contains(".pdf")
                                        ? InkWell(
                                            onTap: () {
                                              Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewerScreen(
                                                          pan_card_url.contains(
                                                                  "http")
                                                              ? true
                                                              : false,
                                                          pan_card_url,
                                                          pan_card_file));
                                              Navigator.of(context).push(route);
                                            },
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              color: navyBlueColor,
                                              size: 50.0,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image(
                                              image: NetworkImage(pan_card_url),
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: const Image(
                                          image: AssetImage(
                                              "images/personal_details.png"),
                                              color: navyBlueColor,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "PAN Card",
                              style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.40,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: navyBlueColor,
                          onPressed: () {
                            _showPicker(context, "pan_card_image");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isAadharCard,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload single document with front and back sides",
                            style: TextStyle(
                                color: navyBlueColor, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: navyBlueColor,
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: isAadharToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isAadharToggle = val;
                                  if (isAadharToggle) {
                                    isAadharBoth = true;
                                    isAadharFront = false;
                                    isAadharBack = false;
                                  } else {
                                    isAadharBoth = false;
                                    isAadharFront = true;
                                    isAadharBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isAadharBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.6445,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: aadhar_both_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              aadhar_both_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (aadhar_both_path == null ||
                                                    aadhar_both_path.isEmpty) &&
                                                aadhar_both_url.isNotEmpty
                                            ? aadhar_both_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  aadhar_both_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  aadhar_both_url,
                                                                  aadhar_both_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          aadhar_both_url),
                                                          
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/personal_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Front and back sides",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2999,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "aadhar_both_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAadharFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5639,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: aadhat_front_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              aadhat_front_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (aadhat_front_path == null ||
                                                    aadhat_front_path
                                                        .isEmpty) &&
                                                aadhat_front_url.isNotEmpty
                                            ? aadhat_front_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              aadhat_front_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              aadhat_front_url,
                                                              aadhat_front_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          aadhat_front_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/personal_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "Aadhar front side",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.38,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "aadhar_front_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAadharBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5667,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: aadhat_back_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              aadhat_back_path,
                                        
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (aadhat_back_path == null ||
                                                    aadhat_back_path.isEmpty) &&
                                                aadhat_back_url.isNotEmpty
                                            ? aadhat_back_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  aadhat_back_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  aadhat_back_url,
                                                                  aadhat_back_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          aadhat_back_url),
                                                        
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/personal_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 10.0),
                                    child: const Text(
                                      "Aadhar back side",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.3777,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "aadhar_back_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isEmpBadge,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: width * 0.58,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          ClipRect(
                            child: emp_badge_path != null
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.file(
                                      emp_badge_path,
                                      width: 50.0,
                                      height: 50.0,
                                      fit: BoxFit.cover,
                                    ),
                                  )
                                : (emp_badge_path == null ||
                                            emp_badge_path.isEmpty) &&
                                        emp_badge_url.isNotEmpty
                                    ? emp_badge_url.contains(".pdf")
                                        ? InkWell(
                                            onTap: () {
                                              Route route = MaterialPageRoute(
                                                  builder: (context) =>
                                                      PdfViewerScreen(
                                                          emp_badge_url
                                                                  .contains(
                                                                      "http")
                                                              ? true
                                                              : false,
                                                          emp_badge_url,
                                                          emp_badge_file));
                                              Navigator.of(context).push(route);
                                            },
                                            child: Icon(
                                              Icons.picture_as_pdf,
                                              color: navyBlueColor,
                                              size: 50.0,
                                            ),
                                          )
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image(
                                              image:
                                                  NetworkImage(emp_badge_url),
                                            
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.fill,
                                            ),
                                          )
                                    : ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(8.0),
                                        child: const Image(
                                          image: AssetImage(
                                              "images/employement_details.png"),
                                              color: navyBlueColor,
                                          width: 50.0,
                                          height: 50.0,
                                        ),
                                      ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(left: 15.0),
                            child: const Text(
                              "Employee ID Card",
                              style: TextStyle(
                                color: navyBlueColor,
                                fontSize: 18.0,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      width: width * 0.36,
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: IconButton(
                          icon: const Icon(Icons.add),
                          iconSize: 30.0,
                          color: navyBlueColor,
                          onPressed: () {
                            _showPicker(context, "emp_badge_image");
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isSalarySlip,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload individual salary slips for the last 3 months",
                            style: TextStyle(
                                color: navyBlueColor, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: navyBlueColor,
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: is3SlipsToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  is3SlipsToggle = val;
                                  if (is3SlipsToggle) {
                                    is3SalarySlip = true;
                                    isLast3Slips = false;
                                  } else {
                                    is3SalarySlip = false;
                                    isLast3Slips = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3SalarySlip,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRect(
                                        child: sal_first_month_path != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  sal_first_month_path,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : (sal_first_month_path == null ||
                                                        sal_first_month_path
                                                            .isEmpty) &&
                                                    sal_first_month_url
                                                        .isNotEmpty
                                                ? sal_first_month_url
                                                        .contains(".pdf")
                                                    ? InkWell(
                                                        onTap: () {
                                                          Route route = MaterialPageRoute(
                                                              builder: (context) => PdfViewerScreen(
                                                                  sal_first_month_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  sal_first_month_url,
                                                                  sal_first_month_file));
                                                          Navigator.of(context)
                                                              .push(route);
                                                        },
                                                        child: Icon(
                                                          Icons.picture_as_pdf,
                                                          color:
                                                              navyBlueColor,
                                                          size: 50.0,
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image(
                                                          image: NetworkImage(
                                                              sal_first_month_url),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "images/bank_details.png"),
                                                          color: navyBlueColor,
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First month",
                                          style: TextStyle(
                                            color: navyBlueColor,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: navyBlueColor,
                                      onPressed: () {
                                        _showPicker(
                                            context, "sal_first_month_image");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: sal_second_month_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    sal_second_month_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (sal_second_month_path ==
                                                              null ||
                                                          sal_second_month_path
                                                              .isEmpty) &&
                                                      sal_second_month_url
                                                          .isNotEmpty
                                                  ? sal_second_month_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    sal_second_month_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    sal_second_month_url,
                                                                    sal_second_month_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                sal_second_month_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second month",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(context,
                                              "sal_second_month_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: sal_third_month_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    sal_third_month_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (sal_third_month_path == null ||
                                                          sal_third_month_path
                                                              .isEmpty) &&
                                                      sal_third_month_url
                                                          .isNotEmpty
                                                  ? sal_third_month_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    sal_third_month_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    sal_third_month_url,
                                                                    sal_third_month_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                sal_third_month_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third month",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(
                                              context, "sal_third_month_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLast3Slips,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: sal_all_three_month_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              sal_all_three_month_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (sal_all_three_month_path == null ||
                                                    sal_all_three_month_path
                                                        .isEmpty) &&
                                                sal_all_three_month_url
                                                    .isNotEmpty
                                            ? sal_all_three_month_url
                                                    .contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              sal_all_three_month_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              sal_all_three_month_url,
                                                              sal_all_three_month_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          sal_all_three_month_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/bank_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months Salary Slips",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(
                                        context, "sal_all_three_month_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isBankStatement,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload individual salary slips for the last 3 months",
                            style: TextStyle(
                                color: navyBlueColor, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: navyBlueColor,
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: is3BankToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  is3BankToggle = val;
                                  if (is3BankToggle) {
                                    is3BankStatement = true;
                                    isLast3bank = false;
                                  } else {
                                    is3BankStatement = false;
                                    isLast3bank = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3BankStatement,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRect(
                                        child: bank_first_month_path != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  bank_first_month_path,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : (bank_first_month_path == null ||
                                                        bank_first_month_path
                                                            .isEmpty) &&
                                                    bank_first_month_url
                                                        .isNotEmpty
                                                ? bank_first_month_url
                                                        .contains(".pdf")
                                                    ? InkWell(
                                                        onTap: () {
                                                          Route route = MaterialPageRoute(
                                                              builder: (context) => PdfViewerScreen(
                                                                  bank_first_month_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  bank_first_month_url,
                                                                  bank_first_month_file));
                                                          Navigator.of(context)
                                                              .push(route);
                                                        },
                                                        child: Icon(
                                                          Icons.picture_as_pdf,
                                                          color:
                                                              navyBlueColor,
                                                          size: 50.0,
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image(
                                                          image: NetworkImage(
                                                              bank_first_month_url),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "images/bank_details.png"),
                                                          color: navyBlueColor,
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First month",
                                          style: TextStyle(
                                            color: navyBlueColor,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: navyBlueColor,
                                      onPressed: () {
                                        _showPicker(
                                            context, "bank_first_month_image");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: bank_second_month_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    bank_second_month_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (bank_second_month_path ==
                                                              null ||
                                                          bank_second_month_path
                                                              .isEmpty) &&
                                                      bank_second_month_url
                                                          .isNotEmpty
                                                  ? bank_second_month_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    bank_second_month_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    bank_second_month_url,
                                                                    bank_second_month_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                bank_second_month_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second month",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(context,
                                              "bank_second_month_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: bank_third_month_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    bank_third_month_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (bank_third_month_path ==
                                                              null ||
                                                          bank_third_month_path
                                                              .isEmpty) &&
                                                      bank_third_month_url
                                                          .isNotEmpty
                                                  ? bank_third_month_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    bank_third_month_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    bank_third_month_url,
                                                                    bank_third_month_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                bank_third_month_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third month",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(context,
                                              "bank_third_month_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isLast3bank,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: bank_all_3_month_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              bank_all_3_month_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (bank_all_3_month_path == null ||
                                                    bank_all_3_month_path
                                                        .isEmpty) &&
                                                bank_all_3_month_url.isNotEmpty
                                            ? bank_all_3_month_url
                                                    .contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              bank_all_3_month_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              bank_all_3_month_url,
                                                              bank_all_3_month_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          bank_all_3_month_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/bank_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    width: width * 0.4417,
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bank statement till today",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(
                                        context, "bank_all_3_month_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10.0),
                      child: const Text(
                        "Note : Bank statement is required for faster loan approval",
                        style: TextStyle(color: navyBlueColor),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: isOffer,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload all pages in a single document",
                            style: TextStyle(
                                color: navyBlueColor, fontSize: 18.0),
                          ),
                        ),
                        SizedBox(
                          width: width * 0.12,
                          child: Align(
                            alignment: Alignment.centerRight,
                            child: FlutterSwitch(
                              activeColor: navyBlueColor,
                              width: width * 0.15,
                              height: height * 0.04,
                              toggleSize: 25.0,
                              value: isAllOfferPagesToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isAllOfferPagesToggle = val;
                                  if (isAllOfferPagesToggle) {
                                    isAllOfferPages = true;
                                    is3offerPages = false;
                                  } else {
                                    isAllOfferPages = false;
                                    is3offerPages = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: is3offerPages,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                  width: width * 0.6445,
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      ClipRect(
                                        child: offer_first_page_path != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  offer_first_page_path,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : (offer_first_page_path == null ||
                                                        offer_first_page_path
                                                            .isEmpty) &&
                                                    offer_first_page_url
                                                        .isNotEmpty
                                                ? offer_first_page_url
                                                        .contains(".pdf")
                                                    ? InkWell(
                                                        onTap: () {
                                                          Route route = MaterialPageRoute(
                                                              builder: (context) => PdfViewerScreen(
                                                                  offer_first_page_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  offer_first_page_url,
                                                                  offer_first_page_file));
                                                          Navigator.of(context)
                                                              .push(route);
                                                        },
                                                        child: Icon(
                                                          Icons.picture_as_pdf,
                                                          color:
                                                              navyBlueColor,
                                                          size: 50.0,
                                                        ),
                                                      )
                                                    : ClipRRect(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                        child: Image(
                                                          image: NetworkImage(
                                                              offer_first_page_url),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: const Image(
                                                      image: AssetImage(
                                                          "images/bank_details.png"),
                                                          color: navyBlueColor,
                                                      width: 50.0,
                                                      height: 50.0,
                                                    ),
                                                  ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(left: 15.0),
                                        child: const Text(
                                          "First page",
                                          style: TextStyle(
                                            color: navyBlueColor,
                                            fontSize: 18.0,
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  width: width * 0.2999,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: IconButton(
                                      icon: const Icon(Icons.add),
                                      iconSize: 30.0,
                                      color: navyBlueColor,
                                      onPressed: () {
                                        _showPicker(
                                            context, "offer_first_page_image");
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: offer_second_page_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    offer_second_page_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (offer_second_page_path ==
                                                              null ||
                                                          offer_second_page_path
                                                              .isEmpty) &&
                                                      offer_second_page_url
                                                          .isNotEmpty
                                                  ? offer_second_page_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    offer_second_page_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    offer_second_page_url,
                                                                    offer_second_page_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                offer_second_page_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Second page",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(context,
                                              "offer_second_page_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    width: width * 0.6445,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        ClipRect(
                                          child: offer_third_page_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    offer_third_page_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (offer_third_page_path ==
                                                              null ||
                                                          offer_third_page_path
                                                              .isEmpty) &&
                                                      offer_third_page_url
                                                          .isNotEmpty
                                                  ? offer_third_page_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    offer_third_page_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    offer_third_page_url,
                                                                    offer_third_page_file));
                                                            Navigator.of(
                                                                    context)
                                                                .push(route);
                                                          },
                                                          child: Icon(
                                                            Icons
                                                                .picture_as_pdf,
                                                            color: navyBlueColor,
                                                            size: 50.0,
                                                          ),
                                                        )
                                                      : ClipRRect(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      8.0),
                                                          child: Image(
                                                            image: NetworkImage(
                                                                offer_third_page_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Image(
                                                        image: AssetImage(
                                                            "images/bank_details.png"),
                                                            color: navyBlueColor,
                                                        width: 50.0,
                                                        height: 50.0,
                                                      ),
                                                    ),
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(left: 15.0),
                                          child: const Text(
                                            "Third page",
                                            style: TextStyle(
                                              color: navyBlueColor,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.2999,
                                    child: Align(
                                      alignment: Alignment.centerRight,
                                      child: IconButton(
                                        icon: const Icon(Icons.add),
                                        iconSize: 30.0,
                                        color: navyBlueColor,
                                        onPressed: () {
                                          _showPicker(context,
                                              "offer_third_page_image");
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isAllOfferPages,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7695,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: offer_all_page_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              offer_all_page_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (offer_all_page_path == null ||
                                                    offer_all_page_path
                                                        .isEmpty) &&
                                                offer_all_page_url.isNotEmpty
                                            ? offer_all_page_url
                                                    .contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              offer_all_page_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              offer_all_page_url,
                                                              offer_all_page_file));
                                                      Navigator.of(context)
                                                          .push(route);
                                                    },
                                                    child: Icon(
                                                      Icons.picture_as_pdf,
                                                      color: navyBlueColor,
                                                      size: 50.0,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: Image(
                                                      image: NetworkImage(
                                                          offer_all_page_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Image(
                                                  image: AssetImage(
                                                      "images/bank_details.png"),
                                                      color: navyBlueColor,
                                                  width: 50.0,
                                                  height: 50.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    width: width * 0.4449,
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "All pages of your offer/appointment letter",
                                      textAlign: TextAlign.justify,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.1749,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(
                                        context, "offer_all_page_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPicker(context, String which_image) async {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                Visibility(
                  visible: which_image == "profile_image" ? false : true,
                  child: ListTile(
                      leading: const Icon(Icons.picture_as_pdf),
                      title: const Text('PDF'),
                      onTap: () async {
                        FilePickerResult? result =
                            await FilePicker.platform.pickFiles(
                          type: FileType.custom,
                          allowedExtensions: ['pdf'],
                        );

                        if (result != null) {
                          File file = File(result.files.single.path!);
                          if (which_image == "profile_image") {
                            setState(() {
                              profile_path = null;
                              profile_url = file.path;
                              profile_file = file;
                            });
                            uploadFile(
                                profile_id, file, "profile", "front", context);
                          } else if (which_image == "pan_card_image") {
                            setState(() {
                              pan_card_path = null;
                              pan_card_url = file.path;
                              pan_card_file = file;
                            });
                            uploadFile(
                                pan_card_id, file, "pan", "front", context);
                          } else if (which_image == "aadhar_both_image") {
                            setState(() {
                              aadhar_both_url = file.path;
                              aadhar_both_file = file;
                              aadhar_both_path = null;
                            });
                            uploadFile(
                                aadhar_both_id, file, "adhar", "all", context);
                          } else if (which_image == "aadhar_front_image") {
                            setState(() {
                              aadhat_front_url = file.path;
                              aadhat_front_file = file;
                              aadhat_front_path = null;
                            });
                            uploadFile(
                                aadhat_front_id, file, "adhar", "front", context);
                          } else if (which_image == "aadhar_back_image") {
                            setState(() {
                              aadhat_back_url = file.path;
                              aadhat_back_file = file;
                              aadhat_back_path = null;
                            });
                            uploadFile(
                                aadhat_back_id, file, "adhar", "back", context);
                          } else if (which_image == "emp_badge_image") {
                            setState(() {
                              emp_badge_url = file.path;
                              emp_badge_file = file;
                              emp_badge_path = null;
                            });
                            uploadFile(emp_badge_id, file, "emp_badge", "front",
                                context);
                          } else if (which_image == "sal_first_month_image") {
                            setState(() {
                              sal_first_month_url = file.path;
                              sal_first_month_file = file;
                              sal_first_month_path = null;
                            });
                            uploadFile(sal_first_month_id, file, "salaryslip",
                                "first", context);
                          } else if (which_image == "sal_second_month_image") {
                            setState(() {
                              sal_second_month_url = file.path;
                              sal_second_month_file = file;
                              sal_second_month_path = null;
                            });
                            uploadFile(sal_second_month_id, file, "salaryslip",
                                "second", context);
                          } else if (which_image == "sal_third_month_image") {
                            setState(() {
                              sal_third_month_url = file.path;
                              sal_third_month_file = file;
                              sal_third_month_path = null;
                            });
                            uploadFile(sal_third_month_id, file, "salaryslip",
                                "third", context);
                          } else if (which_image == "sal_all_three_month_image") {
                            setState(() {
                              sal_all_three_month_url = file.path;
                              sal_all_three_month_file = file;
                              sal_all_three_month_path = null;
                            });
                            uploadFile(sal_all_three_month_id, file, "salaryslip",
                                "all", context);
                          } else if (which_image == "bank_first_month_image") {
                            setState(() {
                              bank_first_month_url = file.path;
                              bank_first_month_file = file;
                              bank_first_month_path = null;
                            });
                            uploadFile(bank_first_month_id, file, "bankstatement",
                                "first", context);
                          } else if (which_image == "bank_second_month_image") {
                            setState(() {
                              bank_second_month_url = file.path;
                              bank_second_month_file = file;
                              bank_second_month_path = null;
                            });
                            uploadFile(bank_second_month_id, file,
                                "bankstatement", "second", context);
                          } else if (which_image == "bank_third_month_image") {
                            setState(() {
                              bank_third_month_url = file.path;
                              bank_third_month_file = file;
                              bank_third_month_path = null;
                            });
                            uploadFile(bank_third_month_id, file, "bankstatement",
                                "third", context);
                          } else if (which_image == "bank_all_3_month_image") {
                            setState(() {
                              bank_all_3_month_url = file.path;
                              bank_all_3_month_file = file;
                              bank_all_3_month_path = null;
                            });
                            uploadFile(bank_all_3_month_id, file, "bankstatement",
                                "all", context);
                          } else if (which_image == "offer_first_page_image") {
                            setState(() {
                              offer_first_page_url = file.path;
                              offer_first_page_file = file;
                              offer_first_page_path = null;
                            });
                            uploadFile(offer_first_page_id, file, "offerletter",
                                "first", context);
                          } else if (which_image == "offer_second_page_image") {
                            setState(() {
                              offer_second_page_url = file.path;
                              offer_second_page_file = file;
                              offer_second_page_path = null;
                            });
                            uploadFile(offer_second_page_id, file, "offerletter",
                                "second", context);
                          } else if (which_image == "offer_third_page_image") {
                            setState(() {
                              offer_third_page_url = file.path;
                              offer_third_page_file = file;
                              offer_third_page_path = null;
                            });
                            uploadFile(offer_third_page_id, file, "offerletter",
                                "third", context);
                          } else if (which_image == "offer_all_page_image") {
                            setState(() {
                              offer_all_page_url = file.path;
                              offer_all_page_file = file;
                              offer_all_page_path = null;
                            });
                            uploadFile(offer_all_page_id, file, "offerletter",
                                "all", context);
                          }
                          print(file.path);
                        } else {
                          // User canceled the picker
                        }
                        Navigator.of(context).pop();
                      }),
                ),
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
                    _imgFromCamera(which_image, context);
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ),
          );
        });
  }

  _imgFromGallery(String which_image) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "profile_image") {
        profile_path = image == null ? null : File(image.path);
        uploadFile(profile_id, profile_path, "profile", "front", context);
      } else if (which_image == "pan_card_image") {
        pan_card_path = image == null ? null : File(image.path);
        uploadFile(pan_card_id, pan_card_path, "pan", "front", context);
      } else if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
        uploadFile(aadhar_both_id, aadhar_both_path, "adhar", "both", context);
      } else if (which_image == "aadhar_front_image") {
        aadhat_front_path = image == null ? null : File(image.path);
        uploadFile(
            aadhat_front_id, aadhat_front_path, "adhar", "front", context);
      } else if (which_image == "aadhar_back_image") {
        aadhat_back_path = image == null ? null : File(image.path);
        uploadFile(aadhat_back_id, aadhat_back_path, "adhar", "back", context);
      } else if (which_image == "emp_badge_image") {
        emp_badge_path = image == null ? null : File(image.path);
        uploadFile(emp_badge_id, emp_badge_path, "emp_badge", "front", context);
      } else if (which_image == "sal_first_month_image") {
        sal_first_month_path = image == null ? null : File(image.path);
        uploadFile(sal_first_month_id, sal_first_month_path, "salaryslip",
            "first", context);
      } else if (which_image == "sal_second_month_image") {
        sal_second_month_path = image == null ? null : File(image.path);
        uploadFile(sal_second_month_id, sal_second_month_path, "salaryslip",
            "second", context);
      } else if (which_image == "sal_third_month_image") {
        sal_third_month_path = image == null ? null : File(image.path);
        uploadFile(sal_third_month_id, sal_third_month_path, "salaryslip",
            "third", context);
      } else if (which_image == "sal_all_three_month_image") {
        sal_all_three_month_path = image == null ? null : File(image.path);
        uploadFile(sal_all_three_month_id, sal_all_three_month_path,
            "salaryslip", "all", context);
      } else if (which_image == "bank_first_month_image") {
        bank_first_month_path = image == null ? null : File(image.path);
        uploadFile(bank_first_month_id, bank_first_month_path, "bankstatement",
            "first", context);
      } else if (which_image == "bank_second_month_image") {
        bank_second_month_path = image == null ? null : File(image.path);
        uploadFile(bank_second_month_id, bank_second_month_path,
            "bankstatement", "second", context);
      } else if (which_image == "bank_third_month_image") {
        bank_third_month_path = image == null ? null : File(image.path);
        uploadFile(bank_third_month_id, bank_third_month_path, "bankstatement",
            "third", context);
      } else if (which_image == "bank_all_3_month_image") {
        bank_all_3_month_path = image == null ? null : File(image.path);
        uploadFile(bank_all_3_month_id, bank_all_3_month_path, "bankstatement",
            "all", context);
      } else if (which_image == "offer_first_page_image") {
        offer_first_page_path = image == null ? null : File(image.path);
        uploadFile(offer_first_page_id, offer_first_page_path, "offerletter",
            "first", context);
      } else if (which_image == "offer_second_page_image") {
        offer_second_page_path = image == null ? null : File(image.path);
        uploadFile(offer_second_page_id, offer_second_page_path, "offerletter",
            "second", context);
      } else if (which_image == "offer_third_page_image") {
        offer_third_page_path = image == null ? null : File(image.path);
        uploadFile(offer_third_page_id, offer_third_page_path, "offerletter",
            "third", context);
      } else if (which_image == "offer_all_page_image") {
        offer_all_page_path = image == null ? null : File(image.path);
        uploadFile(offer_all_page_id, offer_all_page_path, "offerletter", "all",
            context);
      }
    });
  }

  _imgFromCamera(String which_image, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "profile_image") {
        profile_path = image == null ? null : File(image.path);
        uploadFile(profile_id, profile_path, "profile", "front", context);
      } else if (which_image == "pan_card_image") {
        pan_card_path = image == null ? null : File(image.path);
        uploadFile(pan_card_id, pan_card_path, "pan", "front", context);
      } else if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
        uploadFile(aadhar_both_id, aadhar_both_path, "adhar", "both", context);
      } else if (which_image == "aadhar_front_image") {
        aadhat_front_path = image == null ? null : File(image.path);
        uploadFile(
            aadhat_front_id, aadhat_front_path, "adhar", "front", context);
      } else if (which_image == "aadhar_back_image") {
        aadhat_back_path = image == null ? null : File(image.path);
        uploadFile(aadhat_back_id, aadhat_back_path, "adhar", "back", context);
      } else if (which_image == "emp_badge_image") {
        emp_badge_path = image == null ? null : File(image.path);
        uploadFile(emp_badge_id, emp_badge_path, "emp_badge", "front", context);
      } else if (which_image == "sal_first_month_image") {
        sal_first_month_path = image == null ? null : File(image.path);
        uploadFile(sal_first_month_id, sal_first_month_path, "salaryslip",
            "first", context);
      } else if (which_image == "sal_second_month_image") {
        sal_second_month_path = image == null ? null : File(image.path);
        uploadFile(sal_second_month_id, sal_second_month_path, "salaryslip",
            "second", context);
      } else if (which_image == "sal_third_month_image") {
        sal_third_month_path = image == null ? null : File(image.path);
        uploadFile(sal_third_month_id, sal_third_month_path, "salaryslip",
            "third", context);
      } else if (which_image == "sal_all_three_month_image") {
        sal_all_three_month_path = image == null ? null : File(image.path);
        uploadFile(sal_all_three_month_id, sal_all_three_month_path,
            "salaryslip", "all", context);
      } else if (which_image == "bank_first_month_image") {
        bank_first_month_path = image == null ? null : File(image.path);
        uploadFile(bank_first_month_id, bank_first_month_path, "bankstatement",
            "first", context);
      } else if (which_image == "bank_second_month_image") {
        bank_second_month_path = image == null ? null : File(image.path);
        uploadFile(bank_second_month_id, bank_second_month_path,
            "bankstatement", "second", context);
      } else if (which_image == "bank_third_month_image") {
        bank_third_month_path = image == null ? null : File(image.path);
        uploadFile(bank_third_month_id, bank_third_month_path, "bankstatement",
            "third", context);
      } else if (which_image == "bank_all_3_month_image") {
        bank_all_3_month_path = image == null ? null : File(image.path);
        uploadFile(bank_all_3_month_id, bank_all_3_month_path, "bankstatement",
            "all", context);
      } else if (which_image == "offer_first_page_image") {
        offer_first_page_path = image == null ? null : File(image.path);
        uploadFile(offer_first_page_id, offer_first_page_path, "offerletter",
            "first", context);
      } else if (which_image == "offer_second_page_image") {
        offer_second_page_path = image == null ? null : File(image.path);
        uploadFile(offer_second_page_id, offer_second_page_path, "offerletter",
            "second", context);
      } else if (which_image == "offer_third_page_image") {
        offer_third_page_path = image == null ? null : File(image.path);
        uploadFile(offer_third_page_id, offer_third_page_path, "offerletter",
            "third", context);
      } else if (which_image == "offer_all_page_image") {
        offer_all_page_path = image == null ? null : File(image.path);
        uploadFile(offer_all_page_id, offer_all_page_path, "offerletter", "all",
            context);
      }
    });
  }

  void uploadFile(
      String id, File _file, String ud_type, ud_doctype, BuildContext context) {
    _networkCall.update_proofs(id, ud_type, ud_doctype, _file, context);
  }
}
