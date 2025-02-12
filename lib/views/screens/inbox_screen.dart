import 'package:cached_network_image/cached_network_image.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:flutter/foundation.dart' as foundation;
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';
import 'package:yog_jodi/views/screens/match_profile_screen.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/custom_appbar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  String textToSend = '';
  TextEditingController textEditingController = TextEditingController();
  bool showEmojiPicker = false;
  bool profileExpansionOpened = false;

  @override
  Widget build(BuildContext context) {
    ///Detect if keyboard is open or not.
    final bottomInsets = MediaQuery.of(context).viewInsets.bottom;
    bool isKeyboardOpen = bottomInsets != 0;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60.0),
        child: CustomAppbar(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
          title: StringConstants.inbox,
          onNotificationPressed: () {},
          onShortlistedPressed: () {},
        ),
      ),
      body: Column(
        children: [
          InboxProfile(
            profileImageUrl:
                'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
            name: 'Vishvadip Thakur',
            age: '26',
            isOnline: false,
            location: "Andman And Nikobar Island",
            dateOfBirth: "12 Jan 1998",
            religion: "Hindu",
            motherTongue: "Hindi",
            maritalStatus: "Never Married",
            onExpansionChanged: (open) {
              setState(() {
                profileExpansionOpened = open;
                showEmojiPicker = false;
              });
            },
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              itemCount: 10,
              itemBuilder: (_, index) {
                if (index % 2 == 0) {
                  return const MessageItem(
                    date: "12 Mar 2024",
                    showDate: true,
                    profileImageUrl:
                        'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                    name: 'Vishvadip Thakur',
                    time: "10:30 AM",
                    message: "Hi. How are you?",
                  );
                } else {
                  return const MessageItem(
                    date: "14 Mar 2024",
                    showDate: true,
                    profileImageUrl:
                        'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
                    name: 'You',
                    time: "08:05 PM",
                    message: "I'm fine. How are you? ",
                  );
                }
              },
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(
              vertical: 10.0,
              horizontal: 10.0,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetConstants.pickImage,
                        fit: BoxFit.scaleDown,
                      ),
                      onPressed: () {},
                    ),
                    const SizedBox(width: 5.0),
                    IconButton(
                      icon: SvgPicture.asset(
                        AssetConstants.pickGif,
                        fit: BoxFit.scaleDown,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
                const SizedBox(height: 10.0),
                TextField(
                  controller: textEditingController,
                  minLines: 1,
                  maxLines: 5,
                  decoration: InputDecoration(
                    hintText: StringConstants.message,
                    prefixIcon: IconButton(
                      icon: SvgPicture.asset(
                        AssetConstants.pickEmoji,
                        fit: BoxFit.scaleDown,
                      ),
                      onPressed: () {
                        setState(() {
                          showEmojiPicker = !showEmojiPicker;
                        });
                      },
                    ),
                    suffixIcon: IconButton(
                      icon: SvgPicture.asset(
                        AssetConstants.sendMessage,
                        fit: BoxFit.scaleDown,
                      ),
                      onPressed: () {},
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: ColorConstants.solitude,
                    contentPadding: const EdgeInsets.all(15.0),
                  ),
                  onChanged: (val) {
                    textToSend = val;
                  },
                ),
                if (showEmojiPicker && !profileExpansionOpened)
                  EmojiPicker(
                    onEmojiSelected: (category, emoji) {
                      // Do something when emoji is tapped (optional)
                    },
                    onBackspacePressed: () {
                      // Do something when the user taps the backspace button (optional)
                      // Set it to null to hide the Backspace-Button
                    },
                    textEditingController:
                        textEditingController, // pass here the same [TextEditingController] that is connected to your input field, usually a [TextFormField]
                    config: Config(
                      height: isKeyboardOpen ? 175 : 256,
                      checkPlatformCompatibility: true,
                      emojiViewConfig: EmojiViewConfig(
                        // Issue: https://github.com/flutter/flutter/issues/28894
                        emojiSizeMax: 28 *
                            (foundation.defaultTargetPlatform ==
                                    TargetPlatform.iOS
                                ? 1.20
                                : 1.0),
                      ),
                      viewOrderConfig: const ViewOrderConfig(
                        top: EmojiPickerItem.categoryBar,
                        middle: EmojiPickerItem.emojiView,
                        bottom: EmojiPickerItem.searchBar,
                      ),
                      skinToneConfig: const SkinToneConfig(),
                      categoryViewConfig: const CategoryViewConfig(),
                      bottomActionBarConfig: BottomActionBarConfig(
                        backgroundColor: Colors.transparent,
                        buttonColor: Colors.transparent,
                        buttonIconColor: ColorConstants.boulder,
                      ),
                      searchViewConfig: const SearchViewConfig(),
                    ),
                  ),
                SizedBox(height: isKeyboardOpen ? 0 : 10.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InboxProfile extends StatelessWidget {
  final String profileImageUrl;
  final String name;
  final String age;
  final bool isOnline;
  final String location;
  final String dateOfBirth;
  final String religion;
  final String motherTongue;
  final String maritalStatus;
  final void Function(bool open)? onExpansionChanged;
  const InboxProfile({
    super.key,
    required this.profileImageUrl,
    required this.name,
    required this.age,
    required this.isOnline,
    required this.location,
    required this.dateOfBirth,
    required this.religion,
    required this.motherTongue,
    required this.maritalStatus,
    this.onExpansionChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 20.0,
        vertical: 10.0,
      ),
      child: Column(
        children: [
          SizedBox(
            width: double.infinity,
            height: 50.0,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 25.0,
                  backgroundImage: CachedNetworkImageProvider(
                    profileImageUrl,
                  ),
                ),
                const SizedBox(width: 10.0),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 180,
                          child: Text(
                            name,
                            style: TextStyle(
                              color: ColorConstants.theBlack,
                              fontFamily: "Inter",
                              fontSize: 16.0,
                              fontWeight: FontWeight.w600,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Text(
                          isOnline
                              ? StringConstants.online
                              : StringConstants.offline,
                          style: TextStyle(
                            color: ColorConstants.tundora,
                            fontFamily: "Inter",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "${StringConstants.age}: $age",
                      style: TextStyle(
                        color: ColorConstants.tundora,
                        fontFamily: "Inter",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          ExpansionTile(
            tilePadding: const EdgeInsets.all(0),
            dense: true,
            shape: const Border(),
            onExpansionChanged: onExpansionChanged,
            title: Text(
              StringConstants.about,
              style: TextStyle(
                color: ColorConstants.tundora,
                fontFamily: "Inter",
                fontSize: 12.0,
              ),
              overflow: TextOverflow.ellipsis,
            ),
            children: [
              SizedBox(
                width: double.infinity,
                height: 155.0,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${StringConstants.location}:",
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "${StringConstants.dateOfBirth}:",
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            dateOfBirth,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "${StringConstants.religion}:",
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            religion,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "${StringConstants.motherTongue}:",
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            motherTongue,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            StringConstants.maritalStatus,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            maritalStatus,
                            style: TextStyle(
                              color: ColorConstants.tundora,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 5.0),
              BorderButton(
                width: 90,
                padding: const EdgeInsets.symmetric(
                  vertical: 5.0,
                  horizontal: 0.0,
                ),
                bgColor: ColorConstants.theWhite,
                borderColor: ColorConstants.jazzberryJam,
                onPressed: () async {
                  Get.to(
                    () => const MatchProfileScreen(),
                  );
                },
                child: Text(
                  StringConstants.viewProfile,
                  style: TextStyle(
                    fontSize: 12,
                    color: ColorConstants.jazzberryJam,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class MessageItem extends StatelessWidget {
  final String date;
  final bool showDate;
  final String profileImageUrl;
  final String name;
  final String time;
  final String message;
  const MessageItem({
    super.key,
    required this.date,
    required this.showDate,
    required this.profileImageUrl,
    required this.name,
    required this.time,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        const SizedBox(height: 20.0),
        if (showDate)
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.5,
                child: Divider(
                  thickness: 1.0,
                  color: ColorConstants.alto,
                ),
              ),
              SvgPicture.asset(
                AssetConstants.dot,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorConstants.alto,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                date,
                style: TextStyle(
                  color: ColorConstants.alto,
                  fontFamily: "Inter",
                  fontSize: 12.0,
                  fontWeight: FontWeight.w400,
                ),
                overflow: TextOverflow.ellipsis,
              )
            ],
          ),
        const SizedBox(height: 20.0),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.0,
              backgroundImage: CachedNetworkImageProvider(
                profileImageUrl,
              ),
            ),
            const SizedBox(width: 10.0),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.7,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 170,
                        child: Text(
                          name,
                          style: TextStyle(
                            color: ColorConstants.theBlack,
                            fontFamily: "Inter",
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 10.0),
                      Text(
                        time,
                        style: TextStyle(
                          color: ColorConstants.tundora,
                          fontFamily: "Inter",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8.0),
                  Text(
                    message,
                    style: TextStyle(
                      color: ColorConstants.tundora,
                      fontFamily: "Inter",
                      fontSize: 14.0,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
