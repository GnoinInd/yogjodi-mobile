import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/colored_button.dart';

class AccountAndSettingsScreen extends StatefulWidget {
  const AccountAndSettingsScreen({super.key});

  @override
  State<AccountAndSettingsScreen> createState() =>
      _AccountAndSettingsScreenState();
}

class _AccountAndSettingsScreenState extends State<AccountAndSettingsScreen> {
  String mobileNoPrivacySetting = '';
  String photoAlbumPrivacySetting = '';
  String profilePrivacySetting = '';
  String profileImagePrivacySetting = '';
  String lastSeenPrivacySetting = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.accountAndSettings,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        child: Column(
          children: [
            const SizedBox(height: 35.0),
            Text(
              StringConstants.privacySetting,
              style: TextStyle(
                color: ColorConstants.jazzberryJam,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.mobileNo,
                    style: TextStyle(
                      color: ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor:
                            mobileNoPrivacySetting == StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            mobileNoPrivacySetting = StringConstants.showToAll;
                          });
                        },
                        child: Text(
                          StringConstants.showToAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: mobileNoPrivacySetting ==
                                    StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor: mobileNoPrivacySetting ==
                                StringConstants.hideFromAll
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            mobileNoPrivacySetting =
                                StringConstants.hideFromAll;
                          });
                        },
                        child: Text(
                          StringConstants.hideFromAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: mobileNoPrivacySetting ==
                                    StringConstants.hideFromAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: mobileNoPrivacySetting ==
                                StringConstants.onlyToInterestSentAccepted
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            mobileNoPrivacySetting =
                                StringConstants.onlyToInterestSentAccepted;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToInterestSentAccepted,
                          style: TextStyle(
                            fontSize: 12,
                            color: mobileNoPrivacySetting ==
                                    StringConstants.onlyToInterestSentAccepted
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.photoAlbum,
                    style: TextStyle(
                      color: ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor: photoAlbumPrivacySetting ==
                                StringConstants.showToAll
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            photoAlbumPrivacySetting =
                                StringConstants.showToAll;
                          });
                        },
                        child: Text(
                          StringConstants.showToAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: photoAlbumPrivacySetting ==
                                    StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 145,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: photoAlbumPrivacySetting ==
                                StringConstants.onlyToPaidMatches
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            photoAlbumPrivacySetting =
                                StringConstants.onlyToPaidMatches;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToPaidMatches,
                          style: TextStyle(
                            fontSize: 12,
                            color: photoAlbumPrivacySetting ==
                                    StringConstants.onlyToPaidMatches
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: photoAlbumPrivacySetting ==
                                StringConstants.onlyToInterestSentAccepted
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            photoAlbumPrivacySetting =
                                StringConstants.onlyToInterestSentAccepted;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToInterestSentAccepted,
                          style: TextStyle(
                            fontSize: 12,
                            color: photoAlbumPrivacySetting ==
                                    StringConstants.onlyToInterestSentAccepted
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.profile1,
                    style: TextStyle(
                      color: ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor:
                            profilePrivacySetting == StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profilePrivacySetting = StringConstants.showToAll;
                          });
                        },
                        child: Text(
                          StringConstants.showToAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: profilePrivacySetting ==
                                    StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor:
                            profilePrivacySetting == StringConstants.hideFromAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profilePrivacySetting = StringConstants.hideFromAll;
                          });
                        },
                        child: Text(
                          StringConstants.hideFromAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: profilePrivacySetting ==
                                    StringConstants.hideFromAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 230,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: profilePrivacySetting ==
                                StringConstants.onlyToMatchesThatFitMyCriteria
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profilePrivacySetting =
                                StringConstants.onlyToMatchesThatFitMyCriteria;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToMatchesThatFitMyCriteria,
                          style: TextStyle(
                            fontSize: 12,
                            color: profilePrivacySetting ==
                                    StringConstants
                                        .onlyToMatchesThatFitMyCriteria
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.profileImage,
                    style: TextStyle(
                      color: ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor: profileImagePrivacySetting ==
                                StringConstants.showToAll
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profileImagePrivacySetting =
                                StringConstants.showToAll;
                          });
                        },
                        child: Text(
                          StringConstants.showToAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: profileImagePrivacySetting ==
                                    StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor: profileImagePrivacySetting ==
                                StringConstants.hideFromAll
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profileImagePrivacySetting =
                                StringConstants.hideFromAll;
                          });
                        },
                        child: Text(
                          StringConstants.hideFromAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: profileImagePrivacySetting ==
                                    StringConstants.hideFromAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 200,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: profileImagePrivacySetting ==
                                StringConstants.onlyToInterestSentAccepted
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            profileImagePrivacySetting =
                                StringConstants.onlyToInterestSentAccepted;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToInterestSentAccepted,
                          style: TextStyle(
                            fontSize: 12,
                            color: profileImagePrivacySetting ==
                                    StringConstants.onlyToInterestSentAccepted
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Align(
              alignment: Alignment.centerLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    StringConstants.lastSeen,
                    style: TextStyle(
                      color: ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor:
                            lastSeenPrivacySetting == StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            lastSeenPrivacySetting = StringConstants.showToAll;
                          });
                        },
                        child: Text(
                          StringConstants.showToAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: lastSeenPrivacySetting ==
                                    StringConstants.showToAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
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
                        bgColor: ColorConstants.theWhite,
                        borderColor: lastSeenPrivacySetting ==
                                StringConstants.hideFromAll
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            lastSeenPrivacySetting =
                                StringConstants.hideFromAll;
                          });
                        },
                        child: Text(
                          StringConstants.hideFromAll,
                          style: TextStyle(
                            fontSize: 12,
                            color: lastSeenPrivacySetting ==
                                    StringConstants.hideFromAll
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      BorderButton(
                        width: 175,
                        padding: const EdgeInsets.symmetric(
                          vertical: 5.0,
                          horizontal: 0.0,
                        ),
                        bgColor: ColorConstants.theWhite,
                        borderColor: lastSeenPrivacySetting ==
                                StringConstants.onlyToAcceptedMatches
                            ? ColorConstants.jazzberryJam
                            : ColorConstants.silver,
                        onPressed: () async {
                          setState(() {
                            lastSeenPrivacySetting =
                                StringConstants.onlyToAcceptedMatches;
                          });
                        },
                        child: Text(
                          StringConstants.onlyToAcceptedMatches,
                          style: TextStyle(
                            fontSize: 12,
                            color: lastSeenPrivacySetting ==
                                    StringConstants.onlyToAcceptedMatches
                                ? ColorConstants.jazzberryJam
                                : ColorConstants.tundora,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 40.0),
            Visibility(
              visible: true,
              replacement: Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.theWhite,
                  strokeWidth: 3.0,
                ),
              ),
              child: ColoredButton(
                radius: 50.0,
                color: ColorConstants.brickRed,
                onPressed: () async {},
                child: Text(
                  StringConstants.save,
                  style: TextStyle(
                    fontSize: 18,
                    color: ColorConstants.theWhite,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 35.0),
            Text(
              StringConstants.account,
              style: TextStyle(
                color: ColorConstants.jazzberryJam,
                fontSize: 20.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 25.0),
            Visibility(
              visible: true,
              replacement: Center(
                child: CircularProgressIndicator(
                  color: ColorConstants.theWhite,
                  strokeWidth: 3.0,
                ),
              ),
              child: BorderButton(
                width: 150,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 5.0,
                ),
                borderColor: ColorConstants.sunsetOrange,
                onPressed: () async {},
                child: Text(
                  StringConstants.deleteAccount,
                  style: TextStyle(
                    fontSize: 16,
                    color: ColorConstants.sunsetOrange,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(height: 25.0),
          ],
        ),
      ),
    );
  }
}
