import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/common/constants/string_constants.dart';
import 'package:yog_jodi/views/screens/inbox_screen.dart';
import 'package:yog_jodi/views/widgets/custom_appbar.dart';

import '../../common/constants/color_constants.dart';

class MessengerScreen extends StatefulWidget {
  const MessengerScreen({super.key});

  @override
  State<MessengerScreen> createState() => _MessengerScreenState();
}

class _MessengerScreenState extends State<MessengerScreen> {
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: CustomAppbar(
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
            title: StringConstants.myConversations,
            onNotificationPressed: () {},
            onShortlistedPressed: () {},
          ),
        ),
        body: Column(
          children: [
            TabBar(
              padding: const EdgeInsets.only(top: 20.0),
              labelPadding: const EdgeInsets.all(0.0),
              // tabAlignment: TabAlignment.center,
              indicator: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    width: 3.0,
                    color: ColorConstants.color1,
                  ),
                ),
              ),
              labelColor: ColorConstants.color3,
              unselectedLabelColor: ColorConstants.color3,
              labelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14.0,
                fontWeight: FontWeight.w500,
              ),
              unselectedLabelStyle: const TextStyle(
                fontFamily: "Poppins",
                fontSize: 14.0,
                fontWeight: FontWeight.w400,
              ),
              dividerHeight: 0.5,
              tabs: const [
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "${StringConstants.accepted} (10)"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "${StringConstants.interests_} (5)"),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Tab(text: "${StringConstants.calls} (3)"),
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  ///Tab-1
                  ListView.builder(
                    itemCount: 15,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    itemBuilder: (_, index) {
                      return MessengerItem(
                        selected: selectedIndex == index,
                        imageUrl:
                            'https://plus.unsplash.com/premium_photo-1682089869602-2ec199cc501a',
                        name: 'Vishvaip Thakur',
                        message: 'You: Okay',
                        totalUnreadMessage: (index > 1 && index % 3 == 0)
                            ? index.toString()
                            : '',
                        date: '16-Sept-24',
                        onTap: () {
                          Get.to(() => const InboxScreen());
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),

                  ///Tab-2
                  ListView.builder(
                    itemCount: 15,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                      vertical: 10.0,
                    ),
                    itemBuilder: (_, index) {
                      return MessengerItem(
                        selected: selectedIndex == index,
                        imageUrl:
                            'https://plus.unsplash.com/premium_photo-1682089869602-2ec199cc501a',
                        name: 'Vishvaip Thakur',
                        message: 'You: Okay',
                        totalUnreadMessage: (index > 1 && index % 3 == 0)
                            ? index.toString()
                            : '',
                        date: '16-Sept-24',
                        onTap: () {
                          Get.to(() => const InboxScreen());
                          setState(() {
                            selectedIndex = index;
                          });
                        },
                      );
                    },
                  ),

                  ///Tab-3
                  const Center(
                    child: Text("Calls"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MessengerItem extends StatefulWidget {
  final bool selected;
  final String imageUrl;
  final String name;
  final String message;
  final String date;
  final String totalUnreadMessage;
  final void Function() onTap;

  const MessengerItem({
    super.key,
    required this.selected,
    required this.imageUrl,
    required this.name,
    required this.message,
    required this.totalUnreadMessage,
    required this.date,
    required this.onTap,
  });

  @override
  State<MessengerItem> createState() => _MessengerItemState();
}

class _MessengerItemState extends State<MessengerItem> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 5.0),
        color: widget.selected ? ColorConstants.color8 : Colors.transparent,
        child: Column(
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 6.0,
                  height: 80.0,
                  color: widget.selected
                      ? ColorConstants.color1
                      : Colors.transparent,
                ),
                const SizedBox(width: 15.0),
                CircleAvatar(
                  radius: 30.0,
                  backgroundImage: CachedNetworkImageProvider(
                    widget.imageUrl,
                  ),
                ),
                const SizedBox(width: 12.0),
                SizedBox(
                  height: 60.0,
                  width: 150,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.name,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 14.0,
                          fontWeight: FontWeight.w600,
                          color: ColorConstants.textBlack,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        widget.message,
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 12.0,
                          fontWeight: FontWeight.w400,
                          color: ColorConstants.color3,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 60.0,
                    child: Column(
                      children: [
                        Text(
                          widget.date,
                          style: TextStyle(
                            fontFamily: "Inter",
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: ColorConstants.color3,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15.0),
                        if (widget.totalUnreadMessage.isNotEmpty)
                          CircleAvatar(
                            radius:
                                widget.totalUnreadMessage.length > 2 ? 13 : 9,
                            backgroundColor: ColorConstants.color1,
                            child: Text(
                              widget.totalUnreadMessage,
                              style: TextStyle(
                                fontFamily: "Inter",
                                fontSize: 12.0,
                                color: ColorConstants.textWhite,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              height: 2.0,
              color: ColorConstants.color9,
            ),
          ],
        ),
      ),
    );
  }
}
