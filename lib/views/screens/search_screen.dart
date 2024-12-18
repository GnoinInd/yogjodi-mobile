import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yog_jodi/views/widgets/colored_button.dart';

import '../../common/constants/asset_constants.dart';
import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/custom_appbar.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  ///Tab-1
  // String height = '';
  // String age = '';
  String minAge = '';
  String maxAge = '';
  final List<String> ageList = ['Select'];
  String minHeight = '';
  String maxHeight = '';
  final List<String> heightList = ['Select'];
  List<String> maritalStatusList = [];
  List<String> religionList = [];
  String caste = '';
  String motherTongue = '';
  String country = '';
  String annualIncome = '';
  List<String> residentialStatusList = [];
  String education = '';
  String occupation = '';

  ///Tab-2
  String searchByID = '';

  @override
  void initState() {
    minAge = ageList.first;
    maxAge = ageList.first;
    minHeight = heightList.first;
    maxHeight = heightList.first;

    ///Add age to list
    for (int age = 18; age <= 60; age++) {
      String newAge = '$age years';
      ageList.add(newAge);
    }

    ///Add height to list
    for (int ft = 3; ft <= 7; ft++) {
      for (int inch = 0; inch <= 11; inch++) {
        String newHeight = (inch == 0) ? '${ft}ft' : '${ft}ft ${inch}in';
        heightList.add(newHeight);
      }
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60.0),
          child: CustomAppbar(
            imageUrl:
                'https://plus.unsplash.com/premium_photo-1691030254390-aa56b22e6a45',
            title: StringConstants.search,
            onNotificationPressed: () {},
            onShortlistedPressed: () {},
          ),
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              TabBar(
                padding: const EdgeInsets.only(top: 20.0),
                labelPadding: const EdgeInsets.all(0.0),
                indicator: BoxDecoration(
                  color: ColorConstants.color1,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                labelColor: ColorConstants.textWhite,
                unselectedLabelColor: ColorConstants.color1,
                labelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: "Poppins",
                  fontSize: 14.0,
                  fontWeight: FontWeight.w500,
                ),
                dividerHeight: 0.5,
                tabs: const [
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.searchByCriteria),
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: Tab(text: StringConstants.searchByProfileId),
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    //Tab-1
                    ListView(
                      children: [
                        const SizedBox(height: 20.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.minAge,
                              style: TextStyle(
                                color: ColorConstants.color3,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                value:
                                    minAge.isNotEmpty ? minAge : ageList.first,
                                hint: Text(ageList.first),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    minAge = newValue!;
                                    if (minAge == ageList.first) {
                                      minAge = "";
                                    }
                                  });
                                },
                                items: ageList.map((String age_) {
                                  return DropdownMenuItem<String>(
                                    value: age_,
                                    child: Text(age_),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color5,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color10,
                                      width: 1,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.maxAge,
                              style: TextStyle(
                                color: ColorConstants.color3,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                value:
                                    maxAge.isNotEmpty ? maxAge : ageList.first,
                                hint: Text(ageList.first),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    maxAge = newValue!;
                                    if (maxAge == ageList.first) {
                                      maxAge = "";
                                    }
                                  });
                                },
                                items: ageList.map((String age_) {
                                  return DropdownMenuItem<String>(
                                    value: age_,
                                    child: Text(age_),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color5,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color10,
                                      width: 1,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.minHeight,
                              style: TextStyle(
                                color: ColorConstants.color3,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                value: minHeight.isNotEmpty
                                    ? minHeight
                                    : heightList.first,
                                hint: Text(heightList.first),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    minHeight = newValue!;
                                    if (minHeight == heightList.first) {
                                      minHeight = "";
                                    }
                                  });
                                },
                                items: heightList.map((String height_) {
                                  return DropdownMenuItem<String>(
                                    value: height_,
                                    child: Text(height_),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color5,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color10,
                                      width: 1,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 16.0),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              StringConstants.maxHeight,
                              style: TextStyle(
                                color: ColorConstants.color3,
                                fontSize: 17.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.55,
                              child: DropdownButtonFormField<String>(
                                menuMaxHeight: 200,
                                value: maxHeight.isNotEmpty
                                    ? maxHeight
                                    : heightList.first,
                                hint: Text(heightList.first),
                                onChanged: (String? newValue) {
                                  setState(() {
                                    maxHeight = newValue!;
                                    if (maxHeight == heightList.first) {
                                      maxHeight = "";
                                    }
                                  });
                                },
                                items: heightList.map((String height_) {
                                  return DropdownMenuItem<String>(
                                    value: height_,
                                    child: Text(height_),
                                  );
                                }).toList(),
                                decoration: InputDecoration(
                                  contentPadding: const EdgeInsets.all(15.0),
                                  enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color5,
                                      width: 1,
                                    ),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: ColorConstants.color10,
                                      width: 1,
                                    ),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: const BorderSide(
                                      color: Colors.red,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        // const SizedBox(height: 16.0),
                        // TextField(
                        //   style: TextStyle(
                        //     color: ColorConstants.color3,
                        //   ),
                        //   decoration: InputDecoration(
                        //     // hintText: StringConstants.height.substring(
                        //     //     0, StringConstants.height.length - 1),
                        //     // hintStyle: TextStyle(color: ColorConstants.color11),
                        //     labelText: StringConstants.height.substring(
                        //         0, StringConstants.height.length - 1),
                        //     labelStyle:
                        //         TextStyle(color: ColorConstants.color11),
                        //     contentPadding: const EdgeInsets.all(15.0),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Rounded corners
                        //       borderSide: BorderSide(
                        //         color: ColorConstants.color5, // Border color
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Same corners
                        //       borderSide: BorderSide(
                        //         color: ColorConstants
                        //             .color10, // Color when focused
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     errorBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Same corners
                        //       borderSide: const BorderSide(
                        //         color: Colors.red, // Color when error
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     focusedErrorBorder: UnderlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5),
                        //       borderSide: const BorderSide(
                        //         color: Colors.red,
                        //         width: 1,
                        //       ),
                        //     ),
                        //   ),
                        //   keyboardType: TextInputType.text,
                        //   onChanged: (val) {
                        //     height = val;
                        //   },
                        // ),
                        // const SizedBox(height: 10.0),
                        // TextField(
                        //   style: TextStyle(
                        //     color: ColorConstants.color3,
                        //   ),
                        //   decoration: InputDecoration(
                        //     // hintText: StringConstants.age,
                        //     // hintStyle: TextStyle(color: ColorConstants.color11),
                        //     labelText: StringConstants.age,
                        //     labelStyle:
                        //         TextStyle(color: ColorConstants.color11),
                        //     contentPadding: const EdgeInsets.all(15.0),
                        //     enabledBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Rounded corners
                        //       borderSide: BorderSide(
                        //         color: ColorConstants.color5, // Border color
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     focusedBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Same corners
                        //       borderSide: BorderSide(
                        //         color: ColorConstants
                        //             .color10, // Color when focused
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     errorBorder: UnderlineInputBorder(
                        //       borderRadius:
                        //           BorderRadius.circular(5), // Same corners
                        //       borderSide: const BorderSide(
                        //         color: Colors.red, // Color when error
                        //         width: 1, // Border width
                        //       ),
                        //     ),
                        //     focusedErrorBorder: UnderlineInputBorder(
                        //       borderRadius: BorderRadius.circular(5),
                        //       borderSide: const BorderSide(
                        //         color: Colors.red,
                        //         width: 1,
                        //       ),
                        //     ),
                        //   ),
                        //   keyboardType: TextInputType.text,
                        //   onChanged: (val) {
                        //     age = val;
                        //   },
                        // ),
                        const SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.maritalStatus,
                                style: TextStyle(
                                  color: ColorConstants.color3,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  BorderButton(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.doesNotMatter)) {
                                          maritalStatusList.add(
                                              StringConstants.doesNotMatter);
                                        } else {
                                          maritalStatusList.remove(
                                              StringConstants.doesNotMatter);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.doesNotMatter,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants.doesNotMatter)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.neverMarried)) {
                                          maritalStatusList.add(
                                              StringConstants.neverMarried);
                                        } else {
                                          maritalStatusList.remove(
                                              StringConstants.neverMarried);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.neverMarried,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants.neverMarried)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 115,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.married)) {
                                          maritalStatusList
                                              .add(StringConstants.married);
                                        } else {
                                          maritalStatusList
                                              .remove(StringConstants.married);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.married,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants.married)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 115,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.divorced)) {
                                          maritalStatusList
                                              .add(StringConstants.divorced);
                                        } else {
                                          maritalStatusList
                                              .remove(StringConstants.divorced);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.divorced,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants.divorced)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 115,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.widowed)) {
                                          maritalStatusList
                                              .add(StringConstants.widowed);
                                        } else {
                                          maritalStatusList
                                              .remove(StringConstants.widowed);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.widowed,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants.widowed)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 165,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.awaitingMarried)) {
                                          maritalStatusList.add(
                                              StringConstants.awaitingMarried);
                                        } else {
                                          maritalStatusList.remove(
                                              StringConstants.awaitingMarried);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.awaitingMarried,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants
                                                      .awaitingMarried)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 165,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!maritalStatusList.contains(
                                            StringConstants.awaitingDivorce)) {
                                          maritalStatusList.add(
                                              StringConstants.awaitingDivorce);
                                        } else {
                                          maritalStatusList.remove(
                                              StringConstants.awaitingDivorce);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.awaitingDivorce,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          maritalStatusList.contains(
                                                  StringConstants
                                                      .awaitingDivorce)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
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
                                StringConstants.religion,
                                style: TextStyle(
                                  color: ColorConstants.color3,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  BorderButton(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList.contains(
                                            StringConstants.doesNotMatter)) {
                                          religionList.add(
                                              StringConstants.doesNotMatter);
                                        } else {
                                          religionList.remove(
                                              StringConstants.doesNotMatter);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.doesNotMatter,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.doesNotMatter)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.hindu)) {
                                          religionList
                                              .add(StringConstants.hindu);
                                        } else {
                                          religionList
                                              .remove(StringConstants.hindu);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.hindu,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.hindu)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.muslim)) {
                                          religionList
                                              .add(StringConstants.muslim);
                                        } else {
                                          religionList
                                              .remove(StringConstants.muslim);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.muslim,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.muslim)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.sikh)) {
                                          religionList
                                              .add(StringConstants.sikh);
                                        } else {
                                          religionList
                                              .remove(StringConstants.sikh);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.sikh,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.sikh)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList.contains(
                                            StringConstants.christian)) {
                                          religionList
                                              .add(StringConstants.christian);
                                        } else {
                                          religionList.remove(
                                              StringConstants.christian);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.christian,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.christian)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 120,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList.contains(
                                            StringConstants.buddhist)) {
                                          religionList
                                              .add(StringConstants.buddhist);
                                        } else {
                                          religionList
                                              .remove(StringConstants.buddhist);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.buddhist,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.buddhist)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.jain)) {
                                          religionList
                                              .add(StringConstants.jain);
                                        } else {
                                          religionList
                                              .remove(StringConstants.jain);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.jain,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.jain)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 90,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.parsi)) {
                                          religionList
                                              .add(StringConstants.parsi);
                                        } else {
                                          religionList
                                              .remove(StringConstants.parsi);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.parsi,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.parsi)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.jewish)) {
                                          religionList
                                              .add(StringConstants.jewish);
                                        } else {
                                          religionList
                                              .remove(StringConstants.jewish);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.jewish,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.jewish)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 100,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!religionList
                                            .contains(StringConstants.bahai)) {
                                          religionList
                                              .add(StringConstants.bahai);
                                        } else {
                                          religionList
                                              .remove(StringConstants.bahai);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.bahai,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          religionList.contains(
                                                  StringConstants.bahai)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.caste,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.caste,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            caste = val;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.motherTongue,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.motherTongue,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            motherTongue = val;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.country,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.country,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            country = val;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.annualIncome,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.annualIncome,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            annualIncome = val;
                          },
                        ),
                        const SizedBox(height: 20.0),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                StringConstants.residentialStatus,
                                style: TextStyle(
                                  color: ColorConstants.color3,
                                  fontSize: 17.0,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 10.0),
                              Wrap(
                                spacing: 10.0,
                                runSpacing: 10.0,
                                children: [
                                  BorderButton(
                                    width: 150,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!residentialStatusList.contains(
                                            StringConstants.doesNotMatter)) {
                                          residentialStatusList.add(
                                              StringConstants.doesNotMatter);
                                        } else {
                                          residentialStatusList.remove(
                                              StringConstants.doesNotMatter);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.doesNotMatter,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          residentialStatusList.contains(
                                                  StringConstants.doesNotMatter)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 110,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!residentialStatusList.contains(
                                            StringConstants.citizen)) {
                                          residentialStatusList
                                              .add(StringConstants.citizen);
                                        } else {
                                          residentialStatusList
                                              .remove(StringConstants.citizen);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.citizen,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          residentialStatusList.contains(
                                                  StringConstants.citizen)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!residentialStatusList.contains(
                                            StringConstants.workPermit)) {
                                          residentialStatusList
                                              .add(StringConstants.workPermit);
                                        } else {
                                          residentialStatusList.remove(
                                              StringConstants.workPermit);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.workPermit,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          residentialStatusList.contains(
                                                  StringConstants.workPermit)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 140,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!residentialStatusList.contains(
                                            StringConstants.studentVisa)) {
                                          residentialStatusList
                                              .add(StringConstants.studentVisa);
                                        } else {
                                          residentialStatusList.remove(
                                              StringConstants.studentVisa);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.studentVisa,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          residentialStatusList.contains(
                                                  StringConstants.studentVisa)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                  BorderButton(
                                    width: 180,
                                    padding: const EdgeInsets.symmetric(
                                      vertical: 5.0,
                                      horizontal: 0.0,
                                    ),
                                    bgColor: ColorConstants.color8,
                                    borderColor: ColorConstants.color1,
                                    onPressed: () async {
                                      setState(() {
                                        if (!residentialStatusList.contains(
                                            StringConstants
                                                .permanentResident)) {
                                          residentialStatusList.add(
                                              StringConstants
                                                  .permanentResident);
                                        } else {
                                          residentialStatusList.remove(
                                              StringConstants
                                                  .permanentResident);
                                        }
                                      });
                                    },
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          StringConstants.permanentResident,
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: ColorConstants.color3,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        Icon(
                                          residentialStatusList.contains(
                                                  StringConstants
                                                      .permanentResident)
                                              ? Icons.remove
                                              : Icons.add,
                                          color: ColorConstants.color3,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.education,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.education,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            education = val;
                          },
                        ),
                        const SizedBox(height: 10.0),
                        TextField(
                          style: TextStyle(
                            color: ColorConstants.color3,
                          ),
                          decoration: InputDecoration(
                            // hintText: StringConstants.occupation,
                            // hintStyle: TextStyle(color: ColorConstants.color11),
                            labelText: StringConstants.occupation,
                            labelStyle:
                                TextStyle(color: ColorConstants.color11),
                            contentPadding: const EdgeInsets.all(15.0),
                            enabledBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Rounded corners
                              borderSide: BorderSide(
                                color: ColorConstants.color5, // Border color
                                width: 1, // Border width
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: BorderSide(
                                color: ColorConstants
                                    .color10, // Color when focused
                                width: 1, // Border width
                              ),
                            ),
                            errorBorder: UnderlineInputBorder(
                              borderRadius:
                                  BorderRadius.circular(5), // Same corners
                              borderSide: const BorderSide(
                                color: Colors.red, // Color when error
                                width: 1, // Border width
                              ),
                            ),
                            focusedErrorBorder: UnderlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide: const BorderSide(
                                color: Colors.red,
                                width: 1,
                              ),
                            ),
                          ),
                          keyboardType: TextInputType.text,
                          onChanged: (val) {
                            occupation = val;
                          },
                        ),
                        const SizedBox(height: 25.0),
                        ColoredButton(
                          width: 170,
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          color: ColorConstants.color1,
                          child: Text(
                            StringConstants.showMeProfiles,
                            style: TextStyle(
                              color: ColorConstants.textWhite,
                              fontSize: 16.0,
                              fontFamily: "Inter",
                            ),
                          ),
                          onPressed: () {},
                        ),
                        const SizedBox(height: 35.0),
                      ],
                    ),
                    //Tab-2
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextField(
                        autofocus: true,
                        style: TextStyle(
                          color: ColorConstants.color3,
                        ),
                        decoration: InputDecoration(
                          hintText: StringConstants.searchByProfileId,
                          hintStyle: TextStyle(color: ColorConstants.color11),
                          labelStyle: TextStyle(color: ColorConstants.color11),
                          label: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(
                                AssetConstants.search1,
                                fit: BoxFit.scaleDown,
                              ),
                              const SizedBox(width: 10),
                              const Text(
                                StringConstants.searchByProfileId,
                              ),
                            ],
                          ),
                          contentPadding: const EdgeInsets.all(15.0),
                          enabledBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Rounded corners
                            borderSide: BorderSide(
                              color: ColorConstants.color5, // Border color
                              width: 1, // Border width
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Same corners
                            borderSide: BorderSide(
                              color:
                                  ColorConstants.color10, // Color when focused
                              width: 1, // Border width
                            ),
                          ),
                          errorBorder: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.circular(5), // Same corners
                            borderSide: const BorderSide(
                              color: Colors.red, // Color when error
                              width: 1, // Border width
                            ),
                          ),
                          focusedErrorBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide: const BorderSide(
                              color: Colors.red,
                              width: 1,
                            ),
                          ),
                        ),
                        keyboardType: TextInputType.text,
                        onChanged: (val) {
                          searchByID = val;
                        },
                      ),
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
