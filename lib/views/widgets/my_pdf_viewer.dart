import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:pdfrx/pdfrx.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

class MyPdfViewer extends StatefulWidget {
  final String pdfPath;
  final void Function() onLoad;

  const MyPdfViewer({super.key, required this.pdfPath, required this.onLoad});

  @override
  State<MyPdfViewer> createState() => _MyPdfViewerState();
}

class _MyPdfViewerState extends State<MyPdfViewer> {
  @override
  Widget build(BuildContext context) {
    /// syncfusion_flutter_pdfviewer
    // return Container(
    //   child: widget.pdfPath.toLowerCase().startsWith("http")
    //       ? SfPdfViewer.network(
    //           widget.pdfPath,
    //           onDocumentLoaded: (_) {
    //             widget.onLoad();
    //           },
    //         )
    //       : SfPdfViewer.file(
    //           File(widget.pdfPath),
    //           onDocumentLoaded: (_) {
    //             widget.onLoad();
    //           },
    //         ),
    // );
    /// pdfrx
    // return Container(
    //   child: widget.pdfPath.toLowerCase().startsWith("http")
    //       ? PdfViewer.uri(
    //           Uri.parse(widget.pdfPath),
    //         )
    //       : PdfViewer.file(
    //           widget.pdfPath,
    //         ),
    // );
    /// flutter_pdfview
    return PDFView(
      filePath: widget.pdfPath,
      onRender: (_) {
        widget.onLoad();
      },
    );
  }
}
