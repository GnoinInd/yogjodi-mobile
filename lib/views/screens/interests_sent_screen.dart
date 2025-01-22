import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/match_item.dart';
import 'match_profile_screen.dart';

class InterestsSentScreen extends StatefulWidget {
  const InterestsSentScreen({super.key});

  @override
  State<InterestsSentScreen> createState() => _InterestsSentScreenState();
}

class _InterestsSentScreenState extends State<InterestsSentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
        title: const Text(
          StringConstants.interestsSent,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView.builder(
        itemCount: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 10.0,
        ),
        itemBuilder: (_, index) {
          return MatchItem(
            imageUrl: false
                ? 'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45'
                : 'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
            lastSeen: '6:24 AM',
            name: 'Sagar Thakur',
            age: '24',
            height: '5ft 10in',
            state: 'Gujrat',
            religion: 'Hindu',
            profession: 'Software Developer',
            annualIncome: '5-6 LPA',
            education: 'MCA',
            maritalStatus: 'Never Married',
            isVerified: true,
            membership: "Pro Max",
            profileMatchPercent: "55",
            onCancelInterestPressed: () {},
            onRemindPressed: () {},
            onChatPressed: () {},
            onTap: () {
              Get.to(() => const MatchProfileScreen(
                    buttonTypes: [
                      ButtonType.cancelInterest,
                      ButtonType.remind,
                      ButtonType.chat,
                    ],
                  ));
            },
          );
        },
      ),
    );
  }
}
