import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_about_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_basic_details_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_edu_occupation_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_lifestyle_screen.dart';
import 'package:yog_jodi/views/screens/profile/update_partner_religion_screen.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class PartnerPrefScreen extends StatefulWidget {
  const PartnerPrefScreen({super.key});

  @override
  State<PartnerPrefScreen> createState() => _PartnerPrefScreenState();
}

class _PartnerPrefScreenState extends State<PartnerPrefScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.partnerPreferences,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
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
                color: ColorConstants.jazzberryJam,
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
                      color: ColorConstants.jazzberryJam,
                      fontFamily: "Inter",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const UpdatePartnerBasicDetailsScreen());
                    },
                    icon: SvgPicture.asset(
                      AssetConstants.edit,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.jazzberryJam,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.height1,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.age,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.country,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.location,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.maritalStatus1,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.motherTongue,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.residentialStatus1,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 13.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                color: ColorConstants.jazzberryJam,
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
                      color: ColorConstants.jazzberryJam,
                      fontFamily: "Inter",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const UpdatePartnerEduOccupationScreen());
                    },
                    icon: SvgPicture.asset(
                      AssetConstants.edit,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.jazzberryJam,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.highestDegree,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.annualIncome,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.occupation,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                color: ColorConstants.jazzberryJam,
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
                      color: ColorConstants.jazzberryJam,
                      fontFamily: "Inter",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const UpdatePartnerReligionScreen());
                    },
                    icon: SvgPicture.asset(
                      AssetConstants.edit,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.jazzberryJam,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.religion,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.caste,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.motherTongue,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                color: ColorConstants.jazzberryJam,
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
                      color: ColorConstants.jazzberryJam,
                      fontFamily: "Inter",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(() => const UpdatePartnerLifestyleScreen());
                    },
                    icon: SvgPicture.asset(
                      AssetConstants.edit,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.jazzberryJam,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.drinkingHabits,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.smokingHabits,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.dietaryHabits,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          StringConstants.specialCase,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Text(
                          ":",
                          style: TextStyle(
                            color: ColorConstants.tundora,
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
                        color: ColorConstants.tundora,
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
                color: ColorConstants.jazzberryJam,
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
                      color: ColorConstants.jazzberryJam,
                      fontFamily: "Inter",
                      fontSize: 12.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      Get.to(
                        () => const UpdatePartnerAboutScreen(),
                      );
                    },
                    icon: SvgPicture.asset(
                      AssetConstants.edit,
                      fit: BoxFit.scaleDown,
                      colorFilter: ColorFilter.mode(
                        ColorConstants.jazzberryJam,
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
                    color: ColorConstants.tundora,
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
    );
  }
}
