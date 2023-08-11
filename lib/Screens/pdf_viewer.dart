import 'dart:io';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';

class PdfViewerScreen extends StatefulWidget {

  bool isUrl;
  String url;
  File file;

  PdfViewerScreen(this.isUrl, this.url, this.file);

  @override
  State<PdfViewerScreen> createState() => _PdfViewerScreenState();
}

class _PdfViewerScreenState extends State<PdfViewerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111111),
      appBar: AppBar(
        backgroundColor: const Color(0xFF3A3A3A),
        title: Text(
          "PDF Viewer",
          style: TextStyle(
            color: Color(0xFFFFAE00),
          ),
        ),
      ),
      body: Container(
        child: widget.isUrl ? SfPdfViewer.network(
            widget.url,
            scrollDirection: PdfScrollDirection.horizontal
        ) : SfPdfViewer.file(
            widget.file,
            scrollDirection: PdfScrollDirection.horizontal
        ),
      ),
    );
  }
}
