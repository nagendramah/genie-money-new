import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:genie_money/Screens/campaign_url.dart';
import 'package:genie_money/data/remote/network/ApiHandler.dart';
import 'package:genie_money/Model/lead_model_class.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Lead extends StatefulWidget {
  final int? productid;
  final String? customerid, categoryid;
  const Lead({Key? key, this.productid, this.categoryid, this.customerid})
      : super(key: key);

  @override
  State<Lead> createState() => _LeadState();
}

class _LeadState extends State<Lead> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lead();
  }

  String? leadcode;
  String? campaignurl;
  String message = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFFAE00),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text("Lead Creation"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Text(
              message,
              style: const TextStyle(color: Color(0xFF111111), fontSize: 23),
            ),
          ),
          campaignurl != null
              ? Container(
                  margin: EdgeInsets.all(30),
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CampaignWebView(
                                      url: campaignurl,
                                    )));
                      },
                      child: Text(
                        campaignurl!,
                        style:
                            TextStyle(color: Color(0xFF111111), fontSize: 25),
                      )),
                )
              : Text(
                  "",
                  style: TextStyle(color: Color(0xFF111111), fontSize: 25),
                ),
        ],
      )),
    );
  }

  Future<void> lead() async {
    try {
      String url = "https://leadapi.banksathi.com/api/b2b/lead";
      Map<String, dynamic> body = {
        "customer_id": widget.customerid,
        "product_id": widget.productid.toString(),
        "category_id": widget.categoryid,
        "required_amount": "0"
      };
      final response = await ApiHandler.shared.postLead(url, body);
      if (response != null) {
        dynamic data = response.data;
        if (data is List<Data> && data.isEmpty) {
          leadcode = data[0].leadCode ?? "";
          campaignurl = data[0].campaignUrl ?? "";
        } else if (data is Data) {
          leadcode = data.leadCode;
          campaignurl = data.campaignUrl;
        }
        setState(() {
          message = response.message;
          if (message == "Product is not active") {
            message =
                "Your request has submitted successfully.GenieMoney will revert back you soon";
          }
        });
      }
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      ApiHandler.shared.showErrorDialog(context, "Url is not Available");
    }
  }
}
