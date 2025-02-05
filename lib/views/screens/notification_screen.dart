import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/no_data.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.notifications,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Random().nextInt(10) % 2 == 0 && false
          ? const NoData()
          : Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: ColorConstants.paleRose,
              child: ListView.builder(
                itemCount: 20,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                itemBuilder: (_, index) {
                  return ListTile(
                    leading: const CircleAvatar(
                      radius: 25.0,
                      backgroundImage: CachedNetworkImageProvider(
                        'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
                      ),
                    ),
                    title: Text(
                      "Title that contains the message of notification.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: Random().nextInt(50) % 2 == 0
                            ? FontWeight.bold
                            : FontWeight.normal,
                      ),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: ColorConstants.jazzberryJam,
                              ),
                            ),
                            child: Text(
                              "Button-1",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.jazzberryJam,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 5.0,
                              vertical: 2.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: ColorConstants.jazzberryJam,
                              ),
                            ),
                            child: Text(
                              "Button-2",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.jazzberryJam,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                    trailing: Text(
                      "${index + 1}d",
                      style: const TextStyle(
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    onTap: () {},
                  );
                },
              ),
            ),
    );
  }
}
