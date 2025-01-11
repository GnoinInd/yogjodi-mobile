import 'package:flutter/material.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/my_countries_states_picker.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  int selectedIndex = 0;
  List<String> pages = [
    StringConstants.age,
    StringConstants.height1,
    StringConstants.maritalStatus1,
    StringConstants.religion,
    StringConstants.motherTongue,
    StringConstants.location,
    StringConstants.annualIncome1,
    StringConstants.residentialStatus1,
    StringConstants.educationAndOccupation,
  ];

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
  TextEditingController casteTEC = TextEditingController();
  String motherTongue = '';
  TextEditingController motherTongueTEC = TextEditingController();
  List<String> countries = [];
  List<String> states = [];
  TextEditingController countriesController = TextEditingController();
  TextEditingController statesController = TextEditingController();
  String annualIncome = '';
  final List<String> annualIncomeList = [
    'Select',
    '1.0 - 2.0 Lakh p.a.',
    '2.0 - 3.0 Lakh p.a.',
    '3.0 - 4.0 Lakh p.a.',
    '4.0 - 5.0 Lakh p.a.',
    '5.0 - 6.0 Lakh p.a.',
    '6.0 - 8.0 Lakh p.a.',
    '8.0 - 10.0 Lakh p.a.',
    '10.0 - 12.0 Lakh p.a.',
    '12.0 - 14.0 Lakh p.a.',
    '14.0 - 16.0 Lakh p.a.',
    '16.0 - 20.0 Lakh p.a.',
    '20.0 - 24.0 Lakh p.a.',
    '24.0 - 28.0 Lakh p.a.',
    '28.0 - 32.0 Lakh p.a.',
    '32.0 - 36.0 Lakh p.a.',
    '36.0 - 40.0 Lakh p.a.',
    '40.0 - 50.0 Lakh p.a.',
    '50.0 - 60.0 Lakh p.a.',
    '60.0 - 70.0 Lakh p.a.',
    '70.0 - 80.0 Lakh p.a.',
    '1.0 - 1.5 Crore p.a.',
    '1.5 - 2.0 Crore p.a.',
    '2.0 - 2.5 Crore p.a.',
    '2.5 - 3.0 Crore p.a.',
    '3.0 - 5.0 Crore p.a.',
  ];
  List<String> residentialStatusList = [];
  String education = '';
  TextEditingController educationTEC = TextEditingController();
  String occupation = '';
  TextEditingController occupationTEC = TextEditingController();

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
    return Scaffold(
      appBar: AppBar(
        title: Text(
          StringConstants.filter,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
            color: ColorConstants.color1,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Row(
        children: [
          Container(
            width: 105,
            height: MediaQuery.of(context).size.height,
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            color: ColorConstants.color8,
            child: ListView(
              children: pages
                  .map(
                    (page) => GestureDetector(
                      onTap: () {
                        setState(() {
                          selectedIndex = pages.indexOf(page);
                        });
                      },
                      child: Container(
                        width: double.infinity,
                        height: 65.0,
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          color: pages[selectedIndex] == page
                              ? ColorConstants.color14
                              : ColorConstants.color8,
                          border: Border(
                            bottom: BorderSide(
                              color: pages.last == page
                                  ? ColorConstants.color8
                                  : ColorConstants.color1,
                            ),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            page,
                            style: TextStyle(
                              fontFamily: "Poppins",
                              fontSize: 13,
                              fontWeight: FontWeight.w500,
                              color: ColorConstants.textBlack,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              children: [
                const SizedBox(height: 20.0),
                if (selectedIndex == 0) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          value: minAge.isNotEmpty ? minAge : ageList.first,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                          value: maxAge.isNotEmpty ? maxAge : ageList.first,
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
                },
                if (selectedIndex == 1) ...{
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                },
                if (selectedIndex == 2) ...{
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
                                    maritalStatusList
                                        .add(StringConstants.doesNotMatter);
                                  } else {
                                    maritalStatusList
                                        .remove(StringConstants.doesNotMatter);
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
                                  if (!maritalStatusList
                                      .contains(StringConstants.neverMarried)) {
                                    maritalStatusList
                                        .add(StringConstants.neverMarried);
                                  } else {
                                    maritalStatusList
                                        .remove(StringConstants.neverMarried);
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
                                  if (!maritalStatusList
                                      .contains(StringConstants.married)) {
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
                                    maritalStatusList
                                            .contains(StringConstants.married)
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
                                  if (!maritalStatusList
                                      .contains(StringConstants.divorced)) {
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
                                    maritalStatusList
                                            .contains(StringConstants.divorced)
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
                                  if (!maritalStatusList
                                      .contains(StringConstants.widowed)) {
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
                                    maritalStatusList
                                            .contains(StringConstants.widowed)
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
                                    maritalStatusList
                                        .add(StringConstants.awaitingMarried);
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
                                            StringConstants.awaitingMarried)
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
                                    maritalStatusList
                                        .add(StringConstants.awaitingDivorce);
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
                                            StringConstants.awaitingDivorce)
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
                },
                if (selectedIndex == 3) ...{
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
                                    religionList
                                        .add(StringConstants.doesNotMatter);
                                  } else {
                                    religionList
                                        .remove(StringConstants.doesNotMatter);
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
                                    religionList.add(StringConstants.hindu);
                                  } else {
                                    religionList.remove(StringConstants.hindu);
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
                                    religionList.contains(StringConstants.hindu)
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
                                    religionList.add(StringConstants.muslim);
                                  } else {
                                    religionList.remove(StringConstants.muslim);
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
                                    religionList
                                            .contains(StringConstants.muslim)
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
                                    religionList.add(StringConstants.sikh);
                                  } else {
                                    religionList.remove(StringConstants.sikh);
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
                                    religionList.contains(StringConstants.sikh)
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
                                  if (!religionList
                                      .contains(StringConstants.christian)) {
                                    religionList.add(StringConstants.christian);
                                  } else {
                                    religionList
                                        .remove(StringConstants.christian);
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
                                    religionList
                                            .contains(StringConstants.christian)
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
                                  if (!religionList
                                      .contains(StringConstants.buddhist)) {
                                    religionList.add(StringConstants.buddhist);
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
                                    religionList
                                            .contains(StringConstants.buddhist)
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
                                    religionList.add(StringConstants.jain);
                                  } else {
                                    religionList.remove(StringConstants.jain);
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
                                    religionList.contains(StringConstants.jain)
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
                                    religionList.add(StringConstants.parsi);
                                  } else {
                                    religionList.remove(StringConstants.parsi);
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
                                    religionList.contains(StringConstants.parsi)
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
                                    religionList.add(StringConstants.jewish);
                                  } else {
                                    religionList.remove(StringConstants.jewish);
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
                                    religionList
                                            .contains(StringConstants.jewish)
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
                                    religionList.add(StringConstants.bahai);
                                  } else {
                                    religionList.remove(StringConstants.bahai);
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
                                    religionList.contains(StringConstants.bahai)
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
                    controller: casteTEC,
                    style: TextStyle(
                      color: ColorConstants.color3,
                    ),
                    decoration: InputDecoration(
                      // hintText: StringConstants.caste,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.caste,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                },
                if (selectedIndex == 4) ...{
                  TextField(
                    controller: motherTongueTEC,
                    style: TextStyle(
                      color: ColorConstants.color3,
                    ),
                    decoration: InputDecoration(
                      // hintText: StringConstants.motherTongue,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.motherTongue,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                },
                if (selectedIndex == 5) ...{
                  CountriesStatesPicker(
                    countriesController: countriesController,
                    countries: countries,
                    countriesInputDecoration: InputDecoration(
                      // hintText: StringConstants.country,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.country,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                    statesController: statesController,
                    states: states,
                    statesInputDecoration: InputDecoration(
                      // hintText: StringConstants.state,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.state,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                    inputTextStyle: TextStyle(color: ColorConstants.color3),
                    dialogBGColor: ColorConstants.color4,
                  ),
                },
                if (selectedIndex == 6) ...{
                  Align(
                    alignment: Alignment.topLeft,
                    child: DropdownButtonFormField<String>(
                      menuMaxHeight: 200,
                      value: annualIncome.isNotEmpty
                          ? annualIncome
                          : annualIncomeList.first,
                      hint: Text(annualIncomeList.first),
                      onChanged: (String? newValue) {
                        setState(() {
                          annualIncome = newValue!;
                          if (annualIncome == annualIncomeList.first) {
                            annualIncome = "";
                          }
                        });
                      },
                      items: annualIncomeList.map((String annualIncome_) {
                        return DropdownMenuItem<String>(
                          value: annualIncome_,
                          child: Text(annualIncome_),
                        );
                      }).toList(),
                      decoration: InputDecoration(
                        labelText: StringConstants.annualIncome.substring(
                            0, StringConstants.annualIncome.length - 1),
                        labelStyle: TextStyle(color: ColorConstants.color11),
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
                          borderRadius: BorderRadius.circular(5),
                          // Same corners
                          borderSide: BorderSide(
                            color: ColorConstants.color10, // Color when focused
                            width: 1, // Border width
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          // Same corners
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
                    ),
                  ),
                },
                if (selectedIndex == 7) ...{
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
                                    residentialStatusList
                                        .add(StringConstants.doesNotMatter);
                                  } else {
                                    residentialStatusList
                                        .remove(StringConstants.doesNotMatter);
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
                                  if (!residentialStatusList
                                      .contains(StringConstants.citizen)) {
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
                                    residentialStatusList
                                            .contains(StringConstants.citizen)
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
                                  if (!residentialStatusList
                                      .contains(StringConstants.workPermit)) {
                                    residentialStatusList
                                        .add(StringConstants.workPermit);
                                  } else {
                                    residentialStatusList
                                        .remove(StringConstants.workPermit);
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
                                  if (!residentialStatusList
                                      .contains(StringConstants.studentVisa)) {
                                    residentialStatusList
                                        .add(StringConstants.studentVisa);
                                  } else {
                                    residentialStatusList
                                        .remove(StringConstants.studentVisa);
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
                                      StringConstants.permanentResident)) {
                                    residentialStatusList
                                        .add(StringConstants.permanentResident);
                                  } else {
                                    residentialStatusList.remove(
                                        StringConstants.permanentResident);
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
                                            StringConstants.permanentResident)
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
                },
                if (selectedIndex == 8) ...{
                  TextField(
                    controller: educationTEC,
                    style: TextStyle(
                      color: ColorConstants.color3,
                    ),
                    decoration: InputDecoration(
                      // hintText: StringConstants.education,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.education,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                    controller: occupationTEC,
                    style: TextStyle(
                      color: ColorConstants.color3,
                    ),
                    decoration: InputDecoration(
                      // hintText: StringConstants.occupation,
                      // hintStyle: TextStyle(color: ColorConstants.color11),
                      labelText: StringConstants.occupation,
                      labelStyle: TextStyle(color: ColorConstants.color11),
                      contentPadding: const EdgeInsets.all(15.0),
                      enabledBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        // Rounded corners
                        borderSide: BorderSide(
                          color: ColorConstants.color5, // Border color
                          width: 1, // Border width
                        ),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
                        borderSide: BorderSide(
                          color: ColorConstants.color10, // Color when focused
                          width: 1, // Border width
                        ),
                      ),
                      errorBorder: UnderlineInputBorder(
                        borderRadius: BorderRadius.circular(5), // Same corners
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
                },
              ],
            ),
          ),
        ],
      ),
    );
  }
}
