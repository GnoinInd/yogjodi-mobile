import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/image_gallery_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_family_details_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_about_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_basic_details_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_contact_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_edu_career_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_lifestyle_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_my_religion_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_about_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_basic_details_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_edu_occupation_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_lifestyle_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_religion_screen.dart';

import '../../../common/constants/asset_constants.dart';
import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/border_button.dart';

class ProfileScreen extends StatefulWidget {
  final int tabIndex;
  const ProfileScreen({
    this.tabIndex = 0,
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String appBarTitle = '';
  String profilePicturePrivacySetting = '';
  String contactPrivacySetting = '';
  String profilePicturePrivacySettingError = '';
  String contactPrivacySettingError = '';

  // bool validateProfilePicturePrivacySetting() {
  //   if (profilePicturePrivacySetting.isEmpty) {
  //     setState(() {
  //       profilePicturePrivacySettingError = "";
  //     });
  //     return false;
  //   } else {
  //     setState(() {
  //       profilePicturePrivacySettingError = '';
  //     });
  //     return true;
  //   }
  // }

  void _showFileSelectorBottomSheet() {
    showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return Container(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 20.0,
                left: 10.0,
                right: 10.0,
              ),
              width: double.infinity,
              height: 375.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(
                        Icons.close_rounded,
                        color: ColorConstants.textRed,
                      ),
                    ),
                  ),
                  const SizedBox(height: 10.0),
                  Text(
                    StringConstants.privacySetting,
                    style: TextStyle(
                      color: ColorConstants.color1,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.profilePicture,
                          style: TextStyle(
                            color: ColorConstants.color3,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            BorderButton(
                              width: 90,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: profilePicturePrivacySetting ==
                                      StringConstants.showToAll
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  profilePicturePrivacySetting =
                                      StringConstants.showToAll;
                                });
                              },
                              child: Text(
                                StringConstants.showToAll,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: profilePicturePrivacySetting ==
                                          StringConstants.showToAll
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            BorderButton(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: profilePicturePrivacySetting ==
                                      StringConstants.hideFromAll
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  profilePicturePrivacySetting =
                                      StringConstants.hideFromAll;
                                });
                              },
                              child: Text(
                                StringConstants.hideFromAll,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: profilePicturePrivacySetting ==
                                          StringConstants.hideFromAll
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            BorderButton(
                              width: 240,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: profilePicturePrivacySetting ==
                                      StringConstants.showToMyInterests
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  profilePicturePrivacySetting =
                                      StringConstants.showToMyInterests;
                                });
                              },
                              child: Text(
                                StringConstants.showToMyInterests,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: profilePicturePrivacySetting ==
                                          StringConstants.showToMyInterests
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        if (profilePicturePrivacySettingError.isNotEmpty)
                          Text(
                            profilePicturePrivacySettingError,
                            style: TextStyle(
                              color: ColorConstants.textRed,
                              fontSize: 12.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 15.0),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          StringConstants.contact1,
                          style: TextStyle(
                            color: ColorConstants.color3,
                            fontSize: 17.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 10),
                        Wrap(
                          spacing: 10.0,
                          runSpacing: 10.0,
                          children: [
                            BorderButton(
                              width: 90,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: contactPrivacySetting ==
                                      StringConstants.showToAll
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  contactPrivacySetting =
                                      StringConstants.showToAll;
                                });
                              },
                              child: Text(
                                StringConstants.showToAll,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: contactPrivacySetting ==
                                          StringConstants.showToAll
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            BorderButton(
                              width: 100,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: contactPrivacySetting ==
                                      StringConstants.hideFromAll
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  contactPrivacySetting =
                                      StringConstants.hideFromAll;
                                });
                              },
                              child: Text(
                                StringConstants.hideFromAll,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: contactPrivacySetting ==
                                          StringConstants.hideFromAll
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            BorderButton(
                              width: 240,
                              padding: const EdgeInsets.symmetric(
                                vertical: 5.0,
                                horizontal: 0.0,
                              ),
                              bgColor: ColorConstants.textWhite,
                              borderColor: contactPrivacySetting ==
                                      StringConstants.showToMyInterests
                                  ? ColorConstants.color1
                                  : ColorConstants.color5,
                              onPressed: () async {
                                setState(() {
                                  contactPrivacySetting =
                                      StringConstants.showToMyInterests;
                                });
                              },
                              child: Text(
                                StringConstants.showToMyInterests,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: contactPrivacySetting ==
                                          StringConstants.showToMyInterests
                                      ? ColorConstants.color1
                                      : ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        if (contactPrivacySettingError.isNotEmpty)
                          Text(
                            contactPrivacySettingError,
                            style: TextStyle(
                              color: ColorConstants.textRed,
                              fontSize: 12.0,
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      initialIndex: widget.tabIndex,
      child: Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              expandedHeight: MediaQuery.of(context).size.height / 2.5,
              floating: false,
              snap: false,
              pinned: true,
              backgroundColor: ColorConstants.color1,
              foregroundColor: ColorConstants.textWhite,
              iconTheme: IconThemeData(
                color: ColorConstants.textWhite,
                shadows: const [
                  Shadow(
                    color: Colors.black45,
                    blurRadius: 12.0,
                  )
                ],
              ),
              title: Text(
                StringConstants.profile,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.textWhite,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 12.0,
                    )
                  ],
                ),
                textAlign: TextAlign.center,
              ),
              bottom: TabBar(
                padding: const EdgeInsets.only(
                  top: 20.0,
                  left: 10.0,
                  right: 10.0,
                ),
                labelPadding: const EdgeInsets.all(0.0),
                indicator: BoxDecoration(
                  color: ColorConstants.textWhite,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                // labelColor: ColorConstants.textWhite,
                // unselectedLabelColor: ColorConstants.color1,
                labelStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.color1,
                ),
                unselectedLabelStyle: TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                  color: ColorConstants.textWhite,
                  shadows: const [
                    Shadow(
                      color: Colors.black45,
                      blurRadius: 10.0,
                    )
                  ],
                ),
                dividerHeight: 0.5,
                onTap: (i) {},
                tabs: const [
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.aboutMe),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.aboutFamily),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.aboutPartner),
                  ),
                ],
              ),
              flexibleSpace: FlexibleSpaceBar(
                background: Stack(
                  children: [
                    Positioned(
                      top: 0,
                      bottom: 0,
                      left: 0,
                      right: 0,
                      child: CachedNetworkImage(
                        fit: BoxFit.cover,
                        imageUrl:
                            'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
                      ),
                    ),
                    Positioned(
                      right: 10,
                      top: 100,
                      child: GestureDetector(
                        onTap: () {
                          Get.to(() => const ImageGalleryScreen());
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: CircleAvatar(
                            radius: 20.0,
                            backgroundColor: Colors.black26,
                            child: Icon(
                              Icons.my_library_add_outlined,
                              color: ColorConstants.textWhite,
                              size: 20.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (true)
                      Positioned(
                        left: 0,
                        bottom: 55.0,
                        child: GestureDetector(
                          onTap: () {
                            if (true) {}
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 10.0,
                              vertical: 5.0,
                            ),
                            decoration: const BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(6.0),
                                bottomRight: Radius.circular(6.0),
                              ),
                            ),
                            child: Text(
                              "Pro Max",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 15.0,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.textWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    if (true)
                      Positioned(
                        left: (MediaQuery.of(context).size.width / 2.0) - 30.0,
                        bottom: 56.0,
                        child: GestureDetector(
                          onTap: () {
                            if (true) {}
                          },
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 0.0,
                              vertical: 1.0,
                            ),
                            decoration: BoxDecoration(
                              color: ColorConstants.textWhite,
                              borderRadius: BorderRadius.circular(4.0),
                              border: Border.all(
                                color: ColorConstants.textWhite,
                              ),
                            ),
                            child: Row(
                              children: [
                                const SizedBox(width: 4.0),
                                Text(
                                  StringConstants.verified,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 10.0,
                                    fontWeight: FontWeight.w600,
                                    fontStyle: FontStyle.italic,
                                    color: ColorConstants.color7,
                                    shadows: const [
                                      Shadow(
                                        color: Colors.white38,
                                        blurRadius: 2.0,
                                      ),
                                    ],
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(
                                  height: 12.0,
                                  child: SvgPicture.asset(
                                    AssetConstants.acceptedInterests,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color7,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    Positioned(
                      right: 10,
                      bottom: 55.0,
                      child: IconButton(
                        onPressed: () {
                          _showFileSelectorBottomSheet();
                        },
                        icon: Icon(
                          Icons.settings_outlined,
                          color: ColorConstants.textWhite,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TabBarView(
                  children: [
                    ///Tab-1
                    ListView(
                      children: [
                        ///Basic Details
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.basicDetails,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.briefOutlineOfPersonalInfo,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdateMyBasicDetailsScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.name,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Abhinash Bhardwaj",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.height1,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "5 ft 8 in",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.motherTongue,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Hindi (Bihar)",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.location,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Patna (Bihar) - India ",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.annualIncome,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "8-10 Lakh p.a.",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.dateOfBirth,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "13 Mar 1998",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.maritalStatus1,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Never Married",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///About
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.about,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateThisDetail,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const UpdateMyAboutScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "PG Degree\n"
                                "Surprise Visits: If possible, surprise your partner with a visit. Even short, "
                                "unexpected visits can be incredibly special and memorable. Be Supportive: "
                                "Show support during tough times. Be there to listen, offer advice, or simply "
                                "provide comfort when your partner needs it. Trust and Honesty: Build trust by "
                                "being honest and open about your feelings.",
                                style: TextStyle(
                                  color: ColorConstants.color3,
                                  fontFamily: "Poppins",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Education And Career
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.educationAndCareer,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(
                                        () => const UpdateMyEduCareerScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.highestDegree,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "MCA",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.annualIncome,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "8-10 Lakh p.a.",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.occupation,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Software Developer",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Religion
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.religion,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(
                                        () => const UpdateMyReligionScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.religion,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.caste,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.motherTongue,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Contact
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.contact,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateThisDetail,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() => const UpdateMyContactScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.mobileNumber,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "+91-9876543210",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Life Style
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.lifeStyle,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(
                                        () => const UpdateMyLifestyleScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.drinkingHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.smokingHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.dietaryHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.specialCase,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ],
                    ),

                    ///Tab-2
                    ListView(
                      children: [
                        ///Family
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          title: Text(
                            StringConstants.family,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateThisDetail,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdateFamilyDetailsScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.familyType,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Nuclear",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.familyStatus,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Middle Class",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.numberOfBrothers,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.numberOfSisters,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "2",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.motherOccupation,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 12.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Housewife",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.familyLivingIn,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Patna (Bihar) - India",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    StringConstants.aboutMyFamily,
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  const SizedBox(height: 5.0),
                                  Text(
                                    "You must consider a number of factors before deciding on your"
                                    " career. Each factor plays a significant role in your choice."
                                    " Firstly, always assess yourself thoroughly. You must understand "
                                    "your area of interest to choose a career.",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),
                      ],
                    ),

                    ///Tab-3
                    ListView(
                      children: [
                        ///Basic Details
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: widget.tabIndex == 2,
                          title: Text(
                            StringConstants.basicDetails,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.briefOutlineOfPersonalInfo,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdatePartnerBasicDetailsScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.height1,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "5' 2\" - 5'6\"",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.age,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "18 years - 28 years",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.country,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "India",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.location,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Patna (Bihar) - India ",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.maritalStatus1,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Never Married",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.motherTongue,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Hindi (UP)",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.residentialStatus1,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 13.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Education
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: widget.tabIndex == 2,
                          title: Text(
                            StringConstants.educationAndOccupation,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdatePartnerEduOccupationScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.highestDegree,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "MCA",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.annualIncome,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "8-10 Lakh p.a.",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.occupation,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Software Developer",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Religion
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: widget.tabIndex == 2,
                          title: Text(
                            StringConstants.religion,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdatePartnerReligionScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.religion,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.caste,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.motherTongue,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///Lifestyle
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: widget.tabIndex == 2,
                          title: Text(
                            StringConstants.lifeStyle,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateTheseDetails,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(() =>
                                        const UpdatePartnerLifestyleScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.drinkingHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.smokingHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.dietaryHabits,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        StringConstants.specialCase,
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                      Text(
                                        ":",
                                        style: TextStyle(
                                          color: ColorConstants.color3,
                                          fontFamily: "Poppins",
                                          fontSize: 14.0,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 10.0),
                                Expanded(
                                  flex: 3,
                                  child: Text(
                                    "Doesn't matter",
                                    style: TextStyle(
                                      color: ColorConstants.color3,
                                      fontFamily: "Poppins",
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 30.0),
                          ],
                        ),

                        ///About Partner
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: widget.tabIndex == 2,
                          title: Text(
                            StringConstants.aboutPartner,
                            style: TextStyle(
                              color: ColorConstants.color1,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  StringConstants.updateThisDetail,
                                  style: TextStyle(
                                    color: ColorConstants.color1,
                                    fontFamily: "Inter",
                                    fontSize: 12.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Get.to(
                                        () => const UpdatePartnerAboutScreen());
                                  },
                                  icon: SvgPicture.asset(
                                    AssetConstants.edit,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.color1,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 10.0),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "PG Degree\n"
                                "Surprise Visits: If possible, surprise your partner with a visit. Even short, "
                                "unexpected visits can be incredibly special and memorable. Be Supportive: "
                                "Show support during tough times. Be there to listen, offer advice, or simply "
                                "provide comfort when your partner needs it. Trust and Honesty: Build trust by "
                                "being honest and open about your feelings.",
                                style: TextStyle(
                                  color: ColorConstants.color3,
                                  fontFamily: "Poppins",
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                            const SizedBox(height: 30.0),
                          ],
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
    );
  }
}
