import 'package:flutter/material.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';

import '../../common/constants/string_constants.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 24.0,
            color: ColorConstants.color1,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 265.0,
            padding: const EdgeInsets.symmetric(
              vertical: 20.0,
              horizontal: 30.0,
            ),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/image1.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.nowChatForFree,
                  style: TextStyle(
                    fontFamily: "Ikaros",
                    fontWeight: FontWeight.w400,
                    fontSize: 24.0,
                    color: Colors.white,
                  ),
                ),
                Text(
                  StringConstants.findingYourPerfectMatchJustBecameEasier,
                  style: TextStyle(
                    fontFamily: "Ikaros",
                    fontWeight: FontWeight.w400,
                    fontSize: 14.0,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
