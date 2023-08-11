import 'package:flutter/material.dart';

import '../Model/dmt/bank_info_usermodel.dart';

class WalletHistory extends StatefulWidget {
  const WalletHistory({Key? key}) : super(key: key);

  @override
  State<WalletHistory> createState() => _WalletHistoryState();
}

class _WalletHistoryState extends State<WalletHistory> {
  BankInfoUserModel selectedValue = users.first;

  static final users = [
    BankInfoUserModel(
        name: 'Vijay', bankName: 'ICICI', accountNo: 15454547890, userId: 4),
    BankInfoUserModel(
        name: 'Aarti', bankName: 'ICICI', accountNo: 15454547890, userId: 3),
    BankInfoUserModel(
        name: 'Sunil', bankName: 'IDBI', accountNo: 1234567890, userId: 2),
    BankInfoUserModel(
        name: 'Vijay', bankName: 'ICICI', accountNo: 5545467890, userId: 0),
    BankInfoUserModel(
        name: 'Rajesh', bankName: 'HDFC', accountNo: 15454547890, userId: 4),
    BankInfoUserModel(
        name: 'Ranjan', bankName: 'ICICI', accountNo: 15454547890, userId: 3),
    BankInfoUserModel(
        name: 'Rahul', bankName: 'IDBI', accountNo: 1234567890, userId: 2),
    BankInfoUserModel(
        name: 'Vijay', bankName: 'ICICI', accountNo: 5545467890, userId: 0),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: const Text(
          "History",
          style: TextStyle(
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
        child: ListView.builder(
          // itemCount: ,
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    border: Border.all(color: const Color(0xFFFFAE00), width: 1)),
                margin:
                const EdgeInsets.only(top: 5, right: 10, bottom: 5, left: 10),
                padding: const EdgeInsets.all(5),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        //crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(
                              top: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Status : ",
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00), fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 4,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: const [
                                Text(
                                  "Amount ",
                                  style: TextStyle(
                                      color: Color(0xFFFFAE00), fontSize: 16),
                                ),
                                Text(
                                  "\u20B9" "2000",
                                  style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                                )
                              ],
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 4,
                            ),
                            child: Row(
                              children: [
                                Row(
                                  children: const [
                                    Text(
                                      "Date ",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00), fontSize: 16),
                                    ),
                                    Text(
                                      "21-07-2022",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: const [
                                    Text(
                                      "Time ",
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00), fontSize: 16),
                                    ),
                                    Text(
                                      "05:10:05 PM",
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 16),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.arrow_forward_ios),
                      color: const Color(0xFFFFAE00),
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            contentPadding: EdgeInsets.only(left: 10),
                            backgroundColor: const Color(0xFF111111),
                            title: const Center(
                                child: Text(
                                  "Details",
                                  style: TextStyle(color: Color(0xFFFFAE00)),
                                )),
                            content: Container(
                              margin: EdgeInsets.only(top: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6)),
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                // mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('Bank Name: ICICI',
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00), fontSize: 18)),
                                  SizedBox(height: 6),
                                  Text('Status: Added',
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00), fontSize: 18)),
                                  SizedBox(height: 6),
                                  Text('Ref Id: 6565656565',
                                      style: TextStyle(
                                          color: Color(0xFFFFAE00), fontSize: 18)),
                                ],
                              ),
                            ),
                            actions: const [
                              // Navigator.of(context).pop()
                            ],
                          ),
                        );
                      },
                    )
                  ],
                ),
              );
            }),
      ),
    );
  }
}