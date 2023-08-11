import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:genie_money/Screens/pdf_viewer.dart';
import 'package:genie_money/Utils/utils.dart';
import 'package:genie_money/utils/network.dart';
import 'package:image_picker/image_picker.dart';

import '../Model/user_proof_model.dart';

class ResidentUploadImage extends StatefulWidget {
  String title;

  ResidentUploadImage(this.title, {Key? key}) : super(key: key);

  @override
  _ResidentUploadImageState createState() => _ResidentUploadImageState();
}

class _ResidentUploadImageState extends State<ResidentUploadImage> {
  bool isAadharCard = false;
  bool isAadharToggle = false;
  bool isAadharBoth = false;
  bool isAadharFront = false;
  bool isAadharBack = false;

  bool isUtilityBill = false;
  bool isUtilityToggle = false;
  bool isUtilityInOne = false;
  bool isShow2Utility = false;

  bool isTelephoneBill = false;
  bool isTelephoneToggle = false;
  bool isTelephoneInOne = false;
  bool isShow2Telephone = false;

  bool isPassportCard = false;
  bool isPassportToggle = false;
  bool isPassportBoth = false;
  bool isPassportFront = false;
  bool isPassportBack = false;

  bool isVoterCard = false;
  bool isVoterToggle = false;
  bool isVoterBoth = false;
  bool isVoterFront = false;
  bool isVoterBack = false;

  bool isDrivingCard = false;
  bool isDrivingToggle = false;
  bool isDrivingBoth = false;
  bool isDrivingFront = false;
  bool isDrivingBack = false;

  bool isRentalCard = false;
  bool isRentalToggle = false;
  bool isRentalBoth = false;
  bool isRentalFront = false;
  bool isRentalBack = false;

  bool isHRCard = false;
  bool isHRToggle = false;
  bool isHRBoth = false;
  bool isHRFront = false;
  bool isHRBack = false;

  bool isHouseCard = false;
  bool isHouseToggle = false;
  bool isHouseBoth = false;
  bool isHouseFront = false;
  bool isHouseBack = false;

  var aadhar_both_path;
  var aadhar_front_path;
  var aadhar_back_path;
  var utility_first_path;
  var utility_second_path;
  var utility_third_path;
  var utility_all_path;
  var tele_first_path;
  var tele_second_path;
  var tele_third_path;
  var tele_all_path;
  var passport_all_path;
  var passport_first_path;
  var passport_last_path;
  var voter_all_path;
  var voter_front_path;
  var voter_last_path;
  var driving_all_path;
  var driving_front_path;
  var driving_back_path;
  var rental_all_path;
  var rental_front_path;
  var rental_back_path;
  var company_all_path;
  var company_first_path;
  var company_second_path;
  var house_all_path;
  var house_first_path;
  var house_second_path;

  NetworkCall _networkCall = NetworkCall();
  List<Docdetail>? docdetail = [];
  String base_url = "";
  String aadhar_both_url = "",
      aadhar_front_url = "",
      aadhar_back_url = "",
      utility_first_url = "",
      utility_second_url = "",
      utility_third_url = "",
      utility_all_url = "",
      tele_first_url = "",
      tele_second_url = "",
      tele_third_url = "",
      tele_all_url = "",
      passport_all_url = "",
      passport_first_url = "",
      passport_last_url = "",
      voter_all_url = "",
      voter_front_url = "",
      voter_last_url = "",
      driving_all_url = "",
      driving_front_url = "",
      driving_back_url = "",
      rental_all_url = "",
      rental_front_url = "",
      rental_back_url = "",
      company_all_url = "",
      company_first_url = "",
      company_second_url = "",
      house_all_url = "",
      house_first_url = "",
      house_second_url = "";

  File aadhar_both_file = File(""),
      aadhar_front_file = File(""),
      aadhar_back_file = File(""),
      utility_first_file = File(""),
      utility_second_file = File(""),
      utility_third_file = File(""),
      utility_all_file = File(""),
      tele_first_file = File(""),
      tele_second_file = File(""),
      tele_third_file = File(""),
      tele_all_file = File(""),
      passport_all_file = File(""),
      passport_first_file = File(""),
      passport_last_file = File(""),
      voter_all_file = File(""),
      voter_front_file = File(""),
      voter_last_file = File(""),
      driving_all_file = File(""),
      driving_front_file = File(""),
      driving_back_file = File(""),
      rental_all_file = File(""),
      rental_front_file = File(""),
      rental_back_file = File(""),
      company_all_file = File(""),
      company_first_file = File(""),
      company_second_file = File(""),
      house_all_file = File(""),
      house_first_file = File(""),
      house_second_file = File("");

