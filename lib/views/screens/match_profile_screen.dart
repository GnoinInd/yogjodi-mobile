import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class MatchProfileScreen extends StatefulWidget {
  const MatchProfileScreen({super.key});

  @override
  State<MatchProfileScreen> createState() => _MatchProfileScreenState();
}

class _MatchProfileScreenState extends State<MatchProfileScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants.color1,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
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
                "Sagar Thakur, 24",
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
                background: CachedNetworkImage(
                  fit: BoxFit.cover,
                  imageUrl:
                      'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
                ),
              ),
            ),
            SliverFillRemaining(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: TabBarView(
                  // physics: const NeverScrollableScrollPhysics(),
                  children: [
                    ///Tab-1
                    ListView(
                      // physics: const ClampingScrollPhysics(),
                      children: [
                        ///Basic Details
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                      // physics: const ClampingScrollPhysics(),
                      children: [
                        ///Family
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: true,
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
                      // physics: const ClampingScrollPhysics(),
                      children: [
                        ///Basic Details
                        ExpansionTile(
                          tilePadding: const EdgeInsets.all(0),
                          dense: true,
                          shape: const Border(),
                          onExpansionChanged: null,
                          initiallyExpanded: true,
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
                                        StringConstants.residentialStatus
                                            .substring(
                                                0,
                                                StringConstants
                                                        .residentialStatus
                                                        .length -
                                                    1),
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
                          initiallyExpanded: true,
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
