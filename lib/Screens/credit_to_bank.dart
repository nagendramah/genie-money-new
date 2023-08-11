import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Model/card_details.dart';
import '../Model/payee_details_model.dart';

class CreditToBank extends StatefulWidget {
  const CreditToBank({Key? key}) : super(key: key);

  @override
  State<CreditToBank> createState() => _CreditToBankState();
}

class _CreditToBankState extends State<CreditToBank> {
  late List<CardDetails> cardDetails = [];

  TextEditingController _card_number_controller = TextEditingController();
  TextEditingController _card_holder_controller = TextEditingController();
  TextEditingController _card_expiry_controller = TextEditingController();

  bool isTransaction = false;

  @override
  void initState() {
    cardDetails
        .add(CardDetails("ICICI Bank LTD.", "1234", "4567", "SUNIL SINGH"));
    super.initState();
  }

  Future<bool> _onBackPressed() async {
    if (isTransaction) {
      setState(() {
        isTransaction = false;
      });
      return false;
    } else {
      return true;
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: _onBackPressed,
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          backgroundColor: const Color(0xFF3A3A3A),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: const Color(0xFFFFAE00),
            onPressed: () {
              if (isTransaction) {
                setState(() {
                  isTransaction = false;
                });
              } else {
                Navigator.of(context).pop();
              }
            },
          ),
          title: Text(
            !isTransaction ? "Credit Card to Bank Transfer" : "Transactions",
            style: TextStyle(
              color: Color(0xFFFFAE00),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              Visibility(
                visible: !isTransaction,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 15.0, top: 10.0),
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "My Cards",
                            style: TextStyle(
                              color: const Color(0xFFFFAE00),
                            ),
                          ),
                        ),
                        Container(
                          height: 167,
                          margin: const EdgeInsets.all(10.0),
                          width: width,
                          child: ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            itemCount: cardDetails.length,
                            itemBuilder: (BuildContext context, int index) {
                              return SizedBox(
                                width: 250,
                                child: Card(
                                  color: Colors.blueAccent,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15.0),
                                  ),
                                  margin: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(10.0),
                                        alignment: Alignment.centerRight,
                                        child: Text(
                                          cardDetails[index].bank_name,
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 40),
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    cardDetails[index]
                                                        .card_first_number,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16.0),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      "xxxx",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      "xxxx",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      cardDetails[index]
                                                          .card_last_number,
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 16.0),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              alignment: Alignment.bottomLeft,
                                              margin: const EdgeInsets.only(
                                                  left: 10.0),
                                              child: Text(
                                                cardDetails[index]
                                                    .customer_name,
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16.0),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(right: 20.0),
                                        alignment: Alignment.bottomRight,
                                        child: Image(
                                          image: AssetImage("images/visa.png"),
                                          width: 40,
                                          height: 40,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: const EdgeInsets.only(
                              top: 10.0, left: 20.0, bottom: 10.0),
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet<void>(
                                  backgroundColor: Colors.transparent,
                                  isScrollControlled: true,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Padding(
                                      padding:
                                          MediaQuery.of(context).viewInsets,
                                      child: Container(
                                        width: width,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10)),
                                          color: const Color(0xFF3A3A3A),
                                        ),
                                        child: SingleChildScrollView(
                                          scrollDirection: Axis.vertical,
                                          child: Column(
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              Row(
                                                children: [
                                                  Align(
                                                    child: InkWell(
                                                      onTap: () {
                                                        Navigator.of(context,
                                                                rootNavigator:
                                                                    true)
                                                            .pop();
                                                      },
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .all(10.0),
                                                        child: Text(
                                                          "Back",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                        ),
                                                      ),
                                                    ),
                                                    alignment:
                                                        Alignment.centerLeft,
                                                  ),
                                                  Expanded(
                                                    child: Align(
                                                      child: Container(
                                                        margin: const EdgeInsets
                                                            .only(top: 10.0),
                                                        child: Text(
                                                          "Add a Credit Card",
                                                          style: TextStyle(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                        ),
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Container(
                                                height: 200,
                                                width: width,
                                                padding:
                                                    const EdgeInsets.all(10.0),
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.all(
                                                          Radius.circular(10)),
                                                  color: Colors.blueAccent,
                                                ),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.end,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        "Card Number",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        "Card Holder Name",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      child: Text(
                                                        "MM / YY",
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                child: TextField(
                                                  controller:
                                                      _card_number_controller,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFAE00)),
                                                  cursorColor:
                                                      const Color(0xFFFFAE00),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    labelStyle: const TextStyle(
                                                        color:
                                                            Color(0xFFFFAE00)),
                                                    // hintText: 'Email / Mobile No.',
                                                    labelText: 'Card Number',
                                                    isDense: true,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                child: TextField(
                                                  controller:
                                                      _card_holder_controller,
                                                  keyboardType:
                                                      TextInputType.name,
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFAE00)),
                                                  cursorColor:
                                                      const Color(0xFFFFAE00),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    labelStyle: const TextStyle(
                                                        color:
                                                            Color(0xFFFFAE00)),
                                                    // hintText: 'Email / Mobile No.',
                                                    labelText:
                                                        'Card Holder Name',
                                                    isDense: true,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                child: TextField(
                                                  controller:
                                                      _card_expiry_controller,
                                                  keyboardType:
                                                      TextInputType.number,
                                                  style: const TextStyle(
                                                      color: Color(0xFFFFAE00)),
                                                  cursorColor:
                                                      const Color(0xFFFFAE00),
                                                  decoration: InputDecoration(
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    border: OutlineInputBorder(
                                                      borderSide:
                                                          const BorderSide(
                                                              color: Color(
                                                                  0xFFFFAE00)),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                    labelStyle: const TextStyle(
                                                        color:
                                                            Color(0xFFFFAE00)),
                                                    // hintText: 'Email / Mobile No.',
                                                    labelText:
                                                        'Expiry Date (MM / YY)',
                                                    isDense: true,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.all(10.0),
                                                child: ElevatedButton(
                                                  child: const Text(
                                                    "ADD",
                                                    style: TextStyle(
                                                        color:
                                                            Color(0xFF111111),
                                                        fontSize: 18.0,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                  style:
                                                      ElevatedButton.styleFrom(
                                                    fixedSize:
                                                        Size(width, 25.0),
                                                    primary:
                                                        const Color(0xFFFFAE00),
                                                    shadowColor:
                                                        const Color(0xFFFFAE00),
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10.0),
                                                    ),
                                                  ),
                                                  onPressed: () async {
                                                    setState(() {
                                                      cardDetails.add(CardDetails(
                                                          "Bank Name",
                                                          _card_number_controller
                                                              .text
                                                              .trim()
                                                              .substring(0, 5),
                                                          _card_number_controller
                                                              .text
                                                              .trim()
                                                              .substring(
                                                                  12, 16),
                                                          _card_holder_controller
                                                              .text
                                                              .trim()));
                                                    });
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  });
                            },
                            child: DottedBorder(
                              dashPattern: [10, 10],
                              color: Color(0xFFFFAE00),
                              borderType: BorderType.RRect,
                              radius: Radius.circular(10),
                              child: Container(
                                width: width * 0.44,
                                padding: const EdgeInsets.all(10.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Icon(
                                      Icons.add_circle_outline,
                                      color: const Color(0xFFFFAE00),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        "Add A New Card",
                                        style: TextStyle(
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: width,
                          margin: const EdgeInsets.only(top: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20),
                                topRight: Radius.circular(20)),
                            color: const Color(0xFF111111),
                          ),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) =>
                                          const PayeeDetailsScreen());
                                  Navigator.of(context).push(route);
                                },
                                child: Container(
                                  margin: const EdgeInsets.all(20.0),
                                  padding: const EdgeInsets.all(10.0),
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                    color: const Color(0xFF3A3A3A),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.food_bank_outlined,
                                        color: Color(0xFFFFAE00),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              "Pay to Bank Account",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Color(0xFFFFAE00),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              "Pay from Credit Card to Bank a/c",
                                              style: TextStyle(
                                                color: Color(0xFFFFAE00),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(left: 10.0),
                                        child: Icon(
                                          Icons.chevron_right_sharp,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              InkWell(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) =>
                                      const AddContactsScreen());
                                  Navigator.of(context).push(route);
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: const Color(0xFF3A3A3A),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Icon(
                                        Icons.person_add_alt,
                                        color: Color(0xFFFFAE00),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              "Add Contacts",
                                              style: TextStyle(
                                                  fontWeight:
                                                  FontWeight.bold,
                                                  color:
                                                  Color(0xFFFFAE00),
                                                  fontSize: 16.0),
                                            ),
                                          ),
                                          Container(
                                            margin: const EdgeInsets.only(
                                                left: 10.0),
                                            child: Text(
                                              "Add your Vendors & Customers",
                                              style: TextStyle(
                                                color: Color(0xFFFFAE00),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: Icon(
                                          Icons.chevron_right_sharp,
                                          color: Color(0xFFFFAE00),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    isTransaction = true;
                                  });
                                },
                                child: Container(
                                  width: width,
                                  padding: const EdgeInsets.all(10.0),
                                  margin: const EdgeInsets.all(20.0),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(10)),
                                    color: const Color(0xFF3A3A3A),
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: Text(
                                          "Transactions",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Color(0xFFFFAE00),
                                              fontSize: 16.0),
                                        ),
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(
                                            left: 10.0),
                                        child: Icon(
                                          Icons.chevron_right_sharp,
                                          color: Color(0xFFFFAE00),
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
              ),
              Visibility(
                visible: isTransaction,
                child: Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () {
                            Route route = MaterialPageRoute(
                                builder: (context) =>
                                    const TransactionDetails());
                            Navigator.of(context).push(route);
                          },
                          child: Container(
                            margin: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      "Sunil Singh",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16.0,
                                          color: Color(0xFFFFAE00)),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(top: 5.0),
                                      child: Text(
                                        "\u2022 COMPLETED",
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          "\u20B920,000.00",
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16.0,
                                              color: Color(0xFFFFAE00)),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        Container(
                                          margin:
                                              const EdgeInsets.only(top: 5.0),
                                          child: Text(
                                            "05 Jan 2022",
                                            style: TextStyle(
                                                color: Color(0xFFFFAE00)),
                                          ),
                                        ),
                                      ],
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 10.0),
                                      child: Icon(
                                        Icons.arrow_forward_ios_rounded,
                                        color: Color(0xFFFFAE00),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(
                              top: 10.0, right: 10.0, left: 10.0),
                          width: width,
                          height: 1.0,
                          color: Colors.black,
                        ),
                      ],
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
}

class TransactionDetails extends StatefulWidget {
  const TransactionDetails({Key? key}) : super(key: key);

  @override
  State<TransactionDetails> createState() => _TransactionDetailsState();
}

class _TransactionDetailsState extends State<TransactionDetails> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Transaction Details",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Account No",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "456723819624",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transfer Amount",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\u20B920000.00",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Date Initiated",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "05 Jan 2022, 7:34AM",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transaction ID",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "963852741123",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                color: Color(0xFF3A3A3A),
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Method",
                      style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Payment Mode",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "Credit Card",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Card Number",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "1234xxxxxxxx4567",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Transfer Charges",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\u20B9600.00",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                width: width,
                margin: const EdgeInsets.all(10.0),
                height: 2.0,
                color: Color(0xFF3A3A3A),
              ),
              Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST Charges",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\u20B9117.00",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                color: Color(0xFF3A3A3A),
                padding:
                    const EdgeInsets.only(top: 20, bottom: 20.0, left: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Additional Info",
                      style: TextStyle(
                          color: Color(0xFFFFAE00),
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold),
                      textAlign: TextAlign.left,
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 10.0),
                padding: const EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "GST Charges",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                      textAlign: TextAlign.left,
                    ),
                    Text(
                      "\u20B9117.00",
                      style: TextStyle(color: Color(0xFFFFAE00)),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PayeeDetailsScreen extends StatefulWidget {
  const PayeeDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PayeeDetailsScreen> createState() => _PayeeDetailsScreenState();
}

class _PayeeDetailsScreenState extends State<PayeeDetailsScreen> {
  List<PayeeDetailsModel> payee_details_list = [];

  @override
  void initState() {
    setState(() {
      payee_details_list.add(PayeeDetailsModel("Satyam Soni"));
      payee_details_list.add(PayeeDetailsModel("Arati Kumare"));
      payee_details_list.add(PayeeDetailsModel("Nitin Jadhav"));
      payee_details_list.add(PayeeDetailsModel("Nividita Mishra"));
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF3A3A3A),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Payee Details",
          style: TextStyle(color: Color(0xFFFFAE00)),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Container(
                color: Color(0xFF111111),
                child: Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 10.0, left: 10.0),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Recent Contacts",
                        style: TextStyle(
                            color: const Color(0xFFFFAE00),
                            fontWeight: FontWeight.bold,
                            fontSize: 16.0),
                      ),
                    ),
                    Container(
                      height: 100,
                      margin: const EdgeInsets.all(5.0),
                      child: Row(
                        children: [
                          InkWell(
                            onTap: () async {
                              Route route = MaterialPageRoute(
                                  builder: (context) =>
                                      const AddContactsScreen());
                              String name = await Navigator.of(context).push(route);
                              if (name.isNotEmpty) {
                                setState(() {
                                  payee_details_list.insert(0, PayeeDetailsModel(name));
                                });
                              }
                            },
                            child: Container(
                              width: 80,
                              margin: const EdgeInsets.all(5.0),
                              child: Column(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF3A3A3A),
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child: Center(
                                      child: Icon(
                                        Icons.add,
                                        color: const Color(0xFFFFAE00),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: const EdgeInsets.only(top: 10.0),
                                    child: Text(
                                      "Add Contact",
                                      style: TextStyle(
                                        color: const Color(0xFFFFAE00),
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: payee_details_list.length,
                              itemBuilder: (context, index) {
                                var letter =
                                    payee_details_list[index].name.split(" ");
                                String first_letter = "";
                                String second_letter = "";
                                if (letter.length > 1) {
                                  first_letter = letter[0].substring(0, 1);
                                  second_letter = letter[1].substring(0, 1);
                                } else {
                                  first_letter = letter[0].substring(0, 1);
                                }
                                return Container(
                                  width: 80,
                                  margin: const EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                            color: Color(0xFF3A3A3A),
                                            borderRadius:
                                                BorderRadius.circular(100)),
                                        child: Center(
                                          child: Text(
                                            first_letter + second_letter,
                                            style: TextStyle(
                                              color: const Color(0xFFFFAE00),
                                            ),
                                            maxLines: 1,
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                      Container(
                                        margin:
                                            const EdgeInsets.only(top: 10.0),
                                        child: Text(
                                          payee_details_list[index].name,
                                          style: TextStyle(
                                            color: const Color(0xFFFFAE00),
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Company Name',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Account Number',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'IFSC Code',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.name,
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Bank Name',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                child: TextField(
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  style: const TextStyle(color: Color(0xFFFFAE00)),
                  cursorColor: const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    disabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFFFAE00)),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    labelStyle: const TextStyle(color: Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Amount',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.all(20.0),
                child: InkWell(
                  onTap: () {},
                  child: DottedBorder(
                    dashPattern: const [10, 10],
                    color: const Color(0xFFFFAE00),
                    borderType: BorderType.RRect,
                    radius: const Radius.circular(10),
                    child: Container(
                      width: 278,
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Icon(
                            Icons.add_circle_outline,
                            color: Color(0xFFFFAE00),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "Add Additional Details",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.only(left: 10.0),
                                child: const Text(
                                  "Eg: Discount type, GST, TDS, & so on",
                                  style: TextStyle(
                                    color: Color(0xFFFFAE00),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddContactsScreen extends StatefulWidget {
  const AddContactsScreen({Key? key}) : super(key: key);

  @override
  State<AddContactsScreen> createState() => _AddContactsScreenState();
}

enum PayeeType { Individual, Business }

class _AddContactsScreenState extends State<AddContactsScreen> {
  PayeeType payee_type = PayeeType.Individual;
  TextEditingController _payee_name_controller = TextEditingController();
  TextEditingController _payee_ac_number_controller = TextEditingController();
  TextEditingController _payee__re_ac_number_controller = TextEditingController();
  TextEditingController _payee_ifsc_controller = TextEditingController();
  TextEditingController _payee_bank_controller = TextEditingController();
  TextEditingController _payee_email_controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: const Text(
          "Add Contact",
          style: TextStyle(
            color: const Color(0xFFFFAE00),
          ),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.center,
                child: Container(
                  width: 279,
                  margin: const EdgeInsets.only(top: 10.0),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: const Color(0xFFFFAE00),
                    ),
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 10.0, top: 10.0),
                        child: Text(
                          "Select Payee Type",
                          style: TextStyle(color: const Color(0xFFFFAE00)),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.all(5.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                              width:130.0,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 1.0,
                                title: const Text('Individial', style: TextStyle(color: Color(0xFFFFAE00)),),
                                leading: Radio(
                                  activeColor: const Color(0xFFFFAE00),
                                  value: PayeeType.Individual,
                                  groupValue: payee_type,
                                  onChanged: (PayeeType? value) {
                                    setState(() {
                                      payee_type = value!;
                                    });
                                  },
                                ),
                              ),
                            ),
                            SizedBox(
                              width:130.0,
                              child: ListTile(
                                contentPadding: EdgeInsets.zero,
                                horizontalTitleGap: 1.0,
                                title: const Text('Business', style: TextStyle(color: Color(0xFFFFAE00))),
                                leading: Radio(
                                  value: PayeeType.Business,
                                  groupValue: payee_type,
                                  onChanged: (PayeeType? value) {
                                    setState(() {
                                      payee_type = value!;
                                    });
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
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee_name_controller,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Payee Name',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee_ac_number_controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Account Number',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee__re_ac_number_controller,
                  keyboardType: TextInputType.number,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Re-Enter Account Number',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee_ifsc_controller,
                  keyboardType: TextInputType.name,
                  textCapitalization: TextCapitalization.characters,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'IFSC Code',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee_bank_controller,
                  keyboardType: TextInputType.name,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Bank Name',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: TextField(
                  controller: _payee_email_controller,
                  keyboardType: TextInputType.emailAddress,
                  style: const TextStyle(
                      color: Color(0xFFFFAE00)),
                  cursorColor:
                  const Color(0xFFFFAE00),
                  decoration: InputDecoration(
                    focusedBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    disabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    enabledBorder:
                    OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    border: OutlineInputBorder(
                      borderSide:
                      const BorderSide(
                          color: Color(
                              0xFFFFAE00)),
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                    labelStyle: const TextStyle(
                        color:
                        Color(0xFFFFAE00)),
                    // hintText: 'Email / Mobile No.',
                    labelText: 'Email Id',
                    isDense: true,
                  ),
                ),
              ),
              Container(
                margin:
                const EdgeInsets.all(10.0),
                child: ElevatedButton(
                  child: const Text(
                    "Add Contact",
                    style: TextStyle(
                        color:
                        Color(0xFF111111),
                        fontSize: 18.0,
                        fontWeight:
                        FontWeight.bold),
                  ),
                  style:
                  ElevatedButton.styleFrom(
                    fixedSize:
                    Size(width, 25.0),
                    primary:
                    const Color(0xFFFFAE00),
                    shadowColor:
                    const Color(0xFFFFAE00),
                    shape:
                    RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.circular(
                          10.0),
                    ),
                  ),
                  onPressed: () {
                    if (_payee_name_controller.text.isNotEmpty) {
                      if (_payee_ac_number_controller.text.isNotEmpty) {
                        if (_payee__re_ac_number_controller.text.isNotEmpty) {
                          if (_payee__re_ac_number_controller.text == _payee_ac_number_controller.text) {
                            if (_payee_ifsc_controller.text.isNotEmpty) {
                              if (_payee_bank_controller.text.isNotEmpty) {
                                Navigator.of(context).pop(_payee_name_controller.text);
                              } else {
                                _createToast("Please enter bank name");
                              }
                            } else {
                              _createToast("Please enter IFSC code");
                            }
                          } else {
                            _createToast("Account number does not match");
                          }
                        } else {
                          _createToast("Please re-enter account number");
                        }
                      } else {
                        _createToast("Please enter account number");
                      }
                    } else {
                      _createToast("Please enter payee name");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createToast(String message) {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1);
  }
}
