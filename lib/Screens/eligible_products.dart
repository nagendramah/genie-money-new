import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:genie_money/Model/personalLoan_productsModelclass.dart'
    as personalloanEligible;
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/Model/eligibleProductModel.dart' as eligibleProduct;
import 'package:genie_money/Model/creditcard_model.dart' as eligibleCreditCard;
import 'package:genie_money/Model/creditLineEligible.dart' as eligibleCreditLine;
import 'package:genie_money/Model/DematModel.dart' as eligibleDemat;
import 'Traditional_Banking_screen.dart';
import 'finalLead.dart';

class EligibleProduct extends StatefulWidget {
  final String? customerid, category_id, bankname, leadtype, account;
  const EligibleProduct(
      {Key? key,
      this.customerid,
      this.category_id,
      this.leadtype,
      this.account,
      this.bankname})
      : super(key: key);

  @override
  State<EligibleProduct> createState() => _EligibleProductState();
}

class _EligibleProductState extends State<EligibleProduct> {

  @override
  void initState() {
    super.initState();
    if (widget.account == "saving_account" ||
        widget.account == "current_account") {
      getAllEligibleProducts();
    } else if (widget.account == "personal_loan") {
      getPersonalEligible();
    }else if(widget.account == "Credit Card") {
      getCreditCardEligible();
    }else if(widget.account == "credit_lines") {
      getEligibleCreditLine();
    }else if(widget.account =="demat_account") {
      getEligibleDemat();
    }
  }

 /* personalloanEligible.EligibleProductList? personalaccdata;
  eligibleProduct.EligibleProductList? savingdata;
  eligibleProduct.EligibleProductList? currentdata;
  eligibleCreditCard.EligibleProductList? creditdata;*/
  int? productId;


