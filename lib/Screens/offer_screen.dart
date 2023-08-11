import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:genie_money/Screens/detail_offer_screen.dart';

import '../Model/offers_model.dart';

class OfferScreen extends StatefulWidget {
  @override
  _OfferScreenState createState() => _OfferScreenState();
}

class _OfferScreenState extends State<OfferScreen> {
  List<OffersModel> offerList = [];

  @override
  void initState() {
    offerList = [
      OffersModel(
          "1",
          "Top Store",
          "images/top_stores.png",
          [
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.5%"),
            OfferDetails("images/amazon.png","Amazon","Upto 12.6%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 11%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.4%")
          ]
      ),
      OffersModel(
          "2",
          "New on GenieMoney",
          "images/coupon.png",
          [
            OfferDetails("images/amazon.png","Amazon","Upto 12.6%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.5%"),
            OfferDetails("images/amazon.png","Amazon","Upto 12.6%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.4%")
          ]
      ),
      OffersModel(
          "3",
          "High Cashback Stores",
          "images/highcashback.png",
          [
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.5%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 11%"),
            OfferDetails("images/amazon.png","Amazon","Upto 12.6%"),
            OfferDetails("images/flipkart.png","Flipkart","Upto 5.4%")
          ]
      )
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Offers",
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
          padding: EdgeInsets.all(10),
          child: ListView.builder(
            itemCount: offerList.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 10,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(right: 4),
                                  child: Image(
                                    image: AssetImage(offerList[index].imagePath),
                                    width: 20,
                                    height: 20,)
                              ),
                              Text(offerList[index].offerName,style: TextStyle(fontWeight: FontWeight.bold, color: Color(0xFFFFAE00)),)
                            ],
                          ),
                          Text("View All", style: TextStyle(color: Color(0xFFFFAE00)),)
                        ],
                      ),
                    ),
                    Container(
                      height: 150,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          shrinkWrap: true,
                          itemCount: offerList[index].offerList.length,
                          itemBuilder: (context,subindex){
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        DetailOfferScreen(offerList[index].offerList[subindex])));
                          },
                          child: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(4)),
                              border: Border.all(width: 0.3,color: Color(0xFFFFAE00)),
                              color: Color(0xFF3A3A3A)
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    margin: EdgeInsets.only(
                                        top: 20
                                    ),
                                    child: Image(
                                      image: AssetImage(offerList[index].offerList[subindex].offerImagePath),
                                      width: 50,
                                      height: 50,
                                    )
                                ),
                                Align(
                                  alignment: Alignment.bottomCenter,
                                  child: Row(
                                    children: [
                                      Image(image: AssetImage("images/rupees.png"),width: 24,height: 24,),
                                      SizedBox(width: 4,),
                                      Text(
                                        offerList[index].offerList[subindex].offerDetails,
                                        style: TextStyle(color: Color(0xFFFFAE00)),
                                      ),

                                    ],
                                  ),
                                ),
                                Visibility(
                                  visible: index==0?false:true,
                                  child: Text(
                                    index==0?"":index==1?"Recently Added":index==2?"Active Cashback":"",
                                    style: TextStyle(color: Colors.white,fontSize: 12),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                    )
                  ],
                ),

              );
            },
          ),
        ),

      ),
    );
  }
}
