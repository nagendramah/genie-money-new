import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Model/app_history_model.dart';
import 'package:genie_money/Screens/payment_option_screen.dart';

class SalesPartnerScreen extends StatefulWidget {
  String title;

  SalesPartnerScreen(this.title);

  @override
  _SalesPartnerScreenState createState() => _SalesPartnerScreenState();
}

class _SalesPartnerScreenState extends State<SalesPartnerScreen> {
  final TextEditingController _mobile_no_controller = TextEditingController();
  final TextEditingController _search_controller = TextEditingController();

  late List<AppHistoryModel> appHistoryList = [];
  List<AppHistoryModel> dummySearchList = [];
  bool payOnlineVisibility = false;
  @override
  void initState() {
    setState(() {
      if (widget.title == "Apps History") {
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
    });

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
            widget.title,
            style: const TextStyle(color: Color(0xFFFFAE00)),
          ),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ),
        body: SafeArea(
          child: Container(
            margin: const EdgeInsets.only(top: 10.0, left: 10.0, right: 10.0),
            height: height,
            child: SizedBox(
              child: Column(
                //mainAxisAlignment: MainAxisAlignment.spaceAround,
                //mainAxisSize: MainAxisSize.min,
                children: [
                  Visibility(
                    visible: widget.title == "Generate Code" ? true : false,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: generateCodeCard(width, height),
                    ),
                  ),
                  Visibility(
                    visible: widget.title == "Apps History" ? true : false,
                    child: SizedBox(
                      height: height * 0.99,
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Container(
                            color: const Color(0xFF3A3A3A),
                            width: width,
                            child: TextField(
                              cursorColor: const Color(0xFFFFAE00),
                              keyboardType: TextInputType.name,
                              style: const TextStyle(color: Color(0xFFFFAE00)),
                              controller: _search_controller,
                              decoration: InputDecoration(
                                suffixIcon: const Icon(
                                  Icons.search,
                                  color: Color(0xFFFFAE00),
                                  size: 30.0,
                                ),
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
                                labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                                labelText: 'Search...',
                                isDense: true,
                              ),
                              onChanged: (text) {
                                filterSearchResults(text);
                              },
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: const EdgeInsets.only(top: 10.0),
                              child: ListView.builder(
                                padding: EdgeInsets.only(bottom: 80.0),
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
                                          width: width,
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget generateCodeCard(double width, double height) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(10),
          margin: EdgeInsets.only(top: 10, bottom: 10),
          decoration: BoxDecoration(
            color: Color(0xFF3A3A3A),
            borderRadius: BorderRadius.all(Radius.circular(10))
          ),
          child: Row(
            children: [
              Text(
                "Balance Code : ",
                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                "0.0",
                style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
              )
            ],
          ),
        ),
        ListView(
          shrinkWrap: true,
          children: [
            Container(
              //margin: EdgeInsets.only(top: height * 0.15),
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
                  child: Column(
                    children: [

                      const Text(
                        "Please Enter Mobile Number",
                        style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: Row(
                          children: [
                            const Icon(
                              Icons.call,
                              color: Color(0xFFFFAE00),
                            ),
                            Container(
                              width: width * 0.77,
                              margin: const EdgeInsets.only(left: 10.0),
                              child: TextField(
                                style: const TextStyle(color: Color(0xFFFFAE00)),
                                cursorColor: const Color(0xFFFFAE00),
                                keyboardType: TextInputType.phone,
                                controller: _mobile_no_controller,
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
                                  labelText: 'Mobile No.',
                                  isDense: true,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 10.0),
                        child: ElevatedButton(
                          onPressed: () {
                            setState(() {
                              payOnlineVisibility = true;
                            });
                            _createToast("Insufficient Balance Code. To upgrade the Code, please do the payment or contact to GenieMoney");
                          },
                          child: const Text(
                            "Generate Activation Code",
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
            ),
            Visibility(
              visible: payOnlineVisibility,
              child: Container(
                margin: const EdgeInsets.only(top: 10.0),
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                PaymentOptionScreen()));
                  },
                  child: const Text(
                    "Pay Online ",
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
            ),
          ],
        ),

      ],
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }

  void filterSearchResults(String query) {
    if (dummySearchList.isEmpty) {
      dummySearchList.addAll(appHistoryList);
    }
    if (query.isNotEmpty) {
      List<AppHistoryModel> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.code.contains(query) ||
            item.name.contains(query) ||
            item.validity.contains(query) ||
            item.mobile_no.contains(query)) {
          dummyListData.add(item);
        }
      });
      appHistoryList.clear();
      setState(() {
        appHistoryList.addAll(dummyListData);
      });
      return;
    } else {
      appHistoryList.clear();
      setState(() {
        appHistoryList.addAll(dummySearchList);
      });
    }
  }
}
