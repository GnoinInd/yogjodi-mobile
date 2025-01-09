import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';
import 'package:yog_jodi/views/screens/match_profile_screen.dart';
import 'package:yog_jodi/views/screens/profile/profile_screen.dart';
import 'package:yog_jodi/views/screens/shortlisted_screen.dart';
import 'package:yog_jodi/views/widgets/border_button.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/custom_appbar.dart';
import '../widgets/match_item.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbar(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
          title: StringConstants.matches,
          subtitle: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                StringConstants.basedOn,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.color3,
                ),
                textAlign: TextAlign.center,
              ),
              Text(
                StringConstants.partnerDetails,
                style: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.color1,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                width: 2.0,
              ),
              GestureDetector(
                onTap: () {
                  Get.to(() => const ProfileScreen(tabIndex: 2));
                },
                child: const Icon(
                  Icons.edit_outlined,
                  size: 14.0,
                ),
              )
            ],
          ),
          onNotificationPressed: () {},
          onShortlistedPressed: () {
            Get.to(() => const ShortlistedScreen());
          },
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorConstants.color2,
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                children: [
                  BorderButton(
                    width: 90,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.filter,
                          fit: BoxFit.scaleDown,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          StringConstants.filter,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.textGrey,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 85,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.verified,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 85,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.married,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 130,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.neverMarried,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 130,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.handicap,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
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
                    onSendInterestPressed: () {},
                    onShortlistPressed: () {},
                    onChatPressed: () {},
                    onTap: () {
                      Get.to(() => const MatchProfileScreen());
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
