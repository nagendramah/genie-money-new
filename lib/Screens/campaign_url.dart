import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class CampaignWebView extends StatefulWidget {
  final String? url;
  const CampaignWebView({Key? key,this.url}) : super(key: key);

  @override
  State<CampaignWebView> createState() => _CampaignWebViewState();
}

class _CampaignWebViewState extends State<CampaignWebView> {
  late WebViewController _controller;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController();
    _controller.loadRequest(Uri.parse(widget.url!));
    _controller.setJavaScriptMode(JavaScriptMode.unrestricted);

  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: const Color(0xFF111111),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0xFFFFAE00),
        title: const Text("Genie Moneyy",
        style: TextStyle(
          color: Colors.black
        ),
        ),
      ),
      body: WebViewWidget(
        controller: _controller,

      ),
    );
  }
}
