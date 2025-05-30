import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class MatchItem extends StatelessWidget {
  final String imageUrl;
  final String lastSeen;
  final String name;
  final String age;
  final String height;
  final String state;
  final String religion;
  final String profession;
  final String annualIncome;
  final String education;
  final String maritalStatus;
  final bool isVerified;
  final bool isShortlisted;
  final String membership;
  final String profileMatchPercent;
  final bool showOptions;
  final void Function()? onSendInterestPressed;
  final void Function()? onCancelInterestPressed;
  final void Function()? onDeclinedInterestPressed;
  final void Function()? onAcceptInterestPressed;
  final void Function()? onShortlistPressed;
  final void Function()? onRemindPressed;
  final void Function()? onChatPressed;
  final void Function()? onUnblockPressed;
  final void Function() onTap;

  const MatchItem({
    super.key,
    required this.imageUrl,
    required this.lastSeen,
    required this.name,
    required this.age,
    required this.height,
    required this.state,
    required this.religion,
    required this.profession,
    required this.annualIncome,
    required this.education,
    required this.maritalStatus,
    this.isVerified = false,
    this.isShortlisted = false,
    this.membership = "",
    this.profileMatchPercent = "",
    this.showOptions = true,
    this.onSendInterestPressed,
    this.onCancelInterestPressed,
    this.onDeclinedInterestPressed,
    this.onAcceptInterestPressed,
    this.onShortlistPressed,
    this.onRemindPressed,
    this.onChatPressed,
    this.onUnblockPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: showOptions ? 270 : 200,
        margin: const EdgeInsets.only(bottom: 20.0),
        decoration: BoxDecoration(
          color: ColorConstants.theWhite,
          borderRadius: BorderRadius.circular(6.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 2.0,
              blurRadius: 3.0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(
                  height: 200.0,
                  child: Row(
                    children: [
                      ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(6.0),
                          bottomRight: Radius.circular(20.0),
                        ),
                        child: CachedNetworkImage(
                          width: 150.0,
                          height: 200.0,
                          fit: BoxFit.cover,
                          imageUrl: imageUrl,
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10.0,
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Center(
                              //   child: Text(
                              //     "${StringConstants.lastSeenAt}$lastSeen",
                              //     style: TextStyle(
                              //       fontFamily: "Inter",
                              //       fontSize: 10.0,
                              //       fontWeight: FontWeight.w400,
                              //       color: ColorConstants.color3,
                              //     ),
                              //     textAlign: TextAlign.center,
                              //   ),
                              // ),
                              Row(
                                mainAxisAlignment: isVerified
                                    ? MainAxisAlignment.spaceBetween
                                    : MainAxisAlignment.center,
                                children: [
                                  if (isVerified)
                                    GestureDetector(
                                      onTap: () {
                                        if (isVerified) {
                                        } else {
                                          onTap();
                                        }
                                      },
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 0.0,
                                          vertical: 1.0,
                                        ),
                                        decoration: BoxDecoration(
                                          color: ColorConstants.theWhite,
                                          borderRadius:
                                              BorderRadius.circular(4.0),
                                          border: Border.all(
                                            color: ColorConstants.theWhite,
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
                                                color: ColorConstants.salem,
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
                                                AssetConstants
                                                    .acceptedInterests,
                                                fit: BoxFit.scaleDown,
                                                colorFilter: ColorFilter.mode(
                                                  ColorConstants.salem,
                                                  BlendMode.srcIn,
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  Center(
                                    child: Text(
                                      "${StringConstants.lastSeenAt}$lastSeen",
                                      style: TextStyle(
                                        fontFamily: "Inter",
                                        fontSize: 10.0,
                                        fontWeight: FontWeight.w400,
                                        color: ColorConstants.tundora,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ],
                              ),
                              Center(
                                child: Text(
                                  "$name, $age",
                                  style: TextStyle(
                                    fontFamily: "Inter",
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.w600,
                                    color: ColorConstants.theBlack,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              const SizedBox(height: 5.0),
                              Center(
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 45.0,
                                      child: Text(
                                        height,
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.tundora,
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
                                        state,
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.tundora,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    SvgPicture.asset(
                                      AssetConstants.dot,
                                      fit: BoxFit.scaleDown,
                                    ),
                                    SizedBox(
                                      width: 45.0,
                                      child: Text(
                                        religion,
                                        style: TextStyle(
                                          fontFamily: "Inter",
                                          fontSize: 10.0,
                                          fontWeight: FontWeight.w400,
                                          color: ColorConstants.tundora,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 15),
                              Expanded(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        SvgPicture.asset(
                                          AssetConstants.profession,
                                          fit: BoxFit.scaleDown,
                                        ),
                                        Container(
                                          width: 130.0,
                                          margin:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            profession,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstants.tundora,
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
                                          margin:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            annualIncome,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstants.tundora,
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
                                          margin:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            education,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstants.tundora,
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
                                          margin:
                                              const EdgeInsets.only(left: 10.0),
                                          child: Text(
                                            maritalStatus,
                                            style: TextStyle(
                                              fontFamily: "Inter",
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                              color: ColorConstants.tundora,
                                            ),
                                            textAlign: TextAlign.start,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                if (showOptions)
                  Container(
                    height: 70.0,
                    decoration: BoxDecoration(
                      color: ColorConstants.theWhite,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(5.0),
                        bottomRight: Radius.circular(5.0),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.shade300,
                          spreadRadius: 2.0,
                          blurRadius: 3.0,
                        ),
                      ],
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        if (onSendInterestPressed != null)
                          IconButton(
                            onPressed: onSendInterestPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.messenger,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.theBlack,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    StringConstants.sendInterest,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onCancelInterestPressed != null)
                          IconButton(
                            onPressed: onCancelInterestPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.close_sharp,
                                    color: ColorConstants.theBlack,
                                    size: 25.0,
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    StringConstants.cancelInterest,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onDeclinedInterestPressed != null)
                          IconButton(
                            onPressed: onDeclinedInterestPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.declinedInterests,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.theBlack,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    StringConstants.declineInterest,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onAcceptInterestPressed != null)
                          IconButton(
                            onPressed: onAcceptInterestPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.acceptedInterests,
                                    fit: BoxFit.scaleDown,
                                    colorFilter: ColorFilter.mode(
                                      ColorConstants.salem,
                                      BlendMode.srcIn,
                                    ),
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    StringConstants.acceptInterest,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onRemindPressed != null)
                          IconButton(
                            onPressed: onRemindPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.notifications_active_outlined,
                                    color: ColorConstants.theBlack,
                                    size: 25.0,
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    StringConstants.remind,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onShortlistPressed != null)
                          IconButton(
                            onPressed: onShortlistPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  isShortlisted
                                      ? SvgPicture.asset(
                                          AssetConstants.shortlistFilled,
                                          fit: BoxFit.scaleDown,
                                        )
                                      : SvgPicture.asset(
                                          AssetConstants.shortlist,
                                          fit: BoxFit.scaleDown,
                                        ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    StringConstants.shortlist,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onChatPressed != null)
                          IconButton(
                            onPressed: onChatPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    AssetConstants.chat,
                                    fit: BoxFit.scaleDown,
                                  ),
                                  const SizedBox(height: 6.0),
                                  Text(
                                    StringConstants.chat,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 12.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                        if (onUnblockPressed != null)
                          IconButton(
                            onPressed: onUnblockPressed,
                            icon: SizedBox(
                              width: 90.0,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.refresh,
                                    color: ColorConstants.theBlack,
                                    size: 25.0,
                                  ),
                                  const SizedBox(height: 2.0),
                                  Text(
                                    StringConstants.unblock,
                                    style: TextStyle(
                                      fontFamily: "Poppins",
                                      fontSize: 11.0,
                                      fontWeight: FontWeight.w400,
                                      color: ColorConstants.theBlack,
                                    ),
                                    textAlign: TextAlign.center,
                                  )
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  )
              ],
            ),
            Positioned(
              child: ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(6.0),
                  bottomRight: Radius.circular(20.0),
                ),
                child: CachedNetworkImage(
                  width: 150.0,
                  height: 200.0,
                  fit: BoxFit.cover,
                  imageUrl: imageUrl,
                ),
              ),
            ),
            if (membership.isNotEmpty)
              Positioned(
                left: 0,
                top: 0,
                child: GestureDetector(
                  onTap: () {
                    if (membership.isNotEmpty) {
                    } else {
                      onTap();
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 3.0,
                      vertical: 1.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black26,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(6.0),
                      ),
                    ),
                    child: Text(
                      membership,
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 10.0,
                        fontWeight: FontWeight.w600,
                        color: ColorConstants.theWhite,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            if (profileMatchPercent.isNotEmpty)
              Positioned(
                left: profileMatchPercent.length > 2 ? 114 : 120,
                top: 0,
                child: Text(
                  "$profileMatchPercent%",
                  style: TextStyle(
                    fontFamily: "Inter",
                    fontSize: 12.0,
                    fontWeight: FontWeight.w600,
                    color: ColorConstants.theWhite,
                    shadows: const [
                      Shadow(
                        color: Colors.black,
                        blurRadius: 6.0,
                      ),
                    ],
                  ),
                  textAlign: TextAlign.left,
                ),
              )
          ],
        ),
      ),
    );
  }
}