  @override
  Widget build(BuildContext context) {
      return WillPopScope(
        onWillPop: () async {
          ShowDialoguebox(true);
          return false;
        },
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Eligible Product"),
            ),
            backgroundColor: Color(0xFFFFAE00),
            body: SafeArea(
                child: (widget.account == "saving_account") ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(child: ListView.builder(
                        itemCount: savingProductsList?.length,
                        itemBuilder: (BuildContext context, int index){
                          final  savingdata = savingProductsList![index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              //    elevation: 10,
                              contentPadding: EdgeInsets.all(10),

                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Color(0xFF111111),
                                    width: 2.0,
                                  )),
                              leading: Image.network(
                                savingdata.logo ?? "",
                                errorBuilder: (BuildContext context,
                                    Object exception,
                                    StackTrace? stackTrace) {
                                  return const Text("Image not Found");
                                },
                              ),
                              title: Text( savingdata.title ?? ""
                              ),
                              subtitle: Text(
                                  savingdata.subTitle ?? ""
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Lead(
                                              productid: savingdata.productId,
                                              customerid: widget.customerid,
                                              categoryid: widget.category_id,
                                            )));
                              },
                            ),
                          );
                    }))
                  ],
                ) : (widget.account == "current_account") ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(child: ListView.builder(
                        itemCount: currentProductsList?.length,
                        itemBuilder: (BuildContext context, int index){
                          final currentdata = currentProductsList![index];
                          return  Container(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              //    elevation: 10,
                              contentPadding: EdgeInsets.all(10),

                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Color(0xFF111111),
                                    width: 2.0,
                                  )),
                              leading: Image.network(currentdata.logo ?? "",
                                errorBuilder: (BuildContext context,
                                    Object exception,
                                    StackTrace? stackTrace) {
                                  return const Text("Image not Found");
                                },
                              ),
                              title: Text(currentdata?.title ?? ""),
                              subtitle: Text(
                                  currentdata.subTitle ?? ""),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Lead(
                                              productid: currentdata.productId,
                                              customerid: widget.customerid,
                                              categoryid: widget.category_id,
                                            )));
                              },
                            ),
                          );
                    }))
                  ],
                ) : (widget.account == "personal_loan") ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(child: ListView.builder(
                        itemCount: personalEligibleList!.length,
                        itemBuilder: (BuildContext context, int index){
                      final personalaccdata = personalEligibleList![index];
                   return  Padding(
                        padding: EdgeInsets.all(16.0),
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Lead(
                                          productid: personalaccdata.id,
                                          customerid: widget.customerid,
                                          categoryid: widget.category_id,
                                        )));
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(12.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.3),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(12.0),
                                    topRight: Radius.circular(12.0),
                                  ),
                                  child: Image.network(
                                    personalaccdata.bankLogo ?? "",
                                    width: MediaQuery.of(context).size.width,
                                    height: 200.0,
                                    fit: BoxFit.cover,
                                    errorBuilder: (BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace) {
                                      return Align(
                                          alignment: Alignment.center,
                                          child: const Text("Image not Found"));
                                    },
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        personalaccdata.title ?? "",
                                        style: TextStyle(
                                          fontSize: 24.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8.0),
                                      Text(
                                        personalaccdata.subTitle ?? "",
                                        style: TextStyle(
                                          fontSize: 18.0,
                                          color: Colors.grey[600],
                                        ),
                                      ),
                                      SizedBox(height: 16.0),
                                      ListTile(
                                        leading: Icon(Icons.attach_money),
                                        title: Text('Interest Rate'),
                                        subtitle: Text('${personalaccdata
                                            .interestRate ?? ""}%'),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.account_balance_wallet),
                                        title: Text('Processing Fees'),
                                        subtitle: Text(personalaccdata
                                            .processingFees?? ""),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.trending_up),
                                        title: Text('Loan Upto'),
                                        subtitle: Text(personalaccdata
                                            .loanUpto?? ""),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.schedule),
                                        title: Text('Tenure'),
                                        subtitle: Text(personalaccdata.tenure ?? ""),
                                      ),
                                      ListTile(
                                        leading: Icon(Icons.monetization_on),
                                        title: Text('Salary'),
                                        subtitle: Text('Rs. ${personalaccdata.salary ?? 0}'),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }))
                  ],
                ) :(widget.account ==
                    "credit_lines") ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(child: ListView.builder(
                        itemCount: eligibleCreditLineProductList?.length,
                        itemBuilder: (BuildContext context, int index){
                          final  crditlinedata = eligibleCreditLineProductList![index];
                          return Container(
                            margin: const EdgeInsets.all(10),
                            child: ListTile(
                              //    elevation: 10,
                              contentPadding: EdgeInsets.all(10),

                              shape: const RoundedRectangleBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(10.0),
                                  ),
                                  side: BorderSide(
                                    color: Color(0xFF111111),
                                    width: 2.0,
                                  )),
                              leading: Image.network(
                                crditlinedata.logo ?? "",
                                errorBuilder: (BuildContext context,
                                    Object exception,
                                    StackTrace? stackTrace) {
                                  return const Text("Image not Found");
                                },
                              ),
                              title: Text( crditlinedata.title ?? ""
                              ),
                              subtitle: Text(
                                  crditlinedata.subTitle ?? ""
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            Lead(
                                              productid: crditlinedata.productId,
                                              customerid: widget.customerid,
                                              categoryid: widget.category_id,
                                            )));
                              },
                            ),
                          );
                        }))
                  ],
                ) :(widget.account ==
                    "Credit Card") ? Flex(
                  direction: Axis.vertical,
                  children: [
                    Flexible(child: ListView.builder(
                        itemCount: crediteligibleList!.length,
                        itemBuilder: (BuildContext context, int index){
                      final  creditdata = crediteligibleList![index];
                      return  Card(
                        child: ListTile(
                          leading: Image.network(
                            creditdata.bankLogo ?? "",
                            width: 60,
                            height: 60,
                            errorBuilder: (BuildContext context,
                                Object exception,
                                StackTrace? stackTrace) {
                              return const Text("Image not Found");
                            },
                          ),
                          title: Text(creditdata.cardName ?? ""),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Annual Charges: ₹${creditdata
                                  .annualCharges ?? ""}'),
                              Text('Joining Fees: ₹${creditdata
                                  .joiningFees ?? ""}'),
                              SizedBox(height: 8),
                              Text(
                                'Benefits:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  for (String benefit in creditdata
                                      .benefits ?? [])
                                    Text('• $benefit'),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                'Main Benefits:',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment
                                    .start,
                                children: [
                                  for (String mainBenefit in creditdata
                                      .mainBenefits ?? [])
                                    Text('• $mainBenefit'),
                                ],
                              ),
                            ],
                          ),
                          trailing: const Icon(Icons.arrow_forward),
                          onTap: () {
                            // Handle card selection
                            // print('Card selected: ${product['cardName']}');
                          },
                        ),
                      );
                    }))
                  ],
                ): (widget.account == "demat_account") ? Flex(
              direction: Axis.vertical,
              children: [
                Flexible(child: ListView.builder(
                    itemCount: eligibleDematList?.length,
                    itemBuilder: (BuildContext context, int index){
                      final dematData = eligibleDematList![index];
                      return  Container(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          //    elevation: 10,
                          contentPadding: EdgeInsets.all(10),

                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(10.0),
                              ),
                              side: BorderSide(
                                color: Color(0xFF111111),
                                width: 2.0,
                              )),
                          leading: Image.network(dematData.logo ?? "",
                            errorBuilder: (BuildContext context,
                                Object exception,
                                StackTrace? stackTrace) {
                              return const Text("Image not Found");
                            },
                          ),
                          title: Text(dematData?.title ?? ""),
                          subtitle: Text(
                              dematData.subTitle ?? ""),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        Lead(
                                          productid: dematData.productId,
                                          customerid: widget.customerid,
                                          categoryid: widget.category_id,
                                        )));
                          },
                        ),
                      );
                    }))
              ],
            ) : Text("Nothing to show"),
            ),
          ),
        ),
      );
  }

  ShowDialoguebox(bool redirect) {
    Widget yesButton = TextButton(
      child: Text("No"),
      onPressed: () {
        Navigator.pop(context, 'No');
      },
    );
    Widget noButton = TextButton(
        child: Text("Yes"),
        onPressed: () async {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TraditionalBankingScreen()));
          //   SystemNavigator.pop();
        });
    AlertDialog alert = AlertDialog(
      title: Text("Exit"),
      content: Text("Do you wish to Exit ?"),
      actions: [
        yesButton,
        noButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  List<eligibleProduct.EligibleProductList>? eligibleProductList =
      <eligibleProduct.EligibleProductList>[];
  List<eligibleProduct.EligibleProductList>? savingProductsList =
      <eligibleProduct.EligibleProductList>[];
  List<eligibleProduct.EligibleProductList>? currentProductsList =
      <eligibleProduct.EligibleProductList>[];

  Future<void> getAllEligibleProducts() async {
    try {
      String url = "https://leadapi.banksathi.com/api/b2b/eligibleProductList";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "category_id": widget.category_id
      };
      final response = await ApiHandler.shared.postEligibleProduct(url, body);
      if (response != null) {
        setState(() {
          eligibleProduct.Data data = response.data;
          eligibleProductList = data.eligibleProductList;
          savingProductsList = eligibleProductList != null ? [] : null;
          currentProductsList = eligibleProductList != null ? [] : null;
          if (eligibleProductList != null) {
            for (int i = 0; i < eligibleProductList!.length; i++) {
              productId = eligibleProductList![i].productId;
              eligibleProduct.EligibleProductList product = eligibleProductList![i];
              if (product.title.toLowerCase().contains('saving') ||
                  product.subTitle.toLowerCase().contains('saving')) {
                savingProductsList!.add(product);
              } else if (product.title.toLowerCase().contains('current') ||
                  product.subTitle.toLowerCase().contains('current')) {
                currentProductsList!.add(product);
              }
            }
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        ApiHandler.shared.showErrorDialog(context, "Url is not Available");
      }
    }
  }

  List<personalloanEligible.EligibleProductList>? personalEligibleList = <personalloanEligible.EligibleProductList>[];

  Future<void> getPersonalEligible() async {
    try {
      String url = "https://leadapi.banksathi.com/api/b2b/eligibleProductList";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "category_id": widget.category_id
      };
      final response = await ApiHandler.shared.getPersonalEligible(url, body);
      setState(() {
        personalloanEligible.Data data = response.data;
        personalEligibleList = data.eligibleProductList;
        //personalEligibleList = personalEligibleList == null ? [] : null;
        if (personalEligibleList != null) {
          for (int i = 0; i < personalEligibleList!.length; i++) {
            productId = personalEligibleList![i].id;
          }
        }
      });
    } catch (e) {
      print(e);
      ApiHandler.shared.showErrorDialog(context, "Url is not available");
    }
  }


List<eligibleCreditCard.EligibleProductList>? crediteligibleList = <eligibleCreditCard.EligibleProductList>[];
  Future<void> getCreditCardEligible() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/eligibleProductList";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "category_id": widget.category_id
      };
      final response = await ApiHandler.shared.getCreditCardEligible(url, body);
      eligibleCreditCard.Data data = response.data;
      crediteligibleList = data.eligibleProductList;
      setState(() {});
    } catch (e) {
      print(e);
      ApiHandler.shared.showErrorDialog(context, "WoUrl is not Available");
    }
  }
  List<eligibleCreditLine.EligibleProductList>? eligibleCreditLineProductList =
  <eligibleCreditLine.EligibleProductList>[];
  Future<void> getEligibleCreditLine() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/eligibleProductList";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "category_id": widget.category_id
      };
      final response = await ApiHandler.shared.getCreditLineEligible(url, body);
      if (response != null) {
        eligibleCreditLine.Data data = response.data;
        eligibleCreditLineProductList = data.eligibleProductList;
      }
        setState(() {
        });

    } catch (e) {
      print(e);
      ApiHandler.shared.showErrorDialog(context, "Url is not Available");
    }
  }

  List<eligibleDemat.EligibleProductList> eligibleDematList = <eligibleDemat.EligibleProductList>[];
  Future<void> getEligibleDemat() async {
    try {
      String url =
          "https://leadapi.banksathi.com/api/b2b/eligibleProductList";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "category_id": widget.category_id
      };
      final response = await ApiHandler.shared.getDematEligible(url, body);
      if (response != null) {
        eligibleDemat.Data data = response.data;
        eligibleDematList = data.eligibleProductList;
      }
      setState(() {
      });

    } catch (e) {
      print(e);
      ApiHandler.shared.showErrorDialog(context, "Url is not Available");
    }
  }
}


