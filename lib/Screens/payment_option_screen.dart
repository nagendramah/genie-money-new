import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PaymentOptionScreen extends StatefulWidget {
  const PaymentOptionScreen({Key? key}) : super(key: key);

  @override
  State<PaymentOptionScreen> createState() => _PaymentOptionScreenState();
}

class _PaymentOptionScreenState extends State<PaymentOptionScreen> {

  String radioGroup = "One";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Payment",
          style: const TextStyle(color: Color(0xFFFFAE00)),
        ),
        /*actions: [
          Container(
              margin: EdgeInsets.only(right: 10),
              child: Icon(Icons.history,color: Color(0xFFFFAE00)))
        ],*/
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Select on option to pay",
                      style: TextStyle(color: Color(0xFFFFAE00),fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                    Text(
                        "\u20B9"+" 150.0",
                      style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),

              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(color: Color(0xFFFFAE00),width: 1)
                ),
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                            value: false,
                            onChanged: (value){

                            },
                            activeColor: Color(0xFFFFAE00),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "GenieMoney Balance",
                                style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Insuffiecient Balance \u20B9 0.0",
                                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Icon(Icons.account_balance_wallet_outlined,color: Color(0xFFFFAE00),)
                  ],
                ),
              ),

              Container(
                /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xFFFFAE00),width: 1)
                ),*/
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "one",
                          onChanged: (value){
                              setState(() {
                                radioGroup="one";
                              });
                          },
                          activeColor: Color(0xFFFFAE00),
                          groupValue: radioGroup,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "HDFC Bank A/c XX 4324 ",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "Check Balance",
                                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image(image: AssetImage("images/hdfc_logo_gm.png"), width: 24, height: 24,)
                  ],
                ),
              ),

              Container(
                child: ElevatedButton(
                  child: Text(
                    "Pay "+"\u20B9"+" 150",
                    style: TextStyle(
                      color: Color(0xFF111111),
                      fontSize: 18.0,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: const Color(0xFFFFAE00),
                    shadowColor: const Color(0xFFFFAE00),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  onPressed: () {


                  },
                ),
              ),

              Container(
                height: 1,
                color: Color(0xFFFFAE00),
                margin: EdgeInsets.only(top: 15,bottom: 15),
              ),

              Container(
                /*decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: Color(0xFFFFAE00),width: 1)
                ),*/
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Radio(
                          value: "two",
                          onChanged: (value){
                              setState(() {
                                radioGroup="two";
                              });
                          },
                          activeColor: Color(0xFFFFAE00),
                          groupValue: radioGroup,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Debit Card XX 3124",
                              style: TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              child: Text(
                                "HDFC Bank",
                                style: TextStyle(color: Color(0xFFFFAE00), fontSize: 14),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 5),
                              padding: EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                                color: Color(0xFFFFAE00)
                              ),
                              child: Text(
                                "Save card as per latest RBI guidelines",
                                style: TextStyle(color: Colors.black, fontSize: 14),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    Image(image: AssetImage("images/hdfc_logo_gm.png"), width: 24, height: 24,)
                  ],
                ),
              ),

              Container(
                margin: EdgeInsets.only(top: 10,bottom: 10),
                child: Text(
                  "New Payment Options",
                  style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18,fontWeight: FontWeight.bold),
                ),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Debit & Credit Cards",
                      style: TextStyle(color: Colors.white, fontSize: 18,),
                    ),
                    Icon(Icons.credit_card, color: Color(0xFFFFAE00),)
                  ],
                ),
              ),

              Container(
                height: 0.5,
                color: Color(0xFFFFAE00),
                margin: EdgeInsets.only(top: 5,bottom: 5),
              ),

              Container(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Net Banking",
                      style: TextStyle(color: Colors.white, fontSize: 18,),
                    ),
                    Icon(Icons.account_balance, color: Color(0xFFFFAE00),)
                  ],
                ),
              ),

              Container(
                height: 0.5,
                color: Color(0xFFFFAE00),
                margin: EdgeInsets.only(top: 5,bottom: 5),
              ),

            ],

          ),
        ),
      ),
    );
  }
}
