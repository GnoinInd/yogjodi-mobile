import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class CustomAppbar extends StatelessWidget {
  final String imageUrl;
  final String title;
  final void Function() onNotificationPressed;
  final void Function() onShortlistedPressed;
  const CustomAppbar({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.onNotificationPressed,
    required this.onShortlistedPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: ColorConstants.textWhite,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: CachedNetworkImageProvider(
              imageUrl,
            ),
          ),
          const SizedBox(width: 20.0),
          Expanded(
            child: Text(
              title,
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
          onPressed: onNotificationPressed,
          icon: SvgPicture.asset(
            AssetConstants.notification,
            fit: BoxFit.scaleDown,
          ),
        ),
        IconButton(
          onPressed: onShortlistedPressed,
          icon: SvgPicture.asset(
            AssetConstants.shortlisted,
            fit: BoxFit.scaleDown,
          ),
        ),
        const SizedBox(width: 25.0),
      ],
    );
  }
}
