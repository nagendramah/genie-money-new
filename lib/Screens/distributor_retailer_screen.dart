import 'package:flutter/material.dart';
import 'package:genie_money/Model/app_history_model.dart';

class RetailerScreen extends StatefulWidget {
  String title, login;

  RetailerScreen(this.title, this.login, {Key? key}) : super(key: key);

  @override
  _RetailerScreenState createState() => _RetailerScreenState();
}

class _RetailerScreenState extends State<RetailerScreen> {

  late String distributorValue = "MEDICLUE SURGICAL & DISPOSABLE PVT. LTD.";
  late String retailerValue = "Infiniti Retail Ltd";

  List<String> distributorList = [
    "MEDICLUE SURGICAL & DISPOSABLE PVT. LTD.",
    "GURU KIRPA JACQUARD INDUSTRIES",
    "Koye Pharmaceuticals Pvt. Ltd.",
    "BERGER PAINTS INDIA LIMITED",
    "Mayrahkee LLP"
  ];

  bool retailerSelected = false;
  bool distributorSelected = false;

  List<String> retailerList = [
    "Infiniti Retail Ltd",
    "V-mart retail limited",
    "Trent limited",
    "Shoppers stop",
    "Aditya Birla Fashion & Retail Ltd"
  ];

  late List<AppHistoryModel> appHistoryList = [];

  @override
  void initState() {
    if (widget.login == "Retailer") {
      appHistoryList = [
        AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
            "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav"),
        AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
            "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
        AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
            "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
        AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
            "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
        AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
            "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More")
      ];
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: const Color(0xFF11111),
          appBar: AppBar(
            backgroundColor: const Color(0xFF3A3A3A),
            title: Text(widget.title, style: const TextStyle(color: Color(0xFFFFAE00),),),
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
              children: [
                Visibility(
                  visible: widget.login == "Super Distributor" ? true : false,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: const Color(0xFF3A3A3A),
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
                        label: Text("Occupation"),
                        isDense: true,
                      ),
                      value: distributorValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFFFAE00),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                      onChanged: (String? data) {
                        setState(() {
                          distributorValue = data!;
                          distributorSelected = true;
                        });
                      },
                      items: distributorList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.login == "Distributor" ? true : distributorSelected,
                  child: Container(
                    margin: const EdgeInsets.only(top: 10.0),
                    child: DropdownButtonFormField<String>(
                      dropdownColor: const Color(0xFF3A3A3A),
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
                        label: Text("Occupation"),
                        isDense: true,
                      ),
                      value: retailerValue,
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Color(0xFFFFAE00),
                      ),
                      iconSize: 24,
                      elevation: 16,
                      style: const TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                      onChanged: (String? data) {
                        setState(() {
                          retailerValue = data!;
                          if (retailerValue == "Infiniti Retail Ltd") {
                            appHistoryList = [
                              AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
                                  "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav"),
                              AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
                                  "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
                              AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
                                  "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
                              AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
                                  "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
                                  "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More")
                            ];
                          } else if(retailerValue == "V-mart retail limited") {
                            appHistoryList = [
                              AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
                                  "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
                              AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
                                  "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav"),
                              AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
                                  "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
                              AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
                                  "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
                                  "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More")
                            ];
                          } else if (retailerValue == "Trent limited") {
                            appHistoryList = [
                              AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
                                  "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
                              AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
                                  "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
                              AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
                                  "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav"),
                              AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
                                  "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
                                  "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More")
                            ];
                          } else if (retailerValue == "Shoppers stop") {
                            appHistoryList = [
                              AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
                                  "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
                                  "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
                              AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
                                  "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
                              AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
                                  "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav"),
                              AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
                                  "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More")
                            ];
                          } else if (retailerValue == "Aditya Birla Fashion & Retail Ltd") {
                            appHistoryList = [
                              AppHistoryModel("MHF9BGMO4", "5314231219", "357946857968798",
                                  "2021-12-04 08:43:32", "2022-01-11", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHB70AMK1", "6425314231", "246835794685796",
                                  "2021-12-03 09:43:32", "2022-01-10", "37 DAYS", "Arati More"),
                              AppHistoryModel("MHR85IVP2", "7531642531", "135792468357946",
                                  "2021-12-02 10:43:32", "2022-01-09", "37 DAYS", "Satyam soni"),
                              AppHistoryModel("MHP8CBG1M", "8642753164", "024681357902468",
                                  "2021-12-01 11:43:32", "2022-01-08", "37 DAYS", "Aarti Kumre"),
                              AppHistoryModel("MH2HSKYPG", "9753186427", "012345678901234",
                                  "2021-12-31 12:43:32", "2022-01-07", "7 DAYS", "Nitin Jadhav")
                            ];
                          }
                          retailerSelected = true;
                        });
                      },
                      items: retailerList.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                Visibility(
                  visible: widget.login == "Retailer" ? true : retailerSelected,
                    child: Expanded(
                      child: Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ListView.builder(
                          // padding: EdgeInsets.only(bottom: 80.0),
                          shrinkWrap: true,
                          itemCount: appHistoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Card(
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
                              child: Column(
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: const BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(10),
                                          topRight: Radius.circular(10)),
                                      color: const Color(0xFFFFAE00),
                                    ),
                                    child: Container(
                                      margin: const EdgeInsets.only(
                                          left: 10.0, right: 10.0),
                                      child: Row(
                                        mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            "Genie Moneyy",
                                            style: TextStyle(
                                              color: Color(0xFF111111),
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          IconButton(
                                            onPressed: () {},
                                            icon: Icon(Icons.share),
                                            color: Color(0xFF111111),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Row(
                                      mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          margin:
                                          const EdgeInsets.only(left: 10.0),
                                          child: Row(
                                            children: [
                                              const Text(
                                                "Code : ",
                                                style: TextStyle(
                                                  color: Color(0xFFFFAE00),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                              Text(
                                                appHistoryList[index].code,
                                                style: const TextStyle(
                                                  color: Color(0xFFFFAE00),
                                                  fontSize: 16.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {},
                                          icon: Icon(Icons.copy),
                                          color: Color(0xFFFFAE00),
                                          iconSize: 18.0,
                                        )
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Mobile No. : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].mobile_no,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "IMEI No. : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].imei,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Date Created : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].date_created,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Date Expire : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].date_expire,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0, left: 10.0, right: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Validity : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].validity,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(
                                        top: 10.0,
                                        left: 10.0,
                                        right: 10.0,
                                        bottom: 10.0),
                                    child: Row(
                                      children: [
                                        const Text(
                                          "Name : ",
                                          style: TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                        Text(
                                          appHistoryList[index].name,
                                          style: const TextStyle(
                                            color: Color(0xFFFFAE00),
                                            fontSize: 16.0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                )
              ],
            ),
          ),
        ),
    );
  }
}
