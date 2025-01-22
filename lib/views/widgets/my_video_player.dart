import 'dart:io';

import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class MyVideoPlayer extends StatefulWidget {
  final String videoPath;

  const MyVideoPlayer({super.key, required this.videoPath});

  @override
  State<MyVideoPlayer> createState() => _MyVideoPlayerState();
}

class _MyVideoPlayerState extends State<MyVideoPlayer> {
  VideoPlayerController? videoPlayerController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    videoPlayerController = widget.videoPath.toLowerCase().startsWith("http")
        ? VideoPlayerController.networkUrl(
            Uri.parse(widget.videoPath),
            videoPlayerOptions: VideoPlayerOptions(),
          )
        : VideoPlayerController.file(
            File(widget.videoPath),
            videoPlayerOptions: VideoPlayerOptions(),
          );
    videoPlayerController!.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black87,
      child: Chewie(
        controller: ChewieController(
          aspectRatio: 16 / 9,
          allowMuting: false,
          showOptions: false,
          videoPlayerController: videoPlayerController!,
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    videoPlayerController!.dispose();
  }
}
