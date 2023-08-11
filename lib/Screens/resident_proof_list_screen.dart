import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:genie_money/Model/proofs_model.dart';
import 'package:genie_money/Screens/resident_proof_upload_screen.dart';
import 'package:genie_money/Utils/utils.dart';

class ResidentProofListScreen extends StatefulWidget {
  const ResidentProofListScreen({Key? key}) : super(key: key);

  @override
  _ResidentProofListScreenState createState() =>
      _ResidentProofListScreenState();
}

class _ResidentProofListScreenState extends State<ResidentProofListScreen> {
  late List<ProofsModel> prooofs_list;

  @override
  void initState() {
    prooofs_list = [
      ProofsModel("Aadhar Card", "", "Front and back side photos"),
      ProofsModel("Utility Bill", "(Electricity/Piped Gas/Water)",
          "Bills not older than 3 months"),
      ProofsModel("Telephone Bill", "(Postpaid-Mobile/Land-line)",
          "Bills not older than 3 months"),
      ProofsModel("Passport", "", "Front and last page photos"),
      ProofsModel("Voter ID", "", "Front and back side photos"),
      ProofsModel("Driving License", "", "Front and back side photos"),
      ProofsModel("Rental Agreement", "", "All pages of agreement"),
      ProofsModel("Company HR Letter", "", ""),
      ProofsModel("House Purchase Agreement Letter", "", "")
    ];
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
          backgroundColor: navyBlueColor,
          title: const Text(
            "Current Residential Proofs",
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
          child: ListView.separated(
            itemCount: prooofs_list.length,
            itemBuilder: (BuildContext context, int index) {
              if (prooofs_list[index].name.isEmpty &&
                  prooofs_list[index].title.isNotEmpty &&
                  prooofs_list[index].subtitle.isNotEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].name,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 18.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].subtitle,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                );
              } else if (prooofs_list[index].name.isEmpty &&
                  prooofs_list[index].title.isEmpty &&
                  prooofs_list[index].subtitle.isNotEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].name,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 18.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].title,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 16.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].subtitle,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                );
              } else if (prooofs_list[index].name.isEmpty &&
                  prooofs_list[index].title.isNotEmpty &&
                  prooofs_list[index].subtitle.isEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].name,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 18.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].subtitle,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 14.0,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
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
                );
              } else if (prooofs_list[index].name.isNotEmpty &&
                  prooofs_list[index].title.isEmpty &&
                  prooofs_list[index].subtitle.isNotEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].name,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].title,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 16.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].subtitle,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                );
              } else if (prooofs_list[index].name.isNotEmpty &&
                  prooofs_list[index].title.isEmpty &&
                  prooofs_list[index].subtitle.isEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].name,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].title,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 16.0,
                                  //     ),
                                  //   ),
                                  // ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].subtitle,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 14.0,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
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
                );
              } else if (prooofs_list[index].name.isNotEmpty &&
                  prooofs_list[index].title.isNotEmpty &&
                  prooofs_list[index].subtitle.isEmpty) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].name,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  // SizedBox(
                                  //   width: width * 0.70,
                                  //   child: Text(
                                  //     prooofs_list[index].subtitle,
                                  //     textAlign: TextAlign.left,
                                  //     overflow: TextOverflow.ellipsis,
                                  //     maxLines: 2,
                                  //     style: const TextStyle(
                                  //       color: Color(0xFFFFAE00),
                                  //       fontSize: 14.0,
                                  //     ),
                                  //   ),
                                  // ),
                                ],
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
                );
              } else {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ResidentUploadImage(prooofs_list[index].name)));
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
                            Container(
                              // width: width * 0.30,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].name,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].title,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 16.0,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.70,
                                    child: Text(
                                      prooofs_list[index].subtitle,
                                      textAlign: TextAlign.left,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: const TextStyle(
                                        color: navyBlueColor,
                                        fontSize: 14.0,
                                      ),
                                    ),
                                  ),
                                ],
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
                );
              }
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider(
                color: navyBlueColor,
              );
            },
          ),
        ),
      ),
    );
  }
}
