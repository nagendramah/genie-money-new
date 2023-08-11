import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// ignore: must_be_immutable
class WebViewScreen extends StatefulWidget {
  String url, title;

  WebViewScreen(this.url, this.title, {Key? key}) : super(key: key);

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  // ignore: unused_field
  final _key = UniqueKey();
  bool isLoading = true;
  // ignore: unused_field
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (Platform.isAndroid) {
      // WebView.platform = AndroidWebView();
    }
    print(widget.url);
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          widget.title,
          style: TextStyle(
            color: const Color(0xFFFFAE00),
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
          ),
          color: const Color(0xFFFFAE00),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(top: 1.0),
                height: height,
                // child: WebView(
                //   key: _key,
                //   gestureNavigationEnabled: true,
                //   initialUrl: widget.url,
                //   javascriptMode: JavascriptMode.unrestricted,
                //   onPageStarted: (value) {
                //     Center(
                //       child: Visibility(
                //         visible: isLoading,
                //         child: const CircularProgressIndicator(),
                //       ),
                //     );
                //   },
                //   onPageFinished: (finish) {
                //     setState(() {
                //       isLoading = false;
                //     });
                //   },
                // ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
