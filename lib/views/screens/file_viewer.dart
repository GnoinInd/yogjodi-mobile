import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
// import 'package:syncfusion_flutter_pdfviewer/pdfviewer.dart';
// import 'package:pdfrx/pdfrx.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:video_player/video_player.dart';
import 'package:yog_jodi/common/utils/utility_methods.dart';

import '../widgets/my_audio_player.dart';

class FileViewer extends StatefulWidget {
  final String filePath;

  const FileViewer({super.key, required this.filePath});

  @override
  State<FileViewer> createState() => _FileViewerState();
}

class _FileViewerState extends State<FileViewer> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    if ((widget.filePath.toLowerCase().endsWith("mp4") ||
        widget.filePath.toLowerCase().endsWith("mpeg4"))) {
      videoPlayerController = widget.filePath.toLowerCase().startsWith("http")
          ? VideoPlayerController.networkUrl(
              Uri.parse(widget.filePath),
              videoPlayerOptions: VideoPlayerOptions(),
            )
          : VideoPlayerController.file(
              File(widget.filePath),
              videoPlayerOptions: VideoPlayerOptions(),
            );
      videoPlayerController!.initialize();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        iconTheme: const IconThemeData(color: Colors.white),
        actions: [
          if ((widget.filePath.toLowerCase().endsWith("pdf")))
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 20.0),
              child: Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      UtilityMethods.download(context, widget.filePath);
                    },
                    child: const Icon(Icons.download),
                  ),
                ],
              ),
            ),
        ],
      ),
      backgroundColor: Colors.black87,
      body: Center(
        child: (widget.filePath.toLowerCase().endsWith("jpg") ||
                widget.filePath.toLowerCase().endsWith("jpe") ||
                widget.filePath.toLowerCase().endsWith("jpeg") ||
                widget.filePath.toLowerCase().endsWith("png"))
            ? imageView(context)
            : (widget.filePath.toLowerCase().endsWith("mp4") ||
                    widget.filePath.toLowerCase().endsWith("mpeg4"))
                ? videoView(context)
                : (widget.filePath.toLowerCase().endsWith("mp3") ||
                        widget.filePath.toLowerCase().endsWith("wav") ||
                        widget.filePath.toLowerCase().endsWith("aac"))
                    ? audioView()
                    : (widget.filePath.toLowerCase().endsWith("pdf"))
                        ? pdfView()
                        : imageView(context),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    if (videoPlayerController != null) {
      videoPlayerController!.dispose();
    }
  }

  Widget pdfView() {
    /// syncfusion_flutter_pdfviewer
    // return Container(
    //   child: widget.filePath.toLowerCase().startsWith("http")
    //       ? SfPdfViewer.network(
    //           widget.filePath,
    //         )
    //       : SfPdfViewer.file(
    //           File(widget.filePath),
    //         ),
    // );
    /// pdfrx
    // return Container(
    //   child: widget.filePath.toLowerCase().startsWith("http")
    //       ? PdfViewer.uri(
    //           Uri.parse(widget.filePath),
    //         )
    //       : PdfViewer.file(
    //           widget.filePath,
    //         ),
    // );
    /// flutter_pdfview
    return PDFView(
      filePath: widget.filePath,
    );
  }

  Widget audioView() {
    return SizedBox(
      height: 150,
      child: MyAudioPlayer(audioPath: widget.filePath),
    );
  }

  Widget videoView(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Chewie(
        controller: ChewieController(
          aspectRatio: 16 / 9,
          autoPlay: true,
          // fullScreenByDefault: true,
          videoPlayerController: videoPlayerController!,
        ),
      ),
    );
  }

  Widget imageView(BuildContext context) {
    return widget.filePath.toLowerCase().startsWith("http")
        ? SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: AspectRatio(
              aspectRatio: 1,
              child: PhotoViewGallery.builder(
                backgroundDecoration:
                    const BoxDecoration(color: Colors.black87),
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    // maxScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained,
                    imageProvider: CachedNetworkImageProvider(widget.filePath),
                    initialScale: PhotoViewComputedScale.contained,
                  );
                },
                itemCount: 1,
              ),
            ),
          )
        : SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: AspectRatio(
              aspectRatio: 1,
              child: PhotoViewGallery.builder(
                backgroundDecoration:
                    const BoxDecoration(color: Colors.black87),
                scrollPhysics: const BouncingScrollPhysics(),
                builder: (BuildContext context, int index) {
                  return PhotoViewGalleryPageOptions(
                    // maxScale: PhotoViewComputedScale.contained,
                    minScale: PhotoViewComputedScale.contained,
                    imageProvider: FileImage(File(widget.filePath)),
                    initialScale: PhotoViewComputedScale.contained,
                  );
                },
                itemCount: 1,
              ),
            ),
          );
  }
}
