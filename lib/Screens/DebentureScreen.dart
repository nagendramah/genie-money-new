// import 'package:flutter/material.dart';
// import 'package:genie_money/Model/home_menu_list_model.dart';
// import 'package:genie_money/Screens/Bank_Product_details_screen.dart';
// import 'package:genie_money/Screens/Credit_Card_Lead_Generation_Page.dart';
// import 'package:genie_money/utils/silver_delegate.dart';

// class DebentureScreen extends StatefulWidget {
//  // const DebentureScreen({Key? key}) : super(key: key);
// String InvestmentType;
// DebentureScreen({required this.InvestmentType});
//   @override
//   State<DebentureScreen> createState() => _DebentureScreenState();
// }

// class _DebentureScreenState extends State<DebentureScreen> {
//   late List<HomePageList> homepageList;
//   String type="";
//   @override
//   void initState() {
//     // if(widget.InvestmentType=="mutualfund"){
//     //   homepageList = [
//     //     HomePageList(
//     //         id: "112", name: "Funds India Navi", image: "images/fundsindia.jpeg", type: 'mutual_fund'),


//     //   ];
//     // }else if(widget.InvestmentType=="SIP"){
//     //   homepageList = [
//     //     HomePageList(
//     //         id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "sip"),


//     //   ];
//     // }
//    // else 
//     if(widget.InvestmentType=="Debenture"){
//       homepageList = [
//         HomePageList(
//             id: "112", name: "SmallCase", image: "images/smallcase.jpeg",type: "Debenture"),

//   // HomePageList(
//   //           id: "112", name: "AUGMONT GOLD SIP", image: "images/Augmont Gold.png",type: "Alternative investment"),
//   //             HomePageList(
//   //           id: "112", name: "LenDenClub", image: "images/LenDenClub.jpg",type: "Alternative investment"),
//       ];
//     }


//     super.initState();
//   }
//   var tempindex;

//   @override
//   Widget build(BuildContext context) {
//     double width = MediaQuery.of(context).size.width;
//     double height = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: const Color(0xFF111111),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF3A3A3A),
//         title: const Text(
//           "Debenture",
//           style: TextStyle(
//             color: Color(0xFFFFAE00),
//           ),
//         ),
//         leading: IconButton(
//           icon: const Icon(
//             Icons.arrow_back,
//             color: Color(0xFFFFAE00),
//           ),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//       ),
//       body: SafeArea(
//         child: Column(
//           children: [
//             Expanded(
//               child: Container(
//                 margin: const EdgeInsets.only(top: 10.0),
//                 child: GridView.builder(
//                   gridDelegate:
//                   SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight(
//                     crossAxisCount: 3,
//                     crossAxisSpacing: 5,
//                     mainAxisSpacing: 5,
//                     height: height * 0.30,
//                   ),
//                   itemCount: homepageList.length,
//                   itemBuilder: (BuildContext ctx, index) {
//                     tempindex=index;
//                     return GestureDetector(
//                       onTap: () async {
//                       //  Navigator.push(
//                       //       context,
//                       //       MaterialPageRoute(
//                       //           builder: (context) =>
//                       //               BankProductDetailsScreen(
//                       //                 bankName: homepageList[index].name,
//                       //               )));
//                         {
//                           showDialog(context: context, builder: (context){
//                             return AlertDialog(

//                               backgroundColor:  Color(0xFF3A3A3A),

//                               content: Container(
//                                 height: 111,
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Getting Activated Soon ",
//                                       style: TextStyle(color: Color(0xFFFFAE00), fontSize: 18),
//                                     ),
//                                     Container(

//                                       margin: const EdgeInsets.only(top: 40,bottom: 10),
//                                       height: 40,
//                                       width: 100,
//                                       child: ElevatedButton(
//                                         child: const Text(
//                                           "Ok",
//                                           style: TextStyle(
//                                               color:
//                                               Color(0xFF111111),
//                                               fontSize: 15.0,
//                                               fontWeight:
//                                               FontWeight.bold),
//                                         ),
//                                         style:
//                                         ElevatedButton.styleFrom(
//                                           fixedSize:
//                                           Size(30, 80.0),


//                                           primary:
//                                           const Color(0xFFFFAE00),
//                                           shadowColor:
//                                           const Color(0xFFFFAE00),
//                                           shape:
//                                           RoundedRectangleBorder(
//                                             borderRadius:
//                                             BorderRadius.circular(
//                                                 10.0),
//                                           ),
//                                         ),
//                                         onPressed: () async {

//                                           Navigator.pop(context);

//                                         }


//                                         ,
//                                       ),
//                                     ),

//                                   ],




//                                 ),

//                               ),
//                             );

//                           });
//                         }



//                       },
//                       child: Card(
//                         elevation: 10,
//                         shape: const RoundedRectangleBorder(
//                             borderRadius: BorderRadius.all(
//                               Radius.circular(10.0),
//                             ),
//                             side: BorderSide(
//                               color: Color(0xFFFFAE00),
//                               width: 2.0,
//                             )),
//                         color: const Color(0xFF444444),
//                         child: Center(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: <Widget>[
//                               Container(
//                                 margin: const EdgeInsets.only(top: 20.0),
//                                 child: Image(
//                                   image: AssetImage(homepageList[index].image),
//                                   width: 50.0,
//                                   height: 50.0,
//                                 ),
//                               ),
//                               Container(
//                                 margin: const EdgeInsets.only(
//                                     top: 10, left: 5.0, right: 5.0),
//                                 child: Text(
//                                   homepageList[index].name,
//                                   style: const TextStyle(
//                                     color: Color(0xFFFFAE00),
//                                     fontSize: 14.0,
//                                   ),
//                                   textAlign: TextAlign.center,
//                                   maxLines: 4,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ),
//                       ),
//                     );
//                   },
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
