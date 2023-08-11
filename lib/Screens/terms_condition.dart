// ignore: unnecessary_import
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:genie_money/Screens/otp_creditScoreCheck_page.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/Model/term_condition.dart';

// ignore: unused_import
import 'Credit_Card_Lead_Generation_Page.dart';

class TermAndCondition extends StatefulWidget {
  final String? mobilenumber,
      categoryid,
      customerid,
      bankname,
      leadtype,
      account;
  const TermAndCondition(
      {Key? key,
      this.mobilenumber,
      this.categoryid,
      this.customerid,
      this.account,
      this.leadtype,
      this.bankname})
      : super(key: key);

  @override
  State<TermAndCondition> createState() => _TermAndConditionState();
}

class _TermAndConditionState extends State<TermAndCondition> {
  @override
  void initState() {
    super.initState();
    initializeData();
  }

  String acceptedText = '';

  String? hyperlink_text;
  String? experian_logo;
  String? content_main_heading;
  String? content_sub_heading;
  String? content_p;

  Future<void> initializeData() async {
    await getTermsandCondition();
    // ignore: use_build_context_synchronously
    termsConditonsDialog(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF111111), body: Container());
  }

  termsConditonsDialog({required BuildContext context}) {
    final alert = AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      insetPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      contentPadding: const EdgeInsets.only(left: 10, right: 10, top: 10),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      title: const Center(
          child: Text(
        "Terms & Conditions",
        style: TextStyle(fontWeight: FontWeight.bold),
      )),
      content: SizedBox(
        height: MediaQuery.of(context).size.height - 30,
        width: MediaQuery.of(context).size.width - 70,
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Center(
                child: Html(
                  data: hyperlink_text,
                ),
              ),
              Center(
                child: Html(
                  data: '''
                  <img src="$experian_logo">
                ''',
                ),
              ),
              Center(
                child: Html(
                  data: content_main_heading,
                ),
              ),
              Center(child: Html(data: content_sub_heading)),
              Center(child: Html(data: content_p))
            ],
          ),
        ),
      ),
      // ),
      actions: [
        Row(
          // my changes mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Center(
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                minWidth: 120,
                color: Colors.green,
                onPressed: () {
                  setState(() {
                    acceptedText = "agree";
                  });
                  if (acceptedText == "agree") {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => OTPCreditScoreCheck(
                                  bankname: widget.bankname,
                                  account: widget.account,
                                  leadtype: widget.leadtype,
                                  mobilenumber: widget.mobilenumber,
                                  customerid: widget.customerid,
                                  categord_id: widget.categoryid,
                                  terms: acceptedText,
                                ) /*CreditCardLeadGeneration(bankname: widget.bankname!,account: widget.account!,leadtype: widget.leadtype!,)*/));
                  }
                },
                child:
                    const Text('Accept', style: TextStyle(color: Colors.white)),
              ),
            ),
            /* my changes Center(
              child: Container(
                height: 37,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.red)),
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  minWidth: 120,
                  onPressed: () {},
                  child: const Text(
                    'Decline',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ),*/
          ],
        ),
      ],
    );
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) => alert,
    );
  }

  Future<void> getTermsandCondition() async {
    try {
      String url = "https://leadapi.banksathi.com/api/b2b/creditScoreterms";
      final response = await ApiHandler.shared.getTermsAndCondition(url);
      // ignore: unnecessary_null_comparison
      if (response != null) {
        Data data = response.data;
        hyperlink_text = data.hyperlinkText;
        experian_logo = data.experianLogo;
        content_main_heading = data.contentMainHeading;
        content_sub_heading = data.contentSubHeading;
        content_p = data.contentP;
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
        ApiHandler.shared.showErrorDialog(context, "Url is not Available");
      }
    }
  }
}
