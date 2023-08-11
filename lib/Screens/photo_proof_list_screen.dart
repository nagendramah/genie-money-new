import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Screens/photo_proof_upload_screen.dart';
import 'package:genie_money/Screens/resident_proof_list_screen.dart';
import 'package:genie_money/Utils/utils.dart';

class PhotoProofListScreen extends StatefulWidget {
  const PhotoProofListScreen({Key? key}) : super(key: key);

  @override
  _PhotoProofListScreenState createState() => _PhotoProofListScreenState();
}

class _PhotoProofListScreenState extends State<PhotoProofListScreen> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery
        .of(context)
        .size
        .width;
    double height = MediaQuery
        .of(context)
        .size
        .height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: kWhite,
        appBar: AppBar(
          backgroundColor: navyBlueColor,
          title: const Text(
            "Photo Proofs",
            style: TextStyle(
              color: kWhite,
            ),
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
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                const Text(
                  "Identity Proof",
                  style: TextStyle(
                    color: navyBlueColor,
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("Profile Photo")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/personal_details.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Profile Photo",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("PAN Card")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/photo_proofs.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "PAN Card",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("Aadhar Card")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/photo_proofs.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Aadhar Card",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("Employee ID Card")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage(
                                  "images/employement_details.png"),
                                  color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Employee ID Card",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: const Text(
                    "Financial Proof",
                    style: TextStyle(
                      color: navyBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("Salary Slip")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/bank_details.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Salary Slip",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen("Bank Statement")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/bank_details.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Bank Statement",
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PhotoProofUploadScreen(
                                    "Offer/Appointment Letter")));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Image(
                              image: AssetImage("images/bank_details.png"),
                              color: navyBlueColor,
                              width: 40.0,
                              height: 40.0,
                            ),
                            Container(
                              width: width * 0.60,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Offer/Appointment Letter",
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 30.0),
                  child: const Text(
                    "Current Residential Proof",
                    style: TextStyle(
                      color: navyBlueColor,
                      fontSize: 25.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => const ResidentProofListScreen()));
                  },
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              CupertinoIcons.home,
                              color: navyBlueColor,
                              size: 40.0,
                            ),
                            // const Image(
                            //   image: AssetImage("images/bank_details.png"),
                            //   width: 40.0,
                            //   height: 40.0,
                            // ),
                            Container(
                              width: width * 0.60,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: const Text(
                                "Current Residential Proofs",
                                textAlign: TextAlign.justify,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  color: navyBlueColor,
                                  fontSize: 18.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Visibility(
                              visible: false,
                              child: Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "",
                                  style: TextStyle(
                                    color: navyBlueColor,
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                            ),
                            const Icon(
                              CupertinoIcons.right_chevron,
                              color: navyBlueColor,
                              size: 30.0,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
