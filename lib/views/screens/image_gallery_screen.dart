import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/register/file_viewer.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class ImageGalleryScreen extends StatefulWidget {
  const ImageGalleryScreen({super.key});

  @override
  State<ImageGalleryScreen> createState() => _ImageGalleryScreenState();
}

class _ImageGalleryScreenState extends State<ImageGalleryScreen> {
  List<String> imageUrls = [
    "https://tse2.mm.bing.net/th?id=OIP.GHSFSZDRr1Rxd0_SdF6rbgHaE8&pid=Api",
    "https://tse1.mm.bing.net/th?id=OIP.v-TZih1hRCuh_UmnLwlHmgHaEK&pid=Api",
    "https://tse1.mm.bing.net/th?id=OIP.POqtXgrfSzbvXX4eQb0NXwHaEK&pid=Api",
    "https://tse2.mm.bing.net/th?id=OIP.Pq8MPxEGieC4WCJZzGYV2wHaEo&pid=Api",
    "https://plus.unsplash.com/premium_photo-1673292293042-cafd9c8a3ab3?q=80&w=1887&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
    "https://images.unsplash.com/photo-1509316975850-ff9c5deb0cd9?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8bmF0dXJlfGVufDB8MXwwfHx8MA%3D%3D",
    "https://plus.unsplash.com/premium_photo-1675433344518-21eb72dfc7a5?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8bmF0dXJlfGVufDB8MXwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1508349937151-22b68b72d5b1?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8bmF0dXJlfGVufDB8MXwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1529419412599-7bb870e11810?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8N3x8bmF0dXJlfGVufDB8MXwwfHx8MA%3D%3D",
    "https://images.unsplash.com/photo-1528994618239-4d83bbdb7a0f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fG5hdHVyZXxlbnwwfDF8MHx8fDA%3D",
    "https://plus.unsplash.com/premium_photo-1673603988651-99f79e4ae7d3?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OXx8bmF0dXJlfGVufDB8MHwwfHx8MA%3D%3D"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
        title: const Text(
          StringConstants.imageGallery,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorConstants.color8,
        onPressed: () {},
        child: Icon(
          Icons.add_a_photo_outlined,
          color: ColorConstants.color1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3, // Number of columns
            crossAxisSpacing: 8.0, // Space between columns
            mainAxisSpacing: 8.0, // Space between rows
          ),
          itemCount: imageUrls.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => FileViewer(filePath: imageUrls[index]));
              },
              onLongPress: () {},
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Rounded corners
                child: CachedNetworkImage(
                  imageUrl: imageUrls[index],
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Center(
                    child: CircularProgressIndicator(
                      color: ColorConstants.color1,
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(
                    Icons.error,
                    color: ColorConstants.textRed,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
