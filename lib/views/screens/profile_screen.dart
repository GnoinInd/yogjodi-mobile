import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/update_family_details_screen.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  String appBarTitle = '';
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringConstants.profile,
            style: TextStyle(
              fontFamily: "Inter",
              fontSize: 18.0,
              fontWeight: FontWeight.w600,
              color: ColorConstants.color1,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.only(top: 20.0),
                labelPadding: const EdgeInsets.all(0.0),
                indicator: BoxDecoration(
                  color: ColorConstants.color1,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelColor: ColorConstants.textWhite,
                unselectedLabelColor: ColorConstants.color1,
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
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
              Expanded(
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
                                  onPressed: () {},
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
                                        StringConstants.height,
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
                                        StringConstants.maritalStatus,
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                        StringConstants.height,
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
                                        StringConstants.maritalStatus,
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
                                        StringConstants.residentialStatus,
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

                        ///Education
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
                                  onPressed: () {},
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
            ],
          ),
        ),
      ),
    );
  }
}
