import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/constants/asset_constants.dart';

class MyImageViewer extends StatefulWidget {
  final String imagePath;

  const MyImageViewer({super.key, required this.imagePath});

  @override
  State<MyImageViewer> createState() => _MyImageViewerState();
}

class _MyImageViewerState extends State<MyImageViewer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: widget.imagePath.toLowerCase().startsWith("http")
          // ? Image.network(
          //     widget.imagePath,
          //     fit: BoxFit.cover,
          //     // width: 260,
          //     // height: 260 / 1.8,
          //     errorBuilder: (_, __, ___) {
          //       debugPrint("Image is not loading - ${widget.imagePath}");
          //       return Image.asset(
          //         CommonConstants.loadingImage,
          //         // width: 240,
          //         // height: 240 / 1.8,
          //         fit: BoxFit.fitHeight,
          //       );
          //     },
          //   )
          ? CachedNetworkImage(
              imageUrl: widget.imagePath,
              fit: BoxFit.cover,
              placeholder: (_, __) {
                return Image.asset(
                  AssetConstants.loadingImage,
                  fit: BoxFit.fitHeight,
                );
              },
              errorWidget: (_, __, ___) {
                debugPrint("Image is not loading - ${widget.imagePath}");
                return Image.asset(
                  AssetConstants.loadingImage,
                  fit: BoxFit.fitHeight,
                );
              },
            )
          : Image.file(
              File(widget.imagePath),
              fit: BoxFit.cover,
              // width: 260,
              // height: 260 / 1.8,
              errorBuilder: (_, __, ___) {
                debugPrint("Image is not loading - ${widget.imagePath}");
                return Image.asset(
                  AssetConstants.loadingImage,
                  // width: 240,
                  // height: 240 / 1.8,
                  fit: BoxFit.fitHeight,
                );
              },
            ),
    );
  }
}
