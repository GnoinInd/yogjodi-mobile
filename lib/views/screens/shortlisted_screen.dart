import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/match_item.dart';

class ShortlistedScreen extends StatefulWidget {
  const ShortlistedScreen({super.key});

  @override
  State<ShortlistedScreen> createState() => _ShortlistedScreenState();
}

class _ShortlistedScreenState extends State<ShortlistedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
        title: const Text(
          StringConstants.shortlisted,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
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
                      StringConstants.handicap,
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
                  return MatchItem(
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
                    isShortlisted: true,
                    onSendInterestPressed: () {},
                    onShortlistPressed: () {},
                    onChatPressed: () {},
                    onTap: () {},
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
