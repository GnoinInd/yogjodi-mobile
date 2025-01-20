import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/accepted_interests_screen.dart';
import 'package:yog_jodi/views/screens/declined_interests_screen.dart';
import 'package:yog_jodi/views/screens/interests_received_screen.dart';
import 'package:yog_jodi/views/screens/interests_sent_screen.dart';
import 'package:yog_jodi/views/screens/profile_viewed_screen.dart';
import 'package:yog_jodi/views/screens/shortlisted_screen.dart';
import 'package:yog_jodi/views/widgets/circular_profile.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/custom_appbar.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbar(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
          title: StringConstants.activity,
          onNotificationPressed: () {},
          onShortlistedPressed: () {},
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        color: ColorConstants.color2,
        child: ListView(
          padding: const EdgeInsets.symmetric(
            horizontal: 0.0,
            vertical: 0.0,
          ),
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 10.0,
                vertical: 20.0,
              ),
              child: Wrap(
                alignment: WrapAlignment.center,
                spacing: 20.0,
                runSpacing: 20.0,
                children: [
                  InterestItem(
                    value: "00",
                    title: StringConstants.acceptedInterests,
                    icon: SvgPicture.asset(
                      AssetConstants.acceptedInterests,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const AcceptedInterestsScreen());
                    },
                  ),
                  InterestItem(
                    value: "00",
                    title: StringConstants.interestsReceived,
                    icon: SvgPicture.asset(
                      AssetConstants.interestsReceived,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const InterestsReceivedScreen());
                    },
                  ),
                  InterestItem(
                    value: "00",
                    title: StringConstants.interestsSent,
                    icon: SvgPicture.asset(
                      AssetConstants.interestsSent,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const InterestsSentScreen());
                    },
                  ),
                  InterestItem(
                    value: "00",
                    title: StringConstants.shortlistedProfiles,
                    icon: SvgPicture.asset(
                      AssetConstants.shortlistedProfiles,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const ShortlistedScreen());
                    },
                  ),
                  InterestItem(
                    value: "00",
                    title: StringConstants.declinedInterests,
                    icon: SvgPicture.asset(
                      AssetConstants.declinedInterests,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const DeclinedInterestsScreen());
                    },
                  ),
                  InterestItem(
                    value: "00",
                    title: StringConstants.profileViewed,
                    icon: SvgPicture.asset(
                      AssetConstants.filteredInterests,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(() => const ProfileViewedScreen());
                    },
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 150.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              margin: const EdgeInsets.only(
                bottom: 15.0,
                left: 10.0,
                right: 10.0,
              ),
              decoration: BoxDecoration(
                color: ColorConstants.textWhite,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    StringConstants.thisMightInterestYou,
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 16.0,
                      fontWeight: FontWeight.w600,
                      color: ColorConstants.color3,
                    ),
                  ),
                  Container(
                    height: 50.0,
                    width: 160,
                    padding: const EdgeInsets.only(left: 15.0),
                    child: Stack(
                      children: [
                        CircularProfileWithPercentIndicator(
                          size: 50.0,
                          completionPercentage: 100.0,
                          percentIndicatorColor: ColorConstants.textWhite,
                          percentIndicatorStroke: 3.0,
                          imagePath:
                              'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                        ),
                        Positioned(
                          left: 40,
                          child: CircularProfileWithPercentIndicator(
                            size: 50.0,
                            completionPercentage: 100.0,
                            percentIndicatorColor: ColorConstants.textWhite,
                            percentIndicatorStroke: 1.0,
                            imagePath:
                                'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                          ),
                        ),
                        Positioned(
                          left: 80,
                          child: CircularProfileWithPercentIndicator(
                            size: 50.0,
                            completionPercentage: 100.0,
                            percentIndicatorColor: ColorConstants.textWhite,
                            percentIndicatorStroke: 1.0,
                            imagePath:
                                'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(
                        AssetConstants.maritalStatus,
                        fit: BoxFit.scaleDown,
                      ),
                      Container(
                        width: 150.0,
                        margin: const EdgeInsets.only(left: 10.0),
                        child: Text(
                          "10 ${StringConstants.profilesVisitedByYou}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.color3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 200.0,
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 16.0,
              ),
              margin: const EdgeInsets.only(
                bottom: 25.0,
                left: 10.0,
                right: 10.0,
              ),
              decoration: BoxDecoration(
                color: ColorConstants.textWhite,
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              StringConstants.tryPremium,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.textBlack,
                              ),
                            ),
                            Text(
                              StringConstants.seeWhoViewedYourProfile,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 10.0,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.color3,
                              ),
                              textAlign: TextAlign.start,
                            )
                          ],
                        ),
                        Container(
                          height: 50.0,
                          width: 160,
                          padding: const EdgeInsets.only(left: 5.0),
                          child: Stack(
                            children: [
                              CircularProfileWithPercentIndicator(
                                size: 50.0,
                                completionPercentage: 100.0,
                                percentIndicatorColor: ColorConstants.textWhite,
                                percentIndicatorStroke: 3.0,
                                imagePath:
                                    'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                              ),
                              Positioned(
                                left: 40,
                                child: CircularProfileWithPercentIndicator(
                                  size: 50.0,
                                  completionPercentage: 100.0,
                                  percentIndicatorColor:
                                      ColorConstants.textWhite,
                                  percentIndicatorStroke: 1.0,
                                  imagePath:
                                      'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                                ),
                              ),
                              Positioned(
                                left: 80,
                                child: CircularProfileWithPercentIndicator(
                                  size: 50.0,
                                  completionPercentage: 100.0,
                                  percentIndicatorColor:
                                      ColorConstants.textWhite,
                                  percentIndicatorStroke: 1.0,
                                  imagePath:
                                      'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 15.0,
                          ),
                          decoration: BoxDecoration(
                            color: ColorConstants.color10,
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          child: Text(
                            "${StringConstants.tryPremiumFor} ₹0",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: ColorConstants.textBlack,
                            ),
                          ),
                        ),
                        Text(
                          "1${StringConstants.dayFreeTrial}",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 10.0,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.color3,
                          ),
                          textAlign: TextAlign.start,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          AssetConstants.maritalStatus,
                          fit: BoxFit.scaleDown,
                        ),
                        Container(
                          width: 90.0,
                          margin: const EdgeInsets.only(left: 10.0),
                          child: Text(
                            "10 ${StringConstants.profilesVisitedByYou}",
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 12.0,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.color3,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 340,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${StringConstants.shortlistedProfiles} (10)",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.textBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringConstants.seeAll,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.textBlack,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      itemBuilder: (_, index) {
                        return ProfileItem(
                          imageUrl:
                              'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                          name: 'Sagar Thakur',
                          height: '5ft 10in',
                          state: 'Gujrat',
                          religion: 'Hindu',
                          profession: 'Software Developer',
                          annualIncome: '5-6 LPA',
                          education: 'MCA',
                          maritalStatus: 'Never Married',
                          onSendInterestPressed: () {},
                          onShortlistPressed: () {},
                          onChatPressed: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 340,
              margin: const EdgeInsets.only(bottom: 10.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${StringConstants.interestsSent} (10)",
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.textBlack,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            StringConstants.seeAll,
                            style: TextStyle(
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400,
                              color: ColorConstants.textBlack,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 5.0,
                        vertical: 10.0,
                      ),
                      itemBuilder: (_, index) {
                        return ProfileItem(
                          imageUrl:
                              'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                          name: 'Sagar Thakur',
                          height: '5ft 10in',
                          state: 'Gujrat',
                          religion: 'Hindu',
                          profession: 'Software Developer',
                          annualIncome: '5-6 LPA',
                          education: 'MCA',
                          maritalStatus: 'Never Married',
                          onSendInterestPressed: () {},
                          onShortlistPressed: () {},
                          onChatPressed: () {},
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InterestItem extends StatelessWidget {
  final String value;
  final String title;
  final Widget icon;
  final void Function() onTap;
  const InterestItem({
    super.key,
    required this.value,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 96.0,
        height: 106.0,
        padding: const EdgeInsets.symmetric(
          vertical: 6.0,
          horizontal: 10.0,
        ),
        decoration: BoxDecoration(
          color: ColorConstants.textWhite,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 1.0,
              blurRadius: 2.0,
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              value,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color3,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              title,
              style: TextStyle(
                fontFamily: "Inter",
                fontSize: 14.0,
                fontWeight: FontWeight.w300,
                color: ColorConstants.textBlack,
              ),
              textAlign: TextAlign.center,
            ),
            icon,
          ],
        ),
      ),
    );
  }
}

class ProfileItem extends StatefulWidget {
  final String imageUrl;
  final String name;
  final String height;
  final String state;
  final String religion;
  final String profession;
  final String annualIncome;
  final String education;
  final String maritalStatus;
  final void Function() onSendInterestPressed;
  final void Function() onShortlistPressed;
  final void Function() onChatPressed;

  const ProfileItem(
      {super.key,
      required this.imageUrl,
      required this.name,
      required this.height,
      required this.state,
      required this.religion,
      required this.profession,
      required this.annualIncome,
      required this.education,
      required this.maritalStatus,
      required this.onSendInterestPressed,
      required this.onShortlistPressed,
      required this.onChatPressed});

  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 190,
          height: 270,
          margin: const EdgeInsets.only(right: 10.0),
          decoration: BoxDecoration(
            color: ColorConstants.textWhite,
            borderRadius: BorderRadius.circular(10.0),
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0),
                ),
                child: Image.asset(
                  AssetConstants.backgroundImage7,
                  height: 60.0,
                  width: 190,
                  fit: BoxFit.cover,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5.0,
                    horizontal: 10.0,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 20.0),
                      Center(
                        child: Text(
                          widget.name,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                            color: ColorConstants.textBlack,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      const SizedBox(height: 1.0),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                widget.height,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SvgPicture.asset(
                              AssetConstants.dot,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                widget.state,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SvgPicture.asset(
                              AssetConstants.dot,
                              fit: BoxFit.scaleDown,
                            ),
                            SizedBox(
                              width: 50.0,
                              child: Text(
                                widget.religion,
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.profession,
                                  fit: BoxFit.scaleDown,
                                ),
                                Container(
                                  width: 130.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    widget.profession,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.color3,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.income,
                                  fit: BoxFit.scaleDown,
                                ),
                                Container(
                                  width: 130.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    widget.annualIncome,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.color3,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.education,
                                  fit: BoxFit.scaleDown,
                                ),
                                Container(
                                  width: 125.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    widget.education,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.color3,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(
                                  AssetConstants.maritalStatus,
                                  fit: BoxFit.scaleDown,
                                ),
                                Container(
                                  width: 130.0,
                                  margin: const EdgeInsets.only(left: 10.0),
                                  child: Text(
                                    widget.maritalStatus,
                                    style: TextStyle(
                                      fontFamily: "Inter",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.color3,
                                    ),
                                    textAlign: TextAlign.start,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 5),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            onPressed: widget.onSendInterestPressed,
                            icon: SizedBox(
                              width: 20.0,
                              child: SvgPicture.asset(
                                AssetConstants.messenger,
                                fit: BoxFit.scaleDown,
                                colorFilter: ColorFilter.mode(
                                  ColorConstants.textBlack,
                                  BlendMode.srcIn,
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: widget.onShortlistPressed,
                            icon: SizedBox(
                              width: 20.0,
                              child: SvgPicture.asset(
                                AssetConstants.shortlist,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: widget.onChatPressed,
                            icon: SizedBox(
                              width: 20.0,
                              child: SvgPicture.asset(
                                AssetConstants.chat,
                                fit: BoxFit.scaleDown,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
        Positioned(
          top: 30,
          left: 0,
          right: 0,
          child: CircularProfileWithPercentIndicator(
            size: 55.0,
            completionPercentage: 100.0,
            percentIndicatorColor: Colors.transparent,
            percentIndicatorStroke: 0.0,
            imageSizeFactor: 2,
            imagePath: widget.imageUrl,
          ),
        ),
      ],
    );
  }
}
