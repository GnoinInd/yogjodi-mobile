import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';
import 'package:yog_jodi/views/widgets/border_button.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/match_item.dart';

class MatchesScreen extends StatefulWidget {
  const MatchesScreen({super.key});

  @override
  State<MatchesScreen> createState() => _MatchesScreenState();
}

class _MatchesScreenState extends State<MatchesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.textWhite,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const CircleAvatar(
              radius: 20,
              backgroundImage: CachedNetworkImageProvider(
                'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45', // Replace with actual image URL
              ),
            ),
            const SizedBox(width: 20.0),
            Expanded(
              child: Text(
                StringConstants.matches,
                style: TextStyle(
                  fontFamily: "Inter",
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600,
                  color: ColorConstants.color1,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetConstants.notification,
              fit: BoxFit.scaleDown,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AssetConstants.shortlisted,
              fit: BoxFit.scaleDown,
            ),
          ),
          const SizedBox(width: 25.0),
        ],
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorConstants.color2,
        child: Column(
          children: [
            SizedBox(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.only(
                  left: 20.0,
                  top: 20.0,
                  bottom: 20.0,
                ),
                children: [
                  BorderButton(
                    width: 90,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        SvgPicture.asset(
                          AssetConstants.filter,
                          fit: BoxFit.scaleDown,
                          width: 20,
                          height: 20,
                        ),
                        const SizedBox(width: 5.0),
                        Text(
                          StringConstants.filter,
                          style: TextStyle(
                            fontFamily: "Poppins",
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: ColorConstants.textGrey,
                          ),
                          textAlign: TextAlign.center,
                        )
                      ],
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 85,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.verified,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 85,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.married,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                  BorderButton(
                    width: 130,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    borderColor: Colors.transparent,
                    bgColor: Colors.white,
                    boxShadow: BoxShadow(
                      color: Colors.grey.shade200,
                      spreadRadius: 1.0,
                      blurRadius: 2.0,
                    ),
                    child: Text(
                      StringConstants.neverMarried,
                      style: TextStyle(
                        fontFamily: "Poppins",
                        fontSize: 14.0,
                        fontWeight: FontWeight.w500,
                        color: ColorConstants.textGrey,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    onPressed: () {},
                  ),
                  const SizedBox(width: 15.0),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 10.0,
                ),
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: MatchItem(
                      imageUrl:
                          'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
                      lastSeen: '6:24 AM',
                      name: 'Sagar Thakur',
                      age: '24',
                      height: '5ft 10in',
                      state: 'Gujrat',
                      religion: 'Hindu',
                      profession: 'Software Developer',
                      annualIncome: '5-6 LPA',
                      education: 'MCA',
                      maritalStatus: 'Never Married',
                      onSendInterestPressed: () {},
                      onShortlistPressed: () {},
                      onChatPressed: () {},
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
