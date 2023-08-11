import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class CustomerMoneyTransfer extends StatefulWidget {
  const CustomerMoneyTransfer({Key? key}) : super(key: key);

  @override
  State<CustomerMoneyTransfer> createState() => _CustomerMoneyTransferState();
}

class _CustomerMoneyTransferState extends State<CustomerMoneyTransfer> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "Money Transfer",
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
      //floatingActionButton: ,
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 130,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        ElevatedButton(
                            onPressed: (){},
                            child: Row(
                              children: [
                                Icon(Icons.qr_code_scanner,color: Colors.black,size: 20,),
                                Container(
                                    margin: EdgeInsets.only(left: 10),
                                    child: Text(
                                      "Scan any QR",
                                      style: TextStyle(color: Colors.black,fontSize: 12),)
                                )
                              ],
                            ),
                          style: ElevatedButton.styleFrom(
                            //fixedSize: Size(width, 40.0),
                            primary: const Color(0xFFFFAE00),
                            shadowColor: const Color(0xFFFFAE00),
                            shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                        ),

                        Container(
                          height: 40,
                          width: 40,
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(color: Color(0xFFFFAE00), width: 2)
                          ),
                        )
                      ],
                    ),
                    Text(
                      "Genie Moneyy\n Banner",
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Color(0xFF3A3A3A),
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20))
                      ),
                      padding: EdgeInsets.all(10),
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Container(
                             margin: EdgeInsets.only(bottom: 20, left: 10),
                             child: Text(
                               "People",
                               style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold,fontSize: 18),
                             ),
                           ),
                           GridView.builder(
                             shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 10,
                                //crossAxisSpacing: 10,
                                //mainAxisExtent: 70
                              ),
                              itemCount: 12,
                              itemBuilder: (context,index){
                                return Column(
                                  children: [
                                    GestureDetector(
                                      child: Container(
                                        height: 60,
                                        width: 60,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(color: Color(0xFFFFAE00), width: 2)
                                        ),
                                        padding: EdgeInsets.all(10),
                                        child: Text(
                                          "A",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),

                                    Container(
                                      margin: EdgeInsets.only(top: 5),
                                      child: Text(
                                          "Payee Name",
                                          style: TextStyle(color: Colors.white),
                                      ),
                                    )
                                  ],
                                );
                              }
                            ),
                           Container(
                             margin: EdgeInsets.only(bottom: 20, left: 10,top: 20),
                             child: Text(
                               "Businesses and bills",
                               style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold,fontSize: 18),
                             ),
                           ),
                           GridView.builder(
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 4,
                                 mainAxisSpacing: 10,
                                 //crossAxisSpacing: 10,
                                 //mainAxisExtent: 70
                               ),
                               itemCount: 12,
                               itemBuilder: (context,index){
                                 return Column(
                                   children: [
                                     GestureDetector(
                                       child: Container(
                                         height: 60,
                                         width: 60,
                                         decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             border: Border.all(color: Color(0xFFFFAE00), width: 2)
                                         ),
                                         padding: EdgeInsets.all(10),
                                         child: Text(
                                           "A",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                         ),
                                       ),
                                     ),

                                     Container(
                                       margin: EdgeInsets.only(top: 5),
                                       child: Text(
                                         "Payee Name",
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     )
                                   ],
                                 );
                               }
                           ),
                           Container(
                             margin: EdgeInsets.only(bottom: 20, left: 10,top: 20),
                             child: Text(
                               "Promotions",
                               style: TextStyle(color: Color(0xFFFFAE00),fontWeight: FontWeight.bold,fontSize: 18),
                             ),
                           ),
                           GridView.builder(
                               shrinkWrap: true,
                               physics: NeverScrollableScrollPhysics(),
                               gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                 crossAxisCount: 4,
                                 mainAxisSpacing: 10,
                                 //crossAxisSpacing: 10,
                                 //mainAxisExtent: 70
                               ),
                               itemCount: 4,
                               itemBuilder: (context,index){
                                 return Column(
                                   children: [
                                     GestureDetector(
                                       child: Container(
                                         height: 60,
                                         width: 60,
                                         decoration: BoxDecoration(
                                             shape: BoxShape.circle,
                                             border: Border.all(color: Color(0xFFFFAE00), width: 2)
                                         ),
                                         padding: EdgeInsets.all(10),
                                         child: Text(
                                           "A",
                                           textAlign: TextAlign.center,
                                           style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                                         ),
                                       ),
                                     ),

                                     Container(
                                       margin: EdgeInsets.only(top: 5),
                                       child: Text(
                                         "Payee Name",
                                         style: TextStyle(color: Colors.white),
                                       ),
                                     )
                                   ],
                                 );
                               }
                           ),
                           Container(
                             margin: EdgeInsets.only(top: 30, bottom: 20, left: 10, right: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                        margin: EdgeInsets.only(right: 10),
                                         child: Icon(Icons.history,color: Color(0xFFFFAE00),)
                                     ),
                                     Text(
                                         "Show transaction history",
                                          style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                                 Icon(Icons.arrow_forward_ios_sharp,color: Color(0xFFFFAE00),size: 18,)
                               ],
                             ),
                           ),
                           Container(
                             margin: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                         margin: EdgeInsets.only(right: 10),
                                         child: Icon(Icons.account_balance_outlined,color: Color(0xFFFFAE00),)
                                     ),
                                     Text(
                                       "View accont balance",
                                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                                 Icon(Icons.arrow_forward_ios_sharp,color: Color(0xFFFFAE00),size: 18,)
                               ],
                             ),
                           ),
                           Container(
                             margin: EdgeInsets.only(top: 10, bottom: 20, left: 10, right: 10),
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
                               children: [
                                 Row(
                                   children: [
                                     Container(
                                         margin: EdgeInsets.only(right: 10),
                                         child: Icon(Icons.payments_outlined,color: Color(0xFFFFAE00),)
                                     ),
                                     Text(
                                       "Regular payments",
                                       style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                                     )
                                   ],
                                 ),
                                 Icon(Icons.arrow_forward_ios_sharp,color: Color(0xFFFFAE00),size: 18,)
                               ],
                             ),
                           ),
                         ],
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
}
