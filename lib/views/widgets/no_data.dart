import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';

class NoData extends StatelessWidget {
  const NoData({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: ColorConstants.paleRose,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            StringConstants.noDataAvailable,
            style: TextStyle(
              fontFamily: "Poppins",
              color: ColorConstants.jazzberryJam,
              fontSize: 22.0,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 5.0),
          SizedBox(
            width: 250.0,
            child: Text(
              StringConstants.thereIsNoDataToBeShown,
              style: TextStyle(
                fontFamily: "Inter",
                color: ColorConstants.theBlack,
                fontSize: 16.0,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
