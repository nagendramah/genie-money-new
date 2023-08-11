import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Model/utility/customInputFormatter.dart';
import '../Model/utility/customInputFormatterDate.dart';
import 'package:genie_money/Model/utility/pay_statusModel.dart';
import 'package:genie_money/Screens/transcation_history.dart';

import '../Model/utility/CardPaymentsModel.dart';
import '../Model/utility/credit_card_payment_sendModel.dart';
import '../Model/utility/credit_transaction_historyModel.dart';

import 'creditcard_transaction_history.dart';

class CreditCardPayment extends StatefulWidget {
  const CreditCardPayment({Key? key}) : super(key: key);

  @override
  State<CreditCardPayment> createState() => _CreditCardPaymentState();
}


class _CreditCardPaymentState extends State<CreditCardPayment> {

  TextEditingController _card_number_controller = TextEditingController();
  TextEditingController _card_holder_controller = TextEditingController();
  TextEditingController _card_expiry_controller = TextEditingController();
  TextEditingController Mobile_number = TextEditingController();
  TextEditingController remark = TextEditingController();
  TextEditingController amount = TextEditingController(/*text: "Rs."*/);
  TextEditingController OTPtext = TextEditingController();


  bool isLoading = false;
  bool isVisible = false;
  bool isVisibleb = true;
  bool isTransaction = false;
  late String ref;


  int generateReferenceId() {
    int id = DateTime
        .now()
        .millisecondsSinceEpoch;
    //print(""+id.toString());
    return id;
  } /////////////////API CALLING
  // apiCallLogin() {
  //   final msg = ApiServices();
  //   msg.apiCallLogin(
  //
  //       {
  //         "refid": "",
  //         "name": _card_holder_controller.text,
  //         "mobile": Mobile_number.text,
  //         "card_number": _card_number_controller.text.replaceAll(" ", ""),
  //         "amount": amount.text,
  //         "remarks": "BILL PAYMENT",
  //         "network": "MasterCard",
  //       }
  //   ).then((value) async {
  //     print("value" + value.response_code.toString());
  //     if (value.response_code == 1) {
  //
  //       Fluttertoast.showToast(
  //           msg: "OTP sent succesflully",
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.green,
  //           textColor: Colors.white,
  //           fontSize: 16.0
  //       );
  //       // Navigator.push(
  //   //       //         context,
  //   //       //         MaterialPageRoute(
  //   //       //             builder: (context) =>
  //   //       //                 OTPScreenCard("","","")));
  //     }
  //
  //     else {
  //       Fluttertoast.showToast(
  //           msg: value.message.toString(),
  //           toastLength: Toast.LENGTH_SHORT,
  //           gravity: ToastGravity.CENTER,
  //           timeInSecForIosWeb: 1,
  //           backgroundColor: Colors.red,
  //           textColor: Colors.white,
  //           fontSize: 16.0
  //       );
  //     }
  //   });
  // }



  //////////////////////////////H///////////SHOWDAILOG

