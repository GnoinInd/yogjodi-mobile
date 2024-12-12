import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/custom_appbar.dart';

class InboxScreen extends StatefulWidget {
  const InboxScreen({super.key});

  @override
  State<InboxScreen> createState() => _InboxScreenState();
}

class _InboxScreenState extends State<InboxScreen> {
  String textToSend = '';
  TextEditingController textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
          const InboxProfile(
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
                      onPressed: () {},
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
                    fillColor: ColorConstants.color2,
                    contentPadding: const EdgeInsets.all(15.0),
                  ),
                  onChanged: (val) {
                    textToSend = val;
                  },
                ),
                const SizedBox(height: 10.0),
              ],
            ),
          )
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
                              color: ColorConstants.textBlack,
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
                            color: ColorConstants.color3,
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
                        color: ColorConstants.color3,
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
            title: Text(
              StringConstants.about,
              style: TextStyle(
                color: ColorConstants.color3,
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
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            location,
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "${StringConstants.dateOfBirth}:",
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            dateOfBirth,
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            "${StringConstants.religion}:",
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            religion,
                            style: TextStyle(
                              color: ColorConstants.color3,
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
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            motherTongue,
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 5.0),
                          Text(
                            StringConstants.maritalStatus,
                            style: TextStyle(
                              color: ColorConstants.color3,
                              fontFamily: "Inter",
                              fontSize: 14.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            maritalStatus,
                            style: TextStyle(
                              color: ColorConstants.color3,
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
              )
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
                  color: ColorConstants.color12,
                ),
              ),
              SvgPicture.asset(
                AssetConstants.dot,
                fit: BoxFit.scaleDown,
                colorFilter: ColorFilter.mode(
                  ColorConstants.color12,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(width: 10.0),
              Text(
                date,
                style: TextStyle(
                  color: ColorConstants.color12,
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
                            color: ColorConstants.textBlack,
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
                          color: ColorConstants.color3,
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
                      color: ColorConstants.color3,
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
