import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:genie_money/Model/offers_model.dart';

class DetailOfferScreen extends StatefulWidget {

  OfferDetails offerDetails;

  @override
  _DetailOfferScreenState createState() => _DetailOfferScreenState();

  DetailOfferScreen(this.offerDetails);

}

class _DetailOfferScreenState extends State<DetailOfferScreen> {
  bool isBankOfferChecked = false;
  bool isCouponsChecked = false;
  bool isOldUserChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.offerDetails.companyName,
          style: const TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Color(0xFFFFAE00),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),

      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.only(bottom: 5),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  color: Color(0xFF3A3A3A),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image(image: AssetImage(widget.offerDetails.offerImagePath), width: 40,height: 40,),
                            SizedBox(width: 10,),
                            Text(
                                widget.offerDetails.companyName,
                              style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
                            )
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image(image: AssetImage("images/rupees.png"), width: 20,height: 20,),
                          SizedBox(width: 6,),
                          Text(
                              widget.offerDetails.offerDetails+" CD Cashback",
                            style: TextStyle(color: Color(0xFFFFAE00)),
                          ),
                          SizedBox(width: 4,),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.help_outline),
                              color: Color(0xFFFFAE00),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            flex: 1,
                              child: Container(
                                margin: EdgeInsets.all(5),
                                child: ElevatedButton(
                                  onPressed: () {  },
                                  child: Container(
                                    margin: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6
                                    ),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.share, color: Color(0xFFFFAE00),),
                                        SizedBox(width: 4,),
                                        Text(
                                          "Share & Earn",
                                          style: TextStyle(color: Color(0xFFFFAE00),fontSize: 12),)
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    primary: const Color(0xFF3A3A3A),
                                    shadowColor: const Color(0xFFFFAE00),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Color(0xFFFFAE00),width: 1)
                                    ),
                                  ),
                                ),
                              ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Container(
                              margin: EdgeInsets.all(5),
                              child: ElevatedButton(
                                onPressed: () {  },
                                child: Container(
                                  margin: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6
                                  ),
                                  child: Text(
                                        "ACTIVATE CASHBACK",
                                        style: TextStyle(color: Colors.black,fontSize: 12),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFFFFAE00),
                                  shadowColor: const Color(0xFFFFAE00),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0),
                                      side: BorderSide(color: Color(0xFFFFAE00),width: 1)
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10,
                            bottom: 10
                        ),
                        padding: EdgeInsets.only(
                          top: 1,
                          bottom: 1
                        ),
                        color: Color(0xFF111111),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6
                                  ),
                                  color: Color(0xFF3A3A3A),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Avg. Cashback",
                                        style: TextStyle(color: Color(0xFFD9D7D7),fontSize: 12),
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                        '\u{20B9}'+"508",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 6,
                                      bottom: 6
                                  ),
                                  margin: EdgeInsets.only(
                                    left: 1,
                                    right: 1
                                  ),
                                  color: Color(0xFF3A3A3A),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text(
                                          "Tracking Speed",
                                        style: TextStyle(color: Color(0xFFD9D7D7),fontSize: 12),
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                          "30 minutes",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                            ),

                            Expanded(
                                flex: 1,
                                child: Container(
                                  padding: EdgeInsets.only(
                                    top: 6,
                                    bottom: 6
                                  ),
                                  color: Color(0xFF3A3A3A),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Text("Not Tracking Claim",
                                        style: TextStyle(color: Color(0xFFD9D7D7),fontSize: 12),
                                      ),
                                      SizedBox(height: 4,),
                                      Text(
                                          "Not Accepted",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontSize: 12),
                                      )
                                    ],
                                  ),
                                )
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 15,
                          bottom: 15
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      padding: EdgeInsets.only(right: 4),
                                      child: Checkbox(
                                          checkColor: Colors.white,
                                          activeColor: const Color(0xFFFFAE00),
                                          value: isBankOfferChecked,
                                          onChanged: (value){
                                            setState(() {
                                              isBankOfferChecked = value!;
                                            });
                                          },
                                      ),
                                    ),
                                    Text(
                                      "Bank Offers",
                                      style: TextStyle(color: Color(0xFFFFAE00)),
                                    )
                                  ],
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      padding: EdgeInsets.only(right: 4),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: const Color(0xFFFFAE00),
                                        value: isCouponsChecked,
                                        onChanged: (value){
                                          setState(() {
                                            isCouponsChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Coupons",
                                      style: TextStyle(color: Color(0xFFFFAE00)),
                                    )
                                  ],
                                )
                            ),
                            Expanded(
                                flex: 1,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 24,
                                      height: 24,
                                      padding: EdgeInsets.only(right: 4),
                                      child: Checkbox(
                                        checkColor: Colors.white,
                                        activeColor: const Color(0xFFFFAE00),
                                        value: isOldUserChecked,
                                        onChanged: (value){
                                          setState(() {
                                            isOldUserChecked = value!;
                                          });
                                        },
                                      ),
                                    ),
                                    Text(
                                      "Old User",
                                      style: TextStyle(color: Color(0xFFFFAE00)),
                                    )
                                  ],
                                )
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 6,
                    bottom: 6
                  ),
                  child: Text(
                      "Showing 21 Offers",
                    style: TextStyle(color: Color(0xFFFFAE00)),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: 2,
                      itemBuilder: (context,index){
                        return Container(
                          //height: 150,
                          padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                              color: Color(0xFF3A3A3A)
                            ),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                      "Computers, Laptops & Gaming",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: Color(0xFFFFAE00),
                                          decoration: TextDecoration.underline),
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        "Share & Earn",
                                        style: TextStyle(fontSize: 14, color: Color(0xFFFFAE00),),
                                      ),
                                      SizedBox(width: 4,),
                                      Icon(Icons.share,color: Color(0xFFFFAE00),)
                                    ],
                                  )
                                ],
                              ),
                              Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.all(5),
                                    child: DottedBorder(
                                      color: Color(0xFFFFAE00),
                                      strokeWidth: 1,
                                      radius: Radius.circular(5),
                                      dashPattern: [3,1],
                                      padding: EdgeInsets.all(10),
                                      child: Column(
                                        children: [
                                          Text("SAVE",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.bold,
                                              fontSize: 18
                                            ),

                                          ),
                                          SizedBox(height: 6,),
                                          Text('\u{20B9}'+"4000",
                                            style: TextStyle(color: Colors.white),
                                          )
                                        ],
                                      ),

                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10
                                    ),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                            "Holiday Deals: Flat Rs.4000 Off on ",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          "Inspiron 15 Plus Laptop",
                                          style: TextStyle(color: Colors.white),
                                        ),
                                        SizedBox(height: 4,),
                                        Text(
                                          "FLAT 2.1% CD CASHBACK",
                                          style: TextStyle(color: Color(0xFFFFAE00), fontWeight: FontWeight.bold),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }),
                ),
                Container(
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(5)),
                    color: Color(0xFF3A3A3A)
                  ),
                  child: Column(

                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(5)),
                          color: Color(0xFFFFAE00),
                        ),
                        height: 2,

                      ),
                      Container(
                        padding: EdgeInsets.all(10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Row(
                              children: [
                                Container(
                                  height: 35,
                                  width: 35,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(Radius.circular(5)),
                                      color: Color(0xFFFFAE00)
                                  ),
                                  child: Icon(Icons.notifications_active, color: Colors.black,),
                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                          "Automatic Offer Notifications",
                                        style: TextStyle(color: Color(0xFFFFAE00)),
                                      ),
                                      Text(
                                          "95,621 people use it",
                                        style: TextStyle(color: Color(0xFFFFAE00),fontSize: 10)
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            Container(
                              child: Text("Never miss out on an offer!"
                                  " Get notified of offers directly within the merchant app itself",
                              style: TextStyle(color: Colors.white),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                "Get Started >",
                                textAlign: TextAlign.right,
                                style:TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFAE00)
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
