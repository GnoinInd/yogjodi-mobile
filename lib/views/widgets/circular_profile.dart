import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CircularProfileWithPercentIndicator extends StatelessWidget {
  final double completionPercentage;
  final String imagePath;
  final double size;
  final double percentIndicatorStroke;
  final Color percentIndicatorColor;
  final double imageSizeFactor;

  const CircularProfileWithPercentIndicator({
    super.key,
    required this.completionPercentage,
    required this.imagePath,
    this.size = 120,
    this.percentIndicatorStroke = 5.0,
    this.percentIndicatorColor = Colors.green,
    this.imageSizeFactor = 2.1,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        // Circular progress
        SizedBox(
          width: size,
          height: size,
          child: CircularProgressIndicator(
            value: completionPercentage / 100,
            strokeWidth: percentIndicatorStroke,
            strokeCap: StrokeCap.round,
            valueColor: AlwaysStoppedAnimation<Color>(percentIndicatorColor),
            backgroundColor: Colors.grey[300],
          ),
        ),
        // Profile image
        CircleAvatar(
          radius: size / imageSizeFactor,
          backgroundImage: CachedNetworkImageProvider(imagePath),
        ),
      ],
    );
  }
}