  String aadhar_both_id = "",
      aadhar_front_id = "",
      aadhar_back_id = "",
      utility_first_id = "",
      utility_second_id = "",
      utility_third_id = "",
      utility_all_id = "",
      tele_first_id = "",
      tele_second_id = "",
      tele_third_id = "",
      tele_all_id = "",
      passport_all_id = "",
      passport_first_id = "",
      passport_last_id = "",
      voter_all_id = "",
      voter_front_id = "",
      voter_last_id = "",
      driving_all_id = "",
      driving_front_id = "",
      driving_back_id = "",
      rental_all_id = "",
      rental_front_id = "",
      rental_back_id = "",
      company_all_id = "",
      company_first_id = "",
      company_second_id = "",
      house_all_id = "",
      house_first_id = "",
      house_second_id = "";

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
                    if (isAadharCard) {
                      if (docdetail![i].udType! == "adhar" &&
                          docdetail![i].udDoctype == "front") {
                        aadhar_front_id = docdetail![9].udId!;
                        aadhar_front_url = base_url +
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
                        aadhar_back_id = docdetail![10].udId!;
                        aadhar_back_url = base_url +
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
                    } else if (isUtilityBill) {
                      if (docdetail![i].udType! == "utility" &&
                          docdetail![i].udDoctype == "all") {
                        utility_all_id = docdetail![i].udId!;
                        utility_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isUtilityToggle = true;
                        isUtilityInOne = true;
                        isShow2Utility = false;
                        break;
                      } else if (docdetail![i].udType! == "utility" &&
                          docdetail![i].udDoctype == "first") {
                        utility_first_id = docdetail![i].udId!;
                        utility_first_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isUtilityToggle = false;
                        isUtilityInOne = false;
                        isShow2Utility = true;
                      } else if (docdetail![i].udType! == "utility" &&
                          docdetail![i].udDoctype == "second") {
                        utility_second_id = docdetail![i].udId!;
                        utility_second_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isUtilityToggle = false;
                        isUtilityInOne = false;
                        isShow2Utility = true;
                      } else if (docdetail![i].udType! == "utility" &&
                          docdetail![i].udDoctype == "third") {
                        utility_third_id = docdetail![i].udId!;
                        utility_third_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isUtilityToggle = false;
                        isUtilityInOne = false;
                        isShow2Utility = true;
                      }
                    } else if (isTelephoneBill) {
                      if (docdetail![i].udType! == "telephone" &&
                          docdetail![i].udDoctype == "all") {
                        tele_all_id = docdetail![i].udId!;
                        tele_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isTelephoneToggle = true;
                        isTelephoneInOne = true;
                        isShow2Telephone = false;
                        break;
                      } else if (docdetail![i].udType! == "telephone" &&
                          docdetail![i].udDoctype == "first") {
                        tele_first_id = docdetail![i].udId!;
                        tele_first_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isTelephoneToggle = false;
                        isTelephoneInOne = false;
                        isShow2Telephone = true;
                      } else if (docdetail![i].udType! == "telephone" &&
                          docdetail![i].udDoctype == "second") {
                        tele_second_id = docdetail![i].udId!;
                        tele_second_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isTelephoneToggle = false;
                        isTelephoneInOne = false;
                        isShow2Telephone = true;
                      } else if (docdetail![i].udType! == "telephone" &&
                          docdetail![i].udDoctype == "third") {
                        tele_third_id = docdetail![i].udId!;
                        tele_third_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isTelephoneToggle = false;
                        isTelephoneInOne = false;
                        isShow2Telephone = true;
                      }
                    } else if (isPassportCard) {
                      if (docdetail![i].udType! == "passport" &&
                          docdetail![i].udDoctype == "all") {
                        passport_all_id = docdetail![i].udId!;
                        passport_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isPassportToggle = true;
                        isPassportBoth = true;
                        isPassportFront = false;
                        isPassportBack = false;
                        break;
                      } else if (docdetail![i].udType! == "passport" &&
                          docdetail![i].udDoctype == "first") {
                        passport_first_id = docdetail![i].udId!;
                        passport_first_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isPassportToggle = false;
                        isPassportBoth = false;
                        isPassportFront = true;
                        isPassportBack = true;
                      } else if (docdetail![i].udType! == "passport" &&
                          docdetail![i].udDoctype == "last") {
                        passport_last_id = docdetail![i].udId!;
                        passport_last_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isPassportToggle = false;
                        isPassportBoth = false;
                        isPassportFront = true;
                        isPassportBack = true;
                      }
                    } else if (isVoterCard) {
                      if (docdetail![i].udType! == "voter" &&
                          docdetail![i].udDoctype == "all") {
                        voter_all_id = docdetail![i].udId!;
                        voter_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isVoterToggle = true;
                        isVoterBoth = true;
                        isVoterFront = false;
                        isVoterBack = false;
                        break;
                      } else if (docdetail![i].udType! == "voter" &&
                          docdetail![i].udDoctype == "front") {
                        voter_front_id = docdetail![i].udId!;
                        voter_front_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isVoterToggle = false;
                        isVoterBoth = false;
                        isVoterFront = true;
                        isVoterBack = true;
                      } else if (docdetail![i].udType! == "voter" &&
                          docdetail![i].udDoctype == "last") {
                        voter_last_id = docdetail![i].udId!;
                        voter_last_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isVoterToggle = false;
                        isVoterBoth = false;
                        isVoterFront = true;
                        isVoterBack = true;
                      }
                    } else if (isDrivingCard) {
                      if (docdetail![i].udType! == "drivinglicense" &&
                          docdetail![i].udDoctype == "all") {
                        driving_all_id = docdetail![i].udId!;
                        driving_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isDrivingToggle = true;
                        isDrivingBoth = true;
                        isDrivingFront = false;
                        isDrivingBack = false;
                        break;
                      } else if (docdetail![i].udType! == "drivinglicense" &&
                          docdetail![i].udDoctype == "front") {
                        driving_front_id = docdetail![i].udId!;
                        driving_front_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isDrivingToggle = false;
                        isDrivingBoth = false;
                        isDrivingFront = true;
                        isDrivingBack = true;
                      } else if (docdetail![i].udType! == "drivinglicense" &&
                          docdetail![i].udDoctype == "back") {
                        driving_back_id = docdetail![i].udId!;
                        driving_back_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isDrivingToggle = false;
                        isDrivingBoth = false;
                        isDrivingFront = true;
                        isDrivingBack = true;
                      }
                    } else if (isRentalCard) {
                      if (docdetail![i].udType! == "rental" &&
                          docdetail![i].udDoctype == "all") {
                        rental_all_id = docdetail![i].udId!;
                        rental_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isRentalToggle = true;
                        isRentalBoth = true;
                        isRentalFront = false;
                        isRentalBack = false;
                        break;
                      } else if (docdetail![i].udType! == "rental" &&
                          docdetail![i].udDoctype == "front") {
                        rental_front_id = docdetail![i].udId!;
                        rental_front_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isRentalToggle = false;
                        isRentalBoth = false;
                        isRentalFront = true;
                        isRentalBack = true;
                      } else if (docdetail![i].udType! == "rental" &&
                          docdetail![i].udDoctype == "back") {
                        rental_back_id = docdetail![i].udId!;
                        rental_back_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isRentalToggle = false;
                        isRentalBoth = false;
                        isRentalFront = true;
                        isRentalBack = true;
                      }
                    } else if (isHRCard) {
                      if (docdetail![i].udType! == "companyletter" &&
                          docdetail![i].udDoctype == "all") {
                        company_all_id = docdetail![i].udId!;
                        company_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHRToggle = true;
                        isHRBoth = true;
                        isHRFront = false;
                        isHRBack = false;
                        break;
                      } else if (docdetail![i].udType! == "companyletter" &&
                          docdetail![i].udDoctype == "first") {
                        company_first_id = docdetail![i].udId!;
                        company_first_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHRToggle = false;
                        isHRBoth = false;
                        isHRFront = true;
                        isHRBack = true;
                      } else if (docdetail![i].udType! == "companyletter" &&
                          docdetail![i].udDoctype == "second") {
                        company_second_id = docdetail![i].udId!;
                        company_second_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHRToggle = false;
                        isHRBoth = false;
                        isHRFront = true;
                        isHRBack = true;
                      }
                    } else if (isHouseCard) {
                      if (docdetail![i].udType! == "housepurchase" &&
                          docdetail![i].udDoctype == "all") {
                        house_all_id = docdetail![i].udId!;
                        house_all_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHouseToggle = true;
                        isHouseBoth = true;
                        isHouseFront = false;
                        isHouseBack = false;
                        break;
                      } else if (docdetail![i].udType! == "housepurchase" &&
                          docdetail![i].udDoctype == "first") {
                        house_first_id = docdetail![i].udId!;
                        house_first_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHouseToggle = false;
                        isHouseBoth = false;
                        isHouseFront = true;
                        isHouseBack = true;
                      } else if (docdetail![i].udType! == "housepurchase" &&
                          docdetail![i].udDoctype == "second") {
                        house_second_id = docdetail![i].udId!;
                        house_second_url = base_url +
                            "/" +
                            docdetail![i].udUserid! +
                            "/" +
                            docdetail![i].udDocumentname!;
                        isHouseToggle = false;
                        isHouseBoth = false;
                        isHouseFront = true;
                        isHouseBack = true;
                      }
                    }
                  }
                }
              }),
            }
        });
    setState(() {
      if (widget.title == "Aadhar Card") {
        isAadharCard = true;
        isAadharFront = true;
        isAadharBack = true;
      } else if (widget.title == "Utility Bill") {
        isUtilityBill = true;
        isShow2Utility = true;
      } else if (widget.title == "Telephone Bill") {
        isTelephoneBill = true;
        isShow2Telephone = true;
      } else if (widget.title == "Passport") {
        isPassportCard = true;
        isPassportFront = true;
        isPassportBack = true;
      } else if (widget.title == "Voter ID") {
        isVoterCard = true;
        isVoterFront = true;
        isVoterBack = true;
      } else if (widget.title == "Driving License") {
        isDrivingCard = true;
        isDrivingFront = true;
        isDrivingBack = true;
      } else if (widget.title == "Rental Agreement") {
        isRentalCard = true;
        isRentalFront = true;
        isRentalBack = true;
      } else if (widget.title == "Company HR Letter") {
        isHRCard = true;
        isHRFront = true;
        isHRBack = true;
      } else if (widget.title == "House Purchase Agreement Letter") {
        isHouseCard = true;
        isHouseFront = true;
        isHouseBack = true;
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
        backgroundColor:kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: Text(
            widget.title,
            style: const TextStyle(color: kWhite),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: kWhite,
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
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
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
                                    child: aadhar_front_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              aadhar_front_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (aadhar_front_path == null ||
                                                    aadhar_front_path
                                                        .isEmpty) &&
                                                aadhar_front_url.isNotEmpty
                                            ? aadhar_front_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              aadhar_front_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              aadhar_front_url,
                                                              aadhar_front_file));
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
                                                          aadhar_front_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                                    child: aadhar_back_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              aadhar_back_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (aadhar_back_path == null ||
                                                    aadhar_back_path.isEmpty) &&
                                                aadhar_back_url.isNotEmpty
                                            ? aadhar_back_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  aadhar_back_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  aadhar_back_url,
                                                                  aadhar_back_file));
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
                                                          aadhar_back_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                visible: isUtilityBill,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload last 3 months bills in a single document",
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
                              value: isUtilityToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isUtilityToggle = val;
                                  if (isUtilityToggle) {
                                    isUtilityInOne = true;
                                    isShow2Utility = false;
                                  } else {
                                    isUtilityInOne = false;
                                    isShow2Utility = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isShow2Utility,
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
                                        child: utility_first_path != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  utility_first_path,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : (utility_first_path == null ||
                                                        utility_first_path
                                                            .isEmpty) &&
                                                    utility_first_url.isNotEmpty
                                                ? utility_first_url
                                                        .contains(".pdf")
                                                    ? InkWell(
                                                        onTap: () {
                                                          Route route = MaterialPageRoute(
                                                              builder: (context) => PdfViewerScreen(
                                                                  utility_first_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  utility_first_url,
                                                                  utility_first_file));
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
                                                              utility_first_url),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: const Icon(
                                                      CupertinoIcons.home,
                                                      color: navyBlueColor,
                                                      size: 40.0,
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
                                            context, "utility_first_image");
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
                                          child: utility_second_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    utility_second_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (utility_second_path == null ||
                                                          utility_second_path
                                                              .isEmpty) &&
                                                      utility_second_url
                                                          .isNotEmpty
                                                  ? utility_second_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    utility_second_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    utility_second_url,
                                                                    utility_second_file));
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
                                                                utility_second_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Icon(
                                                        CupertinoIcons.home,
                                                        color:
                                                            navyBlueColor,
                                                        size: 40.0,
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
                                          _showPicker(
                                              context, "utility_second_image");
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
                                          child: utility_third_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    utility_third_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (utility_third_path == null ||
                                                          utility_third_path
                                                              .isEmpty) &&
                                                      utility_third_url
                                                          .isNotEmpty
                                                  ? utility_third_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    utility_third_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    utility_third_url,
                                                                    utility_third_file));
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
                                                                utility_third_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Icon(
                                                        CupertinoIcons.home,
                                                        color:
                                                            navyBlueColor,
                                                        size: 40.0,
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
                                              context, "utility_third_image");
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
                      visible: isUtilityInOne,
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
                                    child: utility_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              utility_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (utility_all_path == null ||
                                                    utility_all_path.isEmpty) &&
                                                utility_all_url.isNotEmpty
                                            ? utility_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  utility_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  utility_all_url,
                                                                  utility_all_file));
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
                                                          utility_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bills",
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
                                    _showPicker(context, "utility_all_image");
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
                visible: isTelephoneBill,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload last 3 months bills in a single document",
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
                              value: isTelephoneToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isTelephoneToggle = val;
                                  if (isTelephoneToggle) {
                                    isTelephoneInOne = true;
                                    isShow2Telephone = false;
                                  } else {
                                    isTelephoneInOne = false;
                                    isShow2Telephone = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isShow2Telephone,
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
                                        child: tele_first_path != null
                                            ? ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: Image.file(
                                                  tele_first_path,
                                                  width: 50.0,
                                                  height: 50.0,
                                                  fit: BoxFit.cover,
                                                ),
                                              )
                                            : (tele_first_path == null ||
                                                        tele_first_path
                                                            .isEmpty) &&
                                                    tele_first_url.isNotEmpty
                                                ? tele_first_url
                                                        .contains(".pdf")
                                                    ? InkWell(
                                                        onTap: () {
                                                          Route route = MaterialPageRoute(
                                                              builder: (context) => PdfViewerScreen(
                                                                  tele_first_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  tele_first_url,
                                                                  tele_first_file));
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
                                                              tele_first_url),
                                                          width: 50.0,
                                                          height: 50.0,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      )
                                                : ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                    child: const Icon(
                                                      CupertinoIcons.home,
                                                      color: navyBlueColor,
                                                      size: 40.0,
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
                                            context, "tele_first_image");
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
                                          child: tele_second_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    tele_second_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (tele_second_path == null ||
                                                          tele_second_path
                                                              .isEmpty) &&
                                                      tele_second_url.isNotEmpty
                                                  ? tele_second_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    tele_second_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    tele_second_url,
                                                                    tele_second_file));
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
                                                                tele_second_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Icon(
                                                        CupertinoIcons.home,
                                                        color:
                                                            navyBlueColor,
                                                        size: 40.0,
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
                                          _showPicker(
                                              context, "tele_second_image");
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
                                          child: tele_third_path != null
                                              ? ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                  child: Image.file(
                                                    tele_third_path,
                                                    width: 50.0,
                                                    height: 50.0,
                                                    fit: BoxFit.cover,
                                                  ),
                                                )
                                              : (tele_third_path == null ||
                                                          tele_third_path
                                                              .isEmpty) &&
                                                      tele_third_url.isNotEmpty
                                                  ? tele_third_url
                                                          .contains(".pdf")
                                                      ? InkWell(
                                                          onTap: () {
                                                            Route route = MaterialPageRoute(
                                                                builder: (context) => PdfViewerScreen(
                                                                    tele_third_url
                                                                            .contains("http")
                                                                        ? true
                                                                        : false,
                                                                    tele_third_url,
                                                                    tele_third_file));
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
                                                                tele_third_url),
                                                            width: 50.0,
                                                            height: 50.0,
                                                            fit: BoxFit.fill,
                                                          ),
                                                        )
                                                  : ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: const Icon(
                                                        CupertinoIcons.home,
                                                        color:
                                                            navyBlueColor,
                                                        size: 40.0,
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
                                              context, "tele_third_image");
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
                      visible: isTelephoneInOne,
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
                                    child: tele_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              tele_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (tele_all_path == null ||
                                                    tele_all_path.isEmpty) &&
                                                tele_all_url.isNotEmpty
                                            ? tele_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  tele_all_url.contains(
                                                                          "http")
                                                                      ? true
                                                                      : false,
                                                                  tele_all_url,
                                                                  tele_all_file));
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
                                                          tele_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Last 3 months bills",
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
                                    _showPicker(context, "tele_all_image");
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
                visible: isPassportCard,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: width * 0.80,
                          child: const Text(
                            "Upload single document with first and last pages",
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
                              value: isPassportToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isPassportToggle = val;
                                  if (isPassportToggle) {
                                    isPassportBoth = true;
                                    isPassportFront = false;
                                    isPassportBack = false;
                                  } else {
                                    isPassportBoth = false;
                                    isPassportFront = true;
                                    isPassportBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isPassportBoth,
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
                                    child: passport_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              passport_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (passport_all_path == null ||
                                                    passport_all_path
                                                        .isEmpty) &&
                                                passport_all_url.isNotEmpty
                                            ? passport_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              passport_all_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              passport_all_url,
                                                              passport_all_file));
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
                                                          passport_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First and last pages",
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
                                    _showPicker(context, "passport_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isPassportFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5778,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: passport_first_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              passport_first_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (passport_first_path == null ||
                                                    passport_first_path
                                                        .isEmpty) &&
                                                passport_first_url.isNotEmpty
                                            ? passport_first_url
                                                    .contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              passport_first_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              passport_first_url,
                                                              passport_first_file));
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
                                                          passport_first_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Passport first page",
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
                              width: width * 0.3666,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(
                                        context, "passport_first_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isPassportBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.5723,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: passport_last_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              passport_last_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (passport_last_path == null ||
                                                    passport_last_path
                                                        .isEmpty) &&
                                                passport_last_url.isNotEmpty
                                            ? passport_last_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              passport_last_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              passport_last_url,
                                                              passport_last_file));
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
                                                          passport_last_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Passport last page",
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
                              width: width * 0.3721,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "passport_last_image");
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
                visible: isVoterCard,
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
                              value: isVoterToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isVoterToggle = val;
                                  if (isVoterToggle) {
                                    isVoterBoth = true;
                                    isVoterFront = false;
                                    isVoterBack = false;
                                  } else {
                                    isVoterBoth = false;
                                    isVoterFront = true;
                                    isVoterBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isVoterBoth,
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
                                    child: voter_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              voter_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (voter_all_path == null ||
                                                    voter_all_path.isEmpty) &&
                                                voter_all_url.isNotEmpty
                                            ? voter_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  voter_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  voter_all_url,
                                                                  voter_all_file));
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
                                                          voter_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
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
                                    _showPicker(context, "voter_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVoterFront,
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
                                    child: voter_front_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              voter_front_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (voter_front_path == null ||
                                                    voter_front_path.isEmpty) &&
                                                voter_front_url.isNotEmpty
                                            ? voter_front_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  voter_front_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  voter_front_url,
                                                                  voter_front_file));
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
                                                          voter_front_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Voter ID front side",
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
                                    _showPicker(context, "voter_front_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isVoterBack,
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
                                    child: voter_last_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              voter_last_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (voter_last_path == null ||
                                                    voter_last_path.isEmpty) &&
                                                voter_last_url.isNotEmpty
                                            ? voter_last_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  voter_last_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  voter_last_url,
                                                                  voter_last_file));
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
                                                          voter_last_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Voter ID back side",
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
                                    _showPicker(context, "voter_last_image");
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
                visible: isDrivingCard,
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
                              value: isDrivingToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isDrivingToggle = val;
                                  if (isDrivingToggle) {
                                    isDrivingBoth = true;
                                    isDrivingFront = false;
                                    isDrivingBack = false;
                                  } else {
                                    isDrivingBoth = false;
                                    isDrivingFront = true;
                                    isDrivingBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isDrivingBoth,
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
                                    child: driving_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              driving_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (driving_all_path == null ||
                                                    driving_all_path.isEmpty) &&
                                                driving_all_url.isNotEmpty
                                            ? driving_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  driving_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  driving_all_url,
                                                                  driving_all_file));
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
                                                          driving_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
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
                                    _showPicker(context, "driving_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isDrivingFront,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7167,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: driving_front_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              driving_front_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (driving_front_path == null ||
                                                    driving_front_path
                                                        .isEmpty) &&
                                                driving_front_url.isNotEmpty
                                            ? driving_front_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              driving_front_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              driving_front_url,
                                                              driving_front_file));
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
                                                          driving_front_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Driving License front side",
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
                              width: width * 0.2277,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "driving_front_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isDrivingBack,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.7167,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: driving_back_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              driving_back_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (driving_back_path == null ||
                                                    driving_back_path
                                                        .isEmpty) &&
                                                driving_back_url.isNotEmpty
                                            ? driving_back_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              driving_back_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              driving_back_url,
                                                              driving_back_file));
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
                                                          driving_back_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "Driving License back side",
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
                              width: width * 0.2277,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "driving_back_image");
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
                visible: isRentalCard,
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
                              value: isRentalToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isRentalToggle = val;
                                  if (isRentalToggle) {
                                    isRentalBoth = true;
                                    isRentalFront = false;
                                    isRentalBack = false;
                                  } else {
                                    isRentalBoth = false;
                                    isRentalFront = true;
                                    isRentalBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isRentalBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: rental_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              rental_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (rental_all_path == null ||
                                                    rental_all_path.isEmpty) &&
                                                rental_all_url.isNotEmpty
                                            ? rental_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  rental_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  rental_all_url,
                                                                  rental_all_file));
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
                                                          rental_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "All Pages of your rental agreement",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: navyBlueColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "rental_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isRentalFront,
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
                                    child: rental_front_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              rental_front_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (rental_front_path == null ||
                                                    rental_front_path
                                                        .isEmpty) &&
                                                rental_front_url.isNotEmpty
                                            ? rental_front_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              rental_front_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              rental_front_url,
                                                              rental_front_file));
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
                                                          rental_front_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                                    _showPicker(context, "rental_front_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isRentalBack,
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
                                    child: rental_back_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              rental_back_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (rental_back_path == null ||
                                                    rental_back_path.isEmpty) &&
                                                rental_back_url.isNotEmpty
                                            ? rental_back_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  rental_back_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  rental_back_url,
                                                                  rental_back_file));
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
                                                          rental_back_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                              width: width * 0.3777,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "rental_back_image");
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
                visible: isHRCard,
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
                              value: isHRToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isHRToggle = val;
                                  if (isHRToggle) {
                                    isHRBoth = true;
                                    isHRFront = false;
                                    isHRBack = false;
                                  } else {
                                    isHRBoth = false;
                                    isHRFront = true;
                                    isHRBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isHRBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: company_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              company_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (company_all_path == null ||
                                                    company_all_path.isEmpty) &&
                                                company_all_url.isNotEmpty
                                            ? company_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  company_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  company_all_url,
                                                                  company_all_file));
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
                                                          company_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "All pages of your company HR letter",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: navyBlueColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "company_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isHRFront,
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
                                    child: company_first_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              company_first_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (company_first_path == null ||
                                                    company_first_path
                                                        .isEmpty) &&
                                                company_first_url.isNotEmpty
                                            ? company_first_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              company_first_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              company_first_url,
                                                              company_first_file));
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
                                                          company_first_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                                    _showPicker(context, "company_first_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isHRBack,
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
                                    child: company_second_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              company_second_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (company_second_path == null ||
                                                    company_second_path
                                                        .isEmpty) &&
                                                company_second_url.isNotEmpty
                                            ? company_second_url
                                                    .contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              company_second_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              company_second_url,
                                                              company_second_file));
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
                                                          company_second_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                              width: width * 0.3777,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(
                                        context, "company_second_image");
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
                visible: isHouseCard,
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
                              value: isHouseToggle,
                              borderRadius: 15.0,
                              onToggle: (val) {
                                setState(() {
                                  isHouseToggle = val;
                                  if (isHouseToggle) {
                                    isHouseBoth = true;
                                    isHouseFront = false;
                                    isHouseBack = false;
                                  } else {
                                    isHouseBoth = false;
                                    isHouseFront = true;
                                    isHouseBack = true;
                                  }
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: isHouseBoth,
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              width: width * 0.654,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  ClipRect(
                                    child: house_all_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              house_all_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (house_all_path == null ||
                                                    house_all_path.isEmpty) &&
                                                house_all_url.isNotEmpty
                                            ? house_all_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  house_all_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  house_all_url,
                                                                  house_all_file));
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
                                                          house_all_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: SizedBox(
                                      width: width * 0.50,
                                      child: const Text(
                                        "House purchase agreement letter",
                                        textAlign: TextAlign.left,
                                        overflow: TextOverflow.ellipsis,
                                        maxLines: 2,
                                        style: TextStyle(
                                          color: navyBlueColor,
                                          fontSize: 18.0,
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: width * 0.2904,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "house_all_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isHouseFront,
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
                                    child: house_first_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              house_first_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (house_first_path == null ||
                                                    house_first_path.isEmpty) &&
                                                house_first_url.isNotEmpty
                                            ? house_first_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) =>
                                                              PdfViewerScreen(
                                                                  house_first_url
                                                                          .contains(
                                                                              "http")
                                                                      ? true
                                                                      : false,
                                                                  house_first_url,
                                                                  house_first_file));
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
                                                          house_first_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
                                    child: const Text(
                                      "First Page",
                                      style: TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
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
                                    _showPicker(context, "house_first_image");
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: isHouseBack,
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
                                    child: house_second_path != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.file(
                                              house_second_path,
                                              width: 50.0,
                                              height: 50.0,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : (house_second_path == null ||
                                                    house_second_path
                                                        .isEmpty) &&
                                                house_second_url.isNotEmpty
                                            ? house_second_url.contains(".pdf")
                                                ? InkWell(
                                                    onTap: () {
                                                      Route route = MaterialPageRoute(
                                                          builder: (context) => PdfViewerScreen(
                                                              house_second_url
                                                                      .contains(
                                                                          "http")
                                                                  ? true
                                                                  : false,
                                                              house_second_url,
                                                              house_second_file));
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
                                                          house_second_url),
                                                      width: 50.0,
                                                      height: 50.0,
                                                      fit: BoxFit.fill,
                                                    ),
                                                  )
                                            : ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8.0),
                                                child: const Icon(
                                                  CupertinoIcons.home,
                                                  color: navyBlueColor,
                                                  size: 40.0,
                                                ),
                                              ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(left: 15.0),
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
                              width: width * 0.3777,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: IconButton(
                                  icon: const Icon(Icons.add),
                                  iconSize: 30.0,
                                  color: navyBlueColor,
                                  onPressed: () {
                                    _showPicker(context, "house_second_image");
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

  void _showPicker(context, String which_image) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Wrap(
              children: <Widget>[
                ListTile(
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
                        if (which_image == "aadhar_both_image") {
                          setState(() {
                            aadhar_both_path = null;
                            aadhar_both_url = file.path;
                            aadhar_both_file = file;
                          });
                          uploadFile(
                              aadhar_both_id, file, "adhar", "all", context);
                        } else if (which_image == "aadhar_front_image") {
                          setState(() {
                            aadhar_front_path = null;
                            aadhar_front_url = file.path;
                            aadhar_front_file = file;
                          });
                          uploadFile(
                              aadhar_front_id, file, "adhar", "front", context);
                        } else if (which_image == "aadhar_back_image") {
                          setState(() {
                            aadhar_back_path = null;
                            aadhar_back_url = file.path;
                            aadhar_back_file = file;
                          });
                          uploadFile(
                              aadhar_back_id, file, "adhar", "back", context);
                        } else if (which_image == "utility_first_image") {
                          setState(() {
                            utility_first_path = null;
                            utility_first_url = file.path;
                            utility_first_file = file;
                          });
                          uploadFile(utility_first_id, file, "utility", "first",
                              context);
                        } else if (which_image == "utility_second_image") {
                          setState(() {
                            utility_second_path = null;
                            utility_second_url = file.path;
                            utility_second_file = file;
                          });
                          uploadFile(utility_second_id, file, "utility",
                              "second", context);
                        } else if (which_image == "utility_third_image") {
                          setState(() {
                            utility_third_path = null;
                            utility_third_url = file.path;
                            utility_third_file = file;
                          });
                          uploadFile(utility_third_id, file, "utility", "third",
                              context);
                        } else if (which_image == "utility_all_image") {
                          setState(() {
                            utility_all_path = null;
                            utility_all_url = file.path;
                            utility_all_file = file;
                          });
                          uploadFile(
                              utility_all_id, file, "utility", "all", context);
                        } else if (which_image == "tele_first_image") {
                          setState(() {
                            tele_first_path = null;
                            tele_first_url = file.path;
                            tele_first_file = file;
                          });
                          uploadFile(tele_first_id, file, "telephone", "first",
                              context);
                        } else if (which_image == "tele_second_image") {
                          setState(() {
                            tele_second_path = null;
                            tele_second_url = file.path;
                            tele_second_file = file;
                          });
                          uploadFile(tele_second_id, file, "telephone",
                              "second", context);
                        } else if (which_image == "tele_third_image") {
                          setState(() {
                            tele_third_path = null;
                            tele_third_url = file.path;
                            tele_third_file = file;
                          });
                          uploadFile(aadhar_both_id, file, "telephone", "third",
                              context);
                        } else if (which_image == "tele_all_image") {
                          setState(() {
                            tele_all_path = null;
                            tele_all_url = file.path;
                            tele_all_file = file;
                          });
                          uploadFile(
                              tele_all_id, file, "telephone", "all", context);
                        } else if (which_image == "passport_all_image") {
                          setState(() {
                            passport_all_path = null;
                            passport_all_url = file.path;
                            passport_all_file = file;
                          });
                          uploadFile(passport_all_id, file, "passport", "all",
                              context);
                        } else if (which_image == "passport_first_image") {
                          setState(() {
                            passport_first_path = null;
                            passport_first_url = file.path;
                            passport_first_file = file;
                          });
                          uploadFile(passport_first_id, file, "passport",
                              "first", context);
                        } else if (which_image == "passport_last_image") {
                          setState(() {
                            passport_last_path = null;
                            passport_last_url = file.path;
                            passport_last_file = file;
                          });
                          uploadFile(passport_last_id, file, "passport", "last",
                              context);
                        } else if (which_image == "voter_all_image") {
                          setState(() {
                            voter_all_path = null;
                            voter_all_url = file.path;
                            voter_all_file = file;
                          });
                          uploadFile(
                              voter_all_id, file, "voter", "all", context);
                        } else if (which_image == "voter_front_image") {
                          setState(() {
                            voter_front_path = null;
                            voter_front_url = file.path;
                            voter_front_file = file;
                          });
                          uploadFile(
                              voter_front_id, file, "voter", "front", context);
                        } else if (which_image == "voter_last_image") {
                          setState(() {
                            voter_last_path = null;
                            voter_last_url = file.path;
                            voter_last_file = file;
                          });
                          uploadFile(
                              voter_last_id, file, "voter", "last", context);
                        } else if (which_image == "driving_all_image") {
                          setState(() {
                            driving_all_path = null;
                            driving_all_url = file.path;
                            driving_all_file = file;
                          });
                          uploadFile(driving_all_id, file, "drivinglicense",
                              "all", context);
                        } else if (which_image == "driving_front_image") {
                          setState(() {
                            driving_front_path = null;
                            driving_front_url = file.path;
                            driving_front_file = file;
                          });
                          uploadFile(driving_front_id, file, "drivinglicense",
                              "front", context);
                        } else if (which_image == "driving_back_image") {
                          setState(() {
                            driving_back_path = null;
                            driving_back_url = file.path;
                            driving_back_file = file;
                          });
                          uploadFile(driving_back_id, file, "drivinglicense",
                              "back", context);
                        } else if (which_image == "rental_all_image") {
                          setState(() {
                            rental_all_path = null;
                            rental_all_url = file.path;
                            rental_all_file = file;
                          });
                          uploadFile(
                              rental_all_id, file, "rental", "all", context);
                        } else if (which_image == "rental_front_image") {
                          setState(() {
                            rental_front_path = null;
                            rental_front_url = file.path;
                            rental_front_file = file;
                          });
                          uploadFile(rental_front_id, file, "rental", "front",
                              context);
                        } else if (which_image == "rental_back_image") {
                          setState(() {
                            rental_back_path = null;
                            rental_back_url = file.path;
                            rental_back_file = file;
                          });
                          uploadFile(
                              rental_back_id, file, "rental", "back", context);
                        } else if (which_image == "company_all_image") {
                          setState(() {
                            company_all_path = null;
                            company_all_url = file.path;
                            company_all_file = file;
                          });
                          uploadFile(company_all_id, file, "companyletter",
                              "all", context);
                        } else if (which_image == "company_first_image") {
                          setState(() {
                            company_first_path = null;
                            company_first_url = file.path;
                            company_first_file = file;
                          });
                          uploadFile(company_first_id, file, "companyletter",
                              "first", context);
                        } else if (which_image == "company_second_image") {
                          setState(() {
                            company_second_path = null;
                            company_second_url = file.path;
                            company_second_file = file;
                          });
                          uploadFile(company_second_id, file, "companyletter",
                              "second", context);
                        } else if (which_image == "house_all_image") {
                          setState(() {
                            house_all_path = null;
                            house_all_url = file.path;
                            house_all_file = file;
                          });
                          uploadFile(house_all_id, file, "housepurchase", "all",
                              context);
                        } else if (which_image == "house_first_image") {
                          setState(() {
                            house_first_path = null;
                            house_first_url = file.path;
                            house_first_file = file;
                          });
                          uploadFile(house_first_id, file, "housepurchase",
                              "first", context);
                        } else if (which_image == "house_second_image") {
                          setState(() {
                            house_second_path = null;
                            house_second_url = file.path;
                            house_second_file = file;
                          });
                          uploadFile(house_second_id, file, "housepurchase",
                              "second", context);
                        }
                        print(file.path);
                      } else {
                        // User canceled the picker
                      }
                      Navigator.of(context).pop();
                    }),
                ListTile(
                    leading: const Icon(Icons.photo_library),
                    title: const Text('Photo Library'),
                    onTap: () {
                      _imgFromGallery(which_image, context);
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

  _imgFromGallery(String which_image, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
        uploadFile(aadhar_both_id, aadhar_both_path, "adhar", "all", context);
      } else if (which_image == "aadhar_front_image") {
        aadhar_front_path = image == null ? null : File(image.path);
        uploadFile(
            aadhar_front_id, aadhar_front_path, "adhar", "front", context);
      } else if (which_image == "aadhar_back_image") {
        aadhar_back_path = image == null ? null : File(image.path);
        uploadFile(aadhar_back_id, aadhar_back_path, "adhar", "back", context);
      } else if (which_image == "utility_first_image") {
        utility_first_path = image == null ? null : File(image.path);
        uploadFile(
            utility_first_id, utility_first_path, "utility", "first", context);
      } else if (which_image == "utility_second_image") {
        utility_second_path = image == null ? null : File(image.path);
        uploadFile(utility_second_id, utility_second_path, "utility", "second",
            context);
      } else if (which_image == "utility_third_image") {
        utility_third_path = image == null ? null : File(image.path);
        uploadFile(
            utility_third_id, utility_third_path, "utility", "third", context);
      } else if (which_image == "utility_all_image") {
        utility_all_path = image == null ? null : File(image.path);
        uploadFile(utility_all_id, utility_all_path, "utility", "all", context);
      } else if (which_image == "tele_first_image") {
        tele_first_path = image == null ? null : File(image.path);
        uploadFile(
            tele_first_id, tele_first_path, "telephone", "first", context);
      } else if (which_image == "tele_second_image") {
        tele_second_path = image == null ? null : File(image.path);
        uploadFile(
            tele_second_id, tele_second_path, "telephone", "second", context);
      } else if (which_image == "tele_third_image") {
        tele_third_path = image == null ? null : File(image.path);
        uploadFile(
            aadhar_both_id, tele_third_path, "telephone", "third", context);
      } else if (which_image == "tele_all_image") {
        tele_all_path = image == null ? null : File(image.path);
        uploadFile(tele_all_id, tele_all_path, "telephone", "all", context);
      } else if (which_image == "passport_all_image") {
        passport_all_path = image == null ? null : File(image.path);
        uploadFile(
            passport_all_id, passport_all_path, "passport", "all", context);
      } else if (which_image == "passport_first_image") {
        passport_first_path = image == null ? null : File(image.path);
        uploadFile(passport_first_id, passport_first_path, "passport", "first",
            context);
      } else if (which_image == "passport_last_image") {
        passport_last_path = image == null ? null : File(image.path);
        uploadFile(
            passport_last_id, passport_last_path, "passport", "last", context);
      } else if (which_image == "voter_all_image") {
        voter_all_path = image == null ? null : File(image.path);
        uploadFile(voter_all_id, voter_all_path, "voter", "all", context);
      } else if (which_image == "voter_front_image") {
        voter_front_path = image == null ? null : File(image.path);
        uploadFile(voter_front_id, voter_front_path, "voter", "front", context);
      } else if (which_image == "voter_last_image") {
        voter_last_path = image == null ? null : File(image.path);
        uploadFile(voter_last_id, voter_last_path, "voter", "last", context);
      } else if (which_image == "driving_all_image") {
        driving_all_path = image == null ? null : File(image.path);
        uploadFile(
            driving_all_id, driving_all_path, "drivinglicense", "all", context);
      } else if (which_image == "driving_front_image") {
        driving_front_path = image == null ? null : File(image.path);
        uploadFile(driving_front_id, driving_front_path, "drivinglicense",
            "front", context);
      } else if (which_image == "driving_back_image") {
        driving_back_path = image == null ? null : File(image.path);
        uploadFile(driving_back_id, driving_back_path, "drivinglicense", "back",
            context);
      } else if (which_image == "rental_all_image") {
        rental_all_path = image == null ? null : File(image.path);
        uploadFile(rental_all_id, rental_all_path, "rental", "all", context);
      } else if (which_image == "rental_front_image") {
        rental_front_path = image == null ? null : File(image.path);
        uploadFile(
            rental_front_id, rental_front_path, "rental", "front", context);
      } else if (which_image == "rental_back_image") {
        rental_back_path = image == null ? null : File(image.path);
        uploadFile(rental_back_id, rental_back_path, "rental", "back", context);
      } else if (which_image == "company_all_image") {
        company_all_path = image == null ? null : File(image.path);
        uploadFile(
            company_all_id, company_all_path, "companyletter", "all", context);
      } else if (which_image == "company_first_image") {
        company_first_path = image == null ? null : File(image.path);
        uploadFile(company_first_id, company_first_path, "companyletter",
            "first", context);
      } else if (which_image == "company_second_image") {
        company_second_path = image == null ? null : File(image.path);
        uploadFile(company_second_id, company_second_path, "companyletter",
            "second", context);
      } else if (which_image == "house_all_image") {
        house_all_path = image == null ? null : File(image.path);
        uploadFile(
            house_all_id, house_all_path, "housepurchase", "all", context);
      } else if (which_image == "house_first_image") {
        house_first_path = image == null ? null : File(image.path);
        uploadFile(house_first_id, house_first_path, "housepurchase", "first",
            context);
      } else if (which_image == "house_second_image") {
        house_second_path = image == null ? null : File(image.path);
        uploadFile(house_second_id, house_second_path, "housepurchase",
            "second", context);
      }
    });
  }

  _imgFromCamera(String which_image, BuildContext context) async {
    final ImagePicker _picker = ImagePicker();
    XFile? image =
        await _picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      if (which_image == "aadhar_both_image") {
        aadhar_both_path = image == null ? null : File(image.path);
        uploadFile(aadhar_both_id, aadhar_both_path, "adhar", "all", context);
      } else if (which_image == "aadhar_front_image") {
        aadhar_front_path = image == null ? null : File(image.path);
        uploadFile(
            aadhar_front_id, aadhar_front_path, "adhar", "front", context);
      } else if (which_image == "aadhar_back_image") {
        aadhar_back_path = image == null ? null : File(image.path);
        uploadFile(aadhar_back_id, aadhar_back_path, "adhar", "back", context);
      } else if (which_image == "utility_first_image") {
        utility_first_path = image == null ? null : File(image.path);
        uploadFile(
            utility_first_id, utility_first_path, "utility", "first", context);
      } else if (which_image == "utility_second_image") {
        utility_second_path = image == null ? null : File(image.path);
        uploadFile(utility_second_id, utility_second_path, "utility", "second",
            context);
      } else if (which_image == "utility_third_image") {
        utility_third_path = image == null ? null : File(image.path);
        uploadFile(
            utility_third_id, utility_third_path, "utility", "third", context);
      } else if (which_image == "utility_all_image") {
        utility_all_path = image == null ? null : File(image.path);
        uploadFile(utility_all_id, utility_all_path, "utility", "all", context);
      } else if (which_image == "tele_first_image") {
        tele_first_path = image == null ? null : File(image.path);
        uploadFile(
            tele_first_id, tele_first_path, "telephone", "first", context);
      } else if (which_image == "tele_second_image") {
        tele_second_path = image == null ? null : File(image.path);
        uploadFile(
            tele_second_id, tele_second_path, "telephone", "second", context);
      } else if (which_image == "tele_third_image") {
        tele_third_path = image == null ? null : File(image.path);
        uploadFile(
            aadhar_both_id, tele_third_path, "telephone", "third", context);
      } else if (which_image == "tele_all_image") {
        tele_all_path = image == null ? null : File(image.path);
        uploadFile(tele_all_id, tele_all_path, "telephone", "all", context);
      } else if (which_image == "passport_all_image") {
        passport_all_path = image == null ? null : File(image.path);
        uploadFile(
            passport_all_id, passport_all_path, "passport", "all", context);
      } else if (which_image == "passport_first_image") {
        passport_first_path = image == null ? null : File(image.path);
        uploadFile(passport_first_id, passport_first_path, "passport", "first",
            context);
      } else if (which_image == "passport_last_image") {
        passport_last_path = image == null ? null : File(image.path);
        uploadFile(
            passport_last_id, passport_last_path, "passport", "last", context);
      } else if (which_image == "voter_all_image") {
        voter_all_path = image == null ? null : File(image.path);
        uploadFile(voter_all_id, voter_all_path, "voter", "all", context);
      } else if (which_image == "voter_front_image") {
        voter_front_path = image == null ? null : File(image.path);
        uploadFile(voter_front_id, voter_front_path, "voter", "front", context);
      } else if (which_image == "voter_last_image") {
        voter_last_path = image == null ? null : File(image.path);
        uploadFile(voter_last_id, voter_last_path, "voter", "last", context);
      } else if (which_image == "driving_all_image") {
        driving_all_path = image == null ? null : File(image.path);
        uploadFile(
            driving_all_id, driving_all_path, "drivinglicense", "all", context);
      } else if (which_image == "driving_front_image") {
        driving_front_path = image == null ? null : File(image.path);
        uploadFile(driving_front_id, driving_front_path, "drivinglicense",
            "front", context);
      } else if (which_image == "driving_back_image") {
        driving_back_path = image == null ? null : File(image.path);
        uploadFile(driving_back_id, driving_back_path, "drivinglicense", "back",
            context);
      } else if (which_image == "rental_all_image") {
        rental_all_path = image == null ? null : File(image.path);
        uploadFile(rental_all_id, rental_all_path, "rental", "all", context);
      } else if (which_image == "rental_front_image") {
        rental_front_path = image == null ? null : File(image.path);
        uploadFile(
            rental_front_id, rental_front_path, "rental", "front", context);
      } else if (which_image == "rental_back_image") {
        rental_back_path = image == null ? null : File(image.path);
        uploadFile(rental_back_id, rental_back_path, "rental", "back", context);
      } else if (which_image == "company_all_image") {
        company_all_path = image == null ? null : File(image.path);
        uploadFile(
            company_all_id, company_all_path, "companyletter", "all", context);
      } else if (which_image == "company_first_image") {
        company_first_path = image == null ? null : File(image.path);
        uploadFile(company_first_id, company_first_path, "companyletter",
            "first", context);
      } else if (which_image == "company_second_image") {
        company_second_path = image == null ? null : File(image.path);
        uploadFile(company_second_id, company_second_path, "companyletter",
            "second", context);
      } else if (which_image == "house_all_image") {
        house_all_path = image == null ? null : File(image.path);
        uploadFile(
            house_all_id, house_all_path, "housepurchase", "all", context);
      } else if (which_image == "house_first_image") {
        house_first_path = image == null ? null : File(image.path);
        uploadFile(house_first_id, house_first_path, "housepurchase", "first",
            context);
      } else if (which_image == "house_second_image") {
        house_second_path = image == null ? null : File(image.path);
        uploadFile(house_second_id, house_second_path, "housepurchase",
            "second", context);
      }
    });
  }

  void uploadFile(
      String id, File _file, String ud_type, ud_doctype, BuildContext context) {
    _networkCall.update_proofs(id, ud_type, ud_doctype, _file, context);
  }
}