  bool isProgessBarVisible=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            CreditCardTranscationHistory()));
              },
              icon: Icon(Icons.history, color: Color(0xFFFFAE00),))
        ],
        title: Text(
          !isTransaction ? "Credit Card Payments" : "Transactions",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),

      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  margin:
                  const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller:
                    _card_holder_controller,
                    keyboardType:
                    TextInputType.text,


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
                      labelText: 'Card Holder Name',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller:
                    _card_number_controller,

                    keyboardType:
                    TextInputType.number,

                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(19),

                      FilteringTextInputFormatter.digitsOnly,
                      CustomInputFormatter()
                    ],
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
                      labelText: 'Card no',

                      isDense: true,

                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller:
                    _card_expiry_controller,
                    keyboardType:
                    TextInputType.number,

                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(5),

                      FilteringTextInputFormatter.digitsOnly,
                      CustomInputFormatterDate()
                    ],
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
                       hintText: '08/25',
                      hintStyle: TextStyle(color: Color(0xFFFFFEFD)),
                      labelText: 'Expiry Date',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.all(10.0),
                  child: TextField(
                    controller:
                    amount,
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
                      labelText: 'Enter Amount',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.all(10.0),
                  child: TextField(
                    controller:
                    remark,
                    keyboardType:
                    TextInputType.text,
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
                      labelText: 'Remark',
                      isDense: true,
                    ),
                  ),
                ),
                Container(
                  margin:
                  const EdgeInsets.all(5.0),
                  child: TextField(
                    controller:
                    Mobile_number,
                    keyboardType:
                    TextInputType.number,
                    inputFormatters: [
                      new LengthLimitingTextInputFormatter(10),

                      FilteringTextInputFormatter.digitsOnly,

                    ],
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
                            5.0),
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
                      labelText: 'Mobile No',
                      isDense: true,
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    margin:
                    const EdgeInsets.all(5.0),
                    child: TextField(
                      controller: OTPtext,
                      keyboardType:
                      TextInputType.number,
                      inputFormatters: [
                        new LengthLimitingTextInputFormatter(10),

                        FilteringTextInputFormatter.digitsOnly,

                      ],
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
                              5.0),
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
                        labelText: 'Enter OTP',
                        isDense: true,
                      ),
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisibleb,
                  child: Container(
                    width: 500,
                    height: 40,
                    margin:
                    const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: const Text(
                        "Verify & Proceed",
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
                        Size(20, 40.0),


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
                        if (_card_holder_controller.text
                            .toString()
                            .isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Card Holder Name ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        else if (_card_number_controller.text
                            .toString()
                            .isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Card No",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        else if (_card_expiry_controller.text
                            .toString()
                            .isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Expiry Date",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        else if(amount.text
                            .toString()
                            .isEmpty)
                        {
                          Fluttertoast.showToast(
                              msg: "Please Enter Card Number ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                        else if (remark.text
                            .toString()
                            .isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Card Number ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }
                       else if (Mobile_number.text
                            .toString()
                            .isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please Enter Mobile ",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 1,
                              backgroundColor: Colors.red,
                              textColor: Colors.white,
                              fontSize: 16.0
                          );
                        }


                        else {
                           ref = generateReferenceId().toString();


                          final String r = _card_number_controller.text;
                          Map<String, dynamic> param = {
                            "refid": ref,
                            "name": _card_holder_controller.text,
                            "mobile": Mobile_number.text,
                            "card_number": _card_number_controller.text.replaceAll(
                                " ", ""),
                            "amount": amount.text,
                            "remarks": "BILL PAYMENT",
                            "network": "VISA",

                          };
                         //apiCallLogin();

                           loadProgress();
                          var x = ApiServices();
                          var res = await x.apiCallLogin(param);
                           loadProgress();
                          if (res.response_code!=1)
                            {
                              Fluttertoast.showToast(
                                  msg: res.message.toString(),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                          else if (res.response_code==1)
                            {
                              isVisible = true;
                              isVisibleb = false;
                              Fluttertoast.showToast(
                                  msg: res.message.toString(),
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.green,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                              );
                            }
                        }
                        setState(() {
                          //
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             OTPScreenCard("","","")));
                          /* int? msg = LoginApiResponse().response_code;
                          if (msg==14)
                            {
                              Fluttertoast.showToast(
                                  msg:"Something  Wrong",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                             );
                            }*/

                          //
                          // Fluttertoast.showToast(
                          //     msg: ""+ stat!,
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );

                          // cardDetails.add(CardDetails(
                          //     "Bank Name",
                          //     _card_number_controller
                          //         .text
                          //         .trim("")
                          //         .substring(0, 5),
                          //     _card_number_controller
                          //         .text
                          //         .trim()
                          //         .substring(
                          //         12, 16),
                          //     _card_holder_controller
                          //         .text
                          //         .trim()));
                        });
                        /*  Navigator.of(context,
                            rootNavigator: true)
                            .pop();*/
                      },
                    ),
                  ),
                ),
                Visibility(
                  visible: isVisible,
                  child: Container(
                    width: 100,
                    height: 40,
                    margin:
                    const EdgeInsets.all(10.0),
                    child: ElevatedButton(
                      child: const Text(
                        "PAY",
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
                        Size(20, 40.0),


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
                        setState(() async {
                          isVisible = true;

                        //  final String r = generateReferenceId().toString();

                          Map<String, dynamic> params = {
                            "refid": ref,
                            "name": _card_holder_controller.text,
                            "mobile": Mobile_number.text,
                            "card_number": _card_number_controller.text.replaceAll(
                                " ", ""),
                            "amount": amount.text,
                            "remarks": "BILL PAYMENT",
                            "network": "VISA",
                            "otp": OTPtext.text,
                          };
                         // print(""+OTP.text)
                    //     apiCallLogins();

                          loadProgress();
                          var xx = ApiServicess();
                          var ress = await   xx.apiPaybills(params);
                          loadProgress();
                          if (ress.response_code!=1)

                          {

                            Fluttertoast.showToast(
                                msg:ress.message.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.red,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Map<String, dynamic> paramsss = {
                              "userid": "25",
                              "holder_name": _card_holder_controller.text.toString(),
                              "ref_id": ref.toString(),
                              "name": _card_holder_controller.text,
                              "mobile_no": Mobile_number.text,
                              "card_no": _card_number_controller.text.replaceAll(
                                  " ", "").toString(),
                              "status":"failed",
                              "message":ress.message.toString(),
                              "amount": amount.text,
                               "remark": remark.text,

                            };
                            var xxo = TransactionApiServices();
                            var reees = await   xxo.apitarnsactions(paramsss);

                          }
                          else
                          {
                            Fluttertoast.showToast(
                                msg:ress.message.toString(),
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );
                            Map<String, dynamic> paramsss = {
                              "userid": "25",
                              "holder_name": _card_holder_controller.text.toString(),
                              "ref_id": ref.toString(),
                              "name": _card_holder_controller.text,
                              "mobile_no": Mobile_number.text,
                              "card_no": _card_number_controller.text.replaceAll(
                                  " ", "").toString(),
                              "status":"success",
                              "message":ress.message.toString(),
                              "amount": amount.text,
                              "remark": remark.text,

                            };
                            var xxo = TransactionApiServices();
                            var reees = await   xxo.apitarnsactions(paramsss);
                            String nm=reees.holder_name.toString();
                            Fluttertoast.showToast(
                                msg:nm,
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 1,
                                backgroundColor: Colors.green,
                                textColor: Colors.white,
                                fontSize: 16.0
                            );


                          }


                          //
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (context) =>
                          //             OTPScreenCard("","","")));
                          /* int? msg = LoginApiResponse().response_code;
                          if (msg==14)
                            {
                              Fluttertoast.showToast(
                                  msg:"Something  Wrong",
                                  toastLength: Toast.LENGTH_SHORT,
                                  gravity: ToastGravity.CENTER,
                                  timeInSecForIosWeb: 1,
                                  backgroundColor: Colors.red,
                                  textColor: Colors.white,
                                  fontSize: 16.0
                             );
                            }*/

                          //
                          // Fluttertoast.showToast(
                          //     msg: ""+ stat!,
                          //     toastLength: Toast.LENGTH_SHORT,
                          //     gravity: ToastGravity.CENTER,
                          //     timeInSecForIosWeb: 1,
                          //     backgroundColor: Colors.red,
                          //     textColor: Colors.white,
                          //     fontSize: 16.0
                          // );

                          // cardDetails.add(CardDetails(
                          //     "Bank Name",
                          //     _card_number_controller
                          //         .text
                          //         .trim("")
                          //         .substring(0, 5),
                          //     _card_number_controller
                          //         .text
                          //         .trim()
                          //         .substring(
                          //         12, 16),
                          //     _card_holder_controller
                          //         .text
                          //         .trim()));
                        });
                        /*  Navigator.of(context,
                            rootNavigator: true)
                            .pop();*/
                      },
                    ),
                  ),
                )

              ],
            ),
          ),
          buildShowDialog(context)
        ],
      ),
    );
  }

  void showdailog(String? txnid, String? refid, String? name, String? mobile,
      String? card_number, String? amount, String? charge, String? network,
      String? utr, String? remarks, String? dateadded, String? utr2) {
  }

  buildShowDialog(BuildContext context) {
    return
      Visibility(
          visible: isProgessBarVisible,
          child:
          Center(
              child: CircularProgressIndicator(
                color: Color(0xFFF7941D),
              )
          )
      );

  }

  loadProgress(){
    if(isProgessBarVisible == true){
      setState(() {
        isProgessBarVisible = false;
      });
    }
    else{
      setState(() {
        isProgessBarVisible = true;
      });
    }

  }
}
