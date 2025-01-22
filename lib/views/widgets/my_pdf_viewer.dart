// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
//
// class MyPdfViewer extends StatefulWidget {
//   final String pdfPath;
//   final void Function() onLoad;
//
//   const MyPdfViewer({super.key, required this.pdfPath, required this.onLoad});
//
//   @override
//   State<MyPdfViewer> createState() => _MyPdfViewerState();
// }
//
// class _MyPdfViewerState extends State<MyPdfViewer> {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: widget.pdfPath.toLowerCase().startsWith("http")
//           ? SfPdfViewer.network(
//               widget.pdfPath,
//               onDocumentLoaded: (_) {
//                 widget.onLoad();
//               },
//             )
//           : SfPdfViewer.file(
//               File(widget.pdfPath),
//               onDocumentLoaded: (_) {
//                 widget.onLoad();
//               },
//             ),
//     );
//   }
// }
