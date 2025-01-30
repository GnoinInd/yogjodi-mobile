import 'dart:math';

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
      body: Random().nextInt(10) % 2 == 0
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
                  return Card(
                    elevation: 3.0,
                    child: ListTile(
                      title: Text(
                        "Notification Title $index",
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontWeight: Random().nextInt(50) % 2 == 0
                              ? FontWeight.bold
                              : FontWeight.normal,
                        ),
                      ),
                      subtitle: Text(
                        "${index + 2}/01/2025",
                        style: const TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12.0,
                        ),
                      ),
                      onTap: () {},
                    ),
                  );
                },
              ),
            ),
    );
  }
}
