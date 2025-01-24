import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/match_item.dart';
import 'match_profile_screen.dart';

class DeclinedInterestsScreen extends StatefulWidget {
  const DeclinedInterestsScreen({super.key});

  @override
  State<DeclinedInterestsScreen> createState() =>
      _DeclinedInterestsScreenState();
}

class _DeclinedInterestsScreenState extends State<DeclinedInterestsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ColorConstants.color1,
          foregroundColor: ColorConstants.textWhite,
          title: const Text(
            StringConstants.declinedInterests,
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
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.only(top: 10.0),
                labelPadding: const EdgeInsets.all(0.0),
                indicator: BoxDecoration(
                  color: ColorConstants.color1,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelColor: ColorConstants.textWhite,
                unselectedLabelColor: ColorConstants.color1,
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 16.0,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 15.0,
                  fontWeight: FontWeight.w500,
                ),
                dividerHeight: 0.5,
                tabs: const [
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.byMe),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.byThem),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Tab-1
                    Column(
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
                              horizontal: 0.0,
                              vertical: 10.0,
                            ),
                            itemBuilder: (_, index) {
                              return MatchItem(
                                imageUrl: false
                                    ? 'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45'
                                    : 'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
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
                                isVerified: true,
                                membership: "Pro Max",
                                profileMatchPercent: "55",
                                onSendInterestPressed: () {},
                                onShortlistPressed: () {},
                                onTap: () {
                                  Get.to(() => const MatchProfileScreen(
                                        buttonTypes: [
                                          ButtonType.sendInterest,
                                          ButtonType.shortlist,
                                        ],
                                      ));
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    //Tab-2
                    Column(
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
                              horizontal: 0.0,
                              vertical: 10.0,
                            ),
                            itemBuilder: (_, index) {
                              return MatchItem(
                                imageUrl: false
                                    ? 'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45'
                                    : 'https://images.unsplash.com/photo-1534339480783-6816b68be29c',
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
                                isVerified: true,
                                membership: "Pro Max",
                                profileMatchPercent: "55",
                                onSendInterestPressed: () {},
                                onShortlistPressed: () {},
                                onTap: () {
                                  Get.to(() => const MatchProfileScreen(
                                        buttonTypes: [
                                          ButtonType.sendInterest,
                                          ButtonType.shortlist,
                                        ],
                                      ));
                                },
                              );
                            },
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
      ),
    );
  }
}
