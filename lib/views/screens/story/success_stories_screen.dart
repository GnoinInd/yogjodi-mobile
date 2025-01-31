import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/story/add_story.dart';
import 'package:yog_jodi/views/screens/story/full_story_screen.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';

class SuccessStoriesScreen extends StatefulWidget {
  const SuccessStoriesScreen({super.key});

  @override
  State<SuccessStoriesScreen> createState() => _SuccessStoriesScreenState();
}

class _SuccessStoriesScreenState extends State<SuccessStoriesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.successStories,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.delete_forever),
          ),
          const SizedBox(width: 10.0),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorConstants.paleRose,
        child: ListView.builder(
          itemCount: 20,
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
            vertical: 10.0,
          ),
          itemBuilder: (_, index) {
            return GestureDetector(
              onTap: () {
                Get.to(() => FullStoryScreen(index: index));
              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15.0),
                margin: const EdgeInsets.symmetric(vertical: 10.0),
                decoration: BoxDecoration(
                  color: ColorConstants.theWhite,
                  borderRadius: BorderRadius.circular(16.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.shade400,
                      spreadRadius: 1.0,
                      blurRadius: 5.0,
                      offset: const Offset(2.0, 2.0),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Hero(
                          tag: index,
                          child: CachedNetworkImage(
                            height: MediaQuery.of(context).size.width / 1.2,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            imageUrl:
                                'https://plus.unsplash.com/premium_photo-1682090789715-a1acbfe72404',
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            color: Colors.black26,
                            child: Text(
                              "Groom ~ Bride",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 18.0,
                                color: ColorConstants.theWhite,
                                fontWeight: FontWeight.w600,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10.0),
                    Text(
                      "A quick brown fox jumps over the lazy dog. " * 5,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.justify,
                      style: const TextStyle(fontFamily: "Inter"),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: ColorConstants.paleRose,
        foregroundColor: ColorConstants.jazzberryJam,
        onPressed: () {
          Get.to(() => const AddStory());
        },
        icon: const Icon(Icons.add),
        label: const Text(
          StringConstants.addStory,
          style: TextStyle(
            fontFamily: "Inter",
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
