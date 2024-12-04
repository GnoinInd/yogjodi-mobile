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
  final void Function() onSendInterestPressed;
  final void Function() onShortlistPressed;
  final void Function() onChatPressed;

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
    required this.onSendInterestPressed,
    required this.onShortlistPressed,
    required this.onChatPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      margin: const EdgeInsets.only(bottom: 20.0),
      decoration: BoxDecoration(
        color: ColorConstants.textWhite,
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
                            Center(
                              child: Text(
                                "${StringConstants.lastSeenAt}$lastSeen",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400,
                                  color: ColorConstants.color3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Center(
                              child: Text(
                                "$name, $age",
                                style: TextStyle(
                                  fontFamily: "Inter",
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.w600,
                                  color: ColorConstants.textBlack,
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
                                      state,
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
                                    width: 45.0,
                                    child: Text(
                                      religion,
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
                                        margin:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          annualIncome,
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
                                        margin:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          education,
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
                                        margin:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Text(
                                          maritalStatus,
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
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                height: 70.0,
                decoration: BoxDecoration(
                  color: ColorConstants.textWhite,
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
                            ),
                            const SizedBox(height: 6.0),
                            Text(
                              StringConstants.sendInterest,
                              style: TextStyle(
                                fontFamily: "Poppins",
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400,
                                color: ColorConstants.textBlack,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: onShortlistPressed,
                      icon: SizedBox(
                        width: 90.0,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
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
                                color: ColorConstants.textBlack,
                              ),
                              textAlign: TextAlign.center,
                            )
                          ],
                        ),
                      ),
                    ),
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
                                color: ColorConstants.textBlack,
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
          )
        ],
      ),
    );
  }
}
