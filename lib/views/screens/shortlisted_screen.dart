import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
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
        title: const Text(StringConstants.shortlisted),
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: ColorConstants.color2,
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
    );
  }
}
