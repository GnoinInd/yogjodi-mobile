import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:yog_jodi/common/constants/asset_constants.dart';
import 'package:yog_jodi/views/screens/activity_screen.dart';
import 'package:yog_jodi/views/screens/blocked_profiles_screen.dart';
import 'package:yog_jodi/views/screens/matches_screen.dart';
import 'package:yog_jodi/views/screens/partner_pref_screen.dart';
import 'package:yog_jodi/views/screens/profile/profile_screen.dart';
import 'package:yog_jodi/views/screens/search_screen.dart';
import 'package:yog_jodi/views/widgets/colored_button.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/circular_profile.dart';
import 'messanger_screen.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  PackageInfo? packageInfo;

  int _currentIndex = 0;

  // List of screens for each tab
  final List<Widget> _screens = const [
    MatchesScreen(),
    ActivityScreen(),
    SearchScreen(),
    MessengerScreen(),
  ];

  // Function to handle navigation
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

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
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        await _onBackPressed();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            StringConstants.appName,
            style: TextStyle(
              fontFamily: "Ikaros",
              fontSize: 22.0,
              fontWeight: FontWeight.w500,
              color: ColorConstants.textWhite,
            ),
            textAlign: TextAlign.center,
          ),
          backgroundColor: ColorConstants.color1,
          foregroundColor: ColorConstants.textWhite,
        ),
        drawer: customDrawer(),
        bottomNavigationBar: customBottomNavigation(),
        body: _screens[_currentIndex], // Display the current screen,
      ),
    );
  }

  Future<void> _onBackPressed() async {
    await showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            StringConstants.confirm,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          content: const Text(StringConstants.doYouWantToExitTheApp),
          actions: <Widget>[
            TextButton(
              child: const Text(
                StringConstants.no,
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //Will not exit the App
              },
            ),
            TextButton(
              child: const Text(
                StringConstants.yes,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                SystemNavigator.pop();
                Navigator.of(context).pop(); //Will exit the App
              },
            )
          ],
        );
      },
    );
  }

  Widget customDrawer() {
    return SafeArea(
      child: Drawer(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(20.0),
            bottomRight: Radius.circular(20.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 30.0,
                horizontal: 10.0,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProfileWithPercentIndicator(
                        size: 60,
                        completionPercentage: 80,
                        percentIndicatorColor: ColorConstants.color7,
                        imageSizeFactor: 2.1,
                        imagePath:
                            'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45', // Replace with actual image URL
                      ),
                      const SizedBox(width: 15.0),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 170,
                            child: Text(
                              "Vishvadip Thakor",
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                                color: ColorConstants.color3,
                              ),
                              textAlign: TextAlign.left,
                              // overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Row(
                            children: [
                              Text(
                                "80${StringConstants.percentProfile}",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.color7,
                                ),
                              ),
                              const SizedBox(width: 10.0),
                              GestureDetector(
                                onTap: () {
                                  Get.to(() => const ProfileScreen());
                                },
                                child: Text(
                                  StringConstants.editProfile,
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: ColorConstants.textRed,
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  ColoredButton(
                    width: 180,
                    color: ColorConstants.color1,
                    radius: 10.0,
                    padding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 10.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.aeroTopRight,
                          fit: BoxFit.scaleDown,
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          StringConstants.upgradeMembership,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.textWhite,
                          ),
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.partnerPreference,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.partnerPreferences,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(
                        () => const PartnerPrefScreen(),
                      );
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.blocked,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.blockedIgnoredProfile,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {
                      Get.to(
                        () => const BlockedProfilesScreen(),
                      );
                    },
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.astrologyServices,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.astrologyServices,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.phonebook,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.phonebook,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.settings,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.accountAndSettings,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.helpAndSupport,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.helpAndSupport,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.successStories,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.successStories,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),
                  ListTile(
                    leading: SvgPicture.asset(
                      AssetConstants.videoTour,
                      fit: BoxFit.scaleDown,
                    ),
                    title: Text(
                      StringConstants.videoTour,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.color3,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                    ),
                    onTap: () {},
                  ),

                  ///Logout
                  ListTile(
                    leading: Icon(
                      Icons.logout_sharp,
                      color: ColorConstants.textRed,
                    ),
                    title: Text(
                      StringConstants.logout,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: ColorConstants.textRed,
                      ),
                    ),
                    trailing: SvgPicture.asset(
                      AssetConstants.right,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.textRed,
                        BlendMode.srcIn,
                      ),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text(
                              StringConstants.confirm,
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            content: const Text(
                              StringConstants.doYouWantToLogout,
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(StringConstants.no),
                                onPressed: () {
                                  Navigator.pop(
                                      context); //Will not exit the App
                                },
                              ),
                              TextButton(
                                child: const Text(StringConstants.yes),
                                onPressed: () {
                                  // Navigator.pop(context); //Will exit the App
                                },
                              )
                            ],
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),

            ///App Version
            // Container(
            //   width: double.infinity,
            //   margin: const EdgeInsets.all(10.0),
            //   padding: const EdgeInsets.symmetric(
            //     vertical: 15.0,
            //     horizontal: 10.0,
            //   ),
            //   decoration: BoxDecoration(
            //     color: ColorConstants.color1,
            //     borderRadius: BorderRadius.circular(10.0),
            //   ),
            //   child: Text(
            //     StringConstants.appVersion +
            //         (packageInfo != null ? packageInfo!.version : ""),
            //     style: TextStyle(
            //       color: ColorConstants.textWhite,
            //       fontSize: 16.0,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }

  Widget customBottomNavigation() {
    return BottomNavigationBar(
      currentIndex: _currentIndex, // Set the current selected tab
      onTap: _onTabTapped, // Handle tab changes
      type: BottomNavigationBarType.fixed, // Ensures icons stay fixed
      selectedItemColor: ColorConstants.color1, // Selected item color
      unselectedItemColor: ColorConstants.color3, // Unselected item color
      selectedLabelStyle: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 13,
        fontWeight: FontWeight.w500,
      ),
      unselectedLabelStyle: const TextStyle(
        fontFamily: "Poppins",
        fontSize: 12,
        fontWeight: FontWeight.w300,
      ),
      items: [
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.matches,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: SvgPicture.asset(
            AssetConstants.matches,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorConstants.color1,
              BlendMode.srcIn,
            ),
          ),
          label: StringConstants.matches,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.activity,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: SvgPicture.asset(
            AssetConstants.activity,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorConstants.color1,
              BlendMode.srcIn,
            ),
          ),
          label: StringConstants.activity,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.search,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: SvgPicture.asset(
            AssetConstants.search,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorConstants.color1,
              BlendMode.srcIn,
            ),
          ),
          label: StringConstants.search,
        ),
        BottomNavigationBarItem(
          icon: SvgPicture.asset(
            AssetConstants.messenger,
            fit: BoxFit.scaleDown,
          ),
          activeIcon: SvgPicture.asset(
            AssetConstants.messenger,
            fit: BoxFit.scaleDown,
            colorFilter: ColorFilter.mode(
              ColorConstants.color1,
              BlendMode.srcIn,
            ),
          ),
          label: StringConstants.messenger,
        ),
      ],
    );
  }
}
