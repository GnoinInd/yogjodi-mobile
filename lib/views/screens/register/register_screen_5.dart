import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/register/register_screen_6.dart';
import 'package:yog_jodi/views/widgets/my_countries_states_picker.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class RegisterScreen5 extends StatefulWidget {
  const RegisterScreen5({super.key});

  @override
  State<RegisterScreen5> createState() => _RegisterScreen5State();
}

class _RegisterScreen5State extends State<RegisterScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.desertStorm,
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
        title: const Text(
          StringConstants.register,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const RegisterScreen6());
            },
            child: Text(
              StringConstants.skip,
              style: TextStyle(
                fontSize: 20,
                color: ColorConstants.theWhite,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Text(
              StringConstants.partnerDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.jazzberryJam,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm5(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm5 extends StatefulWidget {
  const RegisterForm5({super.key});

  @override
  State<RegisterForm5> createState() => _RegisterForm5State();
}

class _RegisterForm5State extends State<RegisterForm5> {
  String minAge = '';
  String maxAge = '';
  final List<String> ageList = ['Select'];
  String minHeight = '';
  String maxHeight = '';
  final List<String> heightList = ['Select'];
  List<String> countries = [];
  List<String> states = [];
  TextEditingController countriesController = TextEditingController();
  TextEditingController statesController = TextEditingController();
  String highestDegree = '';
  String occupation = '';
  String minAnnualIncome = '';
  String maxAnnualIncome = '';
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
  String religion = '';
  String caste = '';
  String maritalStatus = '';
  final List<String> maritalStatusList = [
    'Select',
    'Never Married',
    'Married',
    'Divorced',
    'Widower',
    'Widow',
    "Doesn't matter",
  ];
  String smoking = '';
  String drinking = '';
  final List<String> badHabitsList = [
    'Select',
    'Never',
    'Sometimes',
    'Occasionally',
    'Regular',
    "Doesn't matter",
  ];
  String diet = '';
  final List<String> dietList = [
    'Select',
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
    "Doesn't matter",
  ];
  String goutraToExclude = '';
  String aboutPartner = '';
  String residentialStatus = '';
  final List<String> residentialStatusList = [
    'Select',
    'Citizen',
    'Work Permit',
    'Student Visa',
    'Permanent Resident',
    "Doesn't matter",
  ];

  final _formKey = GlobalKey<FormState>();

  String toTitleCase(String text) {
    if (text.isEmpty) return '';

    final words = text.split(' ');
    final titleCaseWords = words.map((word) {
      if (word.isNotEmpty) {
        return word[0].toUpperCase() + word.substring(1).toLowerCase();
      }
      return '';
    });

    return titleCaseWords.join(' ');
  }

  @override
  void initState() {
    minAge = ageList.first;
    maxAge = ageList.first;
    minHeight = heightList.first;
    maxHeight = heightList.first;
    maritalStatus = maritalStatusList.first;
    smoking = badHabitsList.first;
    drinking = badHabitsList.first;
    diet = dietList.first;

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
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.minAge,
                style: TextStyle(
                  color: ColorConstants.tundora,
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
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                  color: ColorConstants.tundora,
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
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 200,
                  value: minHeight.isNotEmpty ? minHeight : heightList.first,
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
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 200,
                  value: maxHeight.isNotEmpty ? maxHeight : heightList.first,
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
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(
          //         RegExp(r'[a-zA-Z ]') // Allow alphabets and space
          //         ),
          //     TextInputFormatter.withFunction(
          //       (oldValue, newValue) {
          //         // Convert the new input to title case
          //         if (newValue.text.isNotEmpty) {
          //           final convertedValue = toTitleCase(newValue.text);
          //           return TextEditingValue(
          //             text: convertedValue,
          //             selection: TextSelection.fromPosition(
          //               TextPosition(offset: convertedValue.length),
          //             ),
          //           );
          //         }
          //         return newValue;
          //       },
          //     ),
          //   ],
          //   // maxLength: 30,
          //   // maxLengthEnforcement: firstName.isNotEmpty
          //   //     ? MaxLengthEnforcement.none
          //   //     : MaxLengthEnforcement.enforced,
          //   decoration: InputDecoration(
          //     counterText: country.isNotEmpty ? null : "",
          //     hintText: StringConstants.country,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.country,
          //     labelStyle: TextStyle(color: ColorConstants.color3),
          //     contentPadding: const EdgeInsets.all(15.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color5,
          //         width: 1,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color1,
          //         width: 1,
          //       ),
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //     focusedErrorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   keyboardType: TextInputType.name,
          //   onChanged: (val) {
          //     setState(() {
          //       country = val;
          //     });
          //   },
          // ),
          // const SizedBox(height: 16.0),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(
          //         RegExp(r'[a-zA-Z ]') // Allow alphabets and space
          //         ),
          //     TextInputFormatter.withFunction(
          //       (oldValue, newValue) {
          //         // Convert the new input to title case
          //         if (newValue.text.isNotEmpty) {
          //           final convertedValue = toTitleCase(newValue.text);
          //           return TextEditingValue(
          //             text: convertedValue,
          //             selection: TextSelection.fromPosition(
          //               TextPosition(offset: convertedValue.length),
          //             ),
          //           );
          //         }
          //         return newValue;
          //       },
          //     ),
          //   ],
          //   // maxLength: 30,
          //   // maxLengthEnforcement: firstName.isNotEmpty
          //   //     ? MaxLengthEnforcement.none
          //   //     : MaxLengthEnforcement.enforced,
          //   decoration: InputDecoration(
          //     counterText: state.isNotEmpty ? null : "",
          //     hintText: StringConstants.state,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.state,
          //     labelStyle: TextStyle(color: ColorConstants.color3),
          //     contentPadding: const EdgeInsets.all(15.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color5,
          //         width: 1,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color1,
          //         width: 1,
          //       ),
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //     focusedErrorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   keyboardType: TextInputType.name,
          //   onChanged: (val) {
          //     setState(() {
          //       state = val;
          //     });
          //   },
          // ),
          const SizedBox(height: 16.0),
          CountriesStatesPicker(
            countriesController: countriesController,
            countries: countries,
            countriesInputDecoration: InputDecoration(
              hintText: StringConstants.country,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.country,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            statesController: statesController,
            states: states,
            statesInputDecoration: InputDecoration(
              hintText: StringConstants.state,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.state,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            inputTextStyle: TextStyle(color: ColorConstants.tundora),
            dialogBGColor: ColorConstants.desertStorm,
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to title case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = toTitleCase(newValue.text);
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            // maxLength: 30,
            // maxLengthEnforcement: firstName.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: highestDegree.isNotEmpty ? null : "",
              hintText: StringConstants.highestDegree,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.highestDegree,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                highestDegree = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to title case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = toTitleCase(newValue.text);
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            // maxLength: 30,
            // maxLengthEnforcement: firstName.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: occupation.isNotEmpty ? null : "",
              hintText: StringConstants.occupation,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.occupation,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                occupation = val;
              });
            },
          ),
          const SizedBox(height: 16),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: minAnnualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.minAnnualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.minAnnualIncome,
          //     labelStyle: TextStyle(color: ColorConstants.color3),
          //     contentPadding: const EdgeInsets.all(15.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color5,
          //         width: 1,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color1,
          //         width: 1,
          //       ),
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //     focusedErrorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   keyboardType: TextInputType.text,
          //   onChanged: (val) {
          //     setState(() {
          //       minAnnualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.minAnnualIncome,
              style: TextStyle(
                color: ColorConstants.tundora,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 200,
              value: minAnnualIncome.isNotEmpty
                  ? minAnnualIncome
                  : annualIncomeList.first,
              hint: Text(annualIncomeList.first),
              onChanged: (String? newValue) {
                setState(() {
                  minAnnualIncome = newValue!;
                  if (minAnnualIncome == annualIncomeList.first) {
                    minAnnualIncome = "";
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
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.silver,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.jazzberryJam,
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
          const SizedBox(height: 16),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: maxAnnualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.maxAnnualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.maxAnnualIncome,
          //     labelStyle: TextStyle(color: ColorConstants.color3),
          //     contentPadding: const EdgeInsets.all(15.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color5,
          //         width: 1,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color1,
          //         width: 1,
          //       ),
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //     focusedErrorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   keyboardType: TextInputType.text,
          //   onChanged: (val) {
          //     setState(() {
          //       maxAnnualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.maxAnnualIncome,
              style: TextStyle(
                color: ColorConstants.tundora,
                fontSize: 16.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButtonFormField<String>(
              menuMaxHeight: 200,
              value: maxAnnualIncome.isNotEmpty
                  ? maxAnnualIncome
                  : annualIncomeList.first,
              hint: Text(annualIncomeList.first),
              onChanged: (String? newValue) {
                setState(() {
                  maxAnnualIncome = newValue!;
                  if (maxAnnualIncome == annualIncomeList.first) {
                    maxAnnualIncome = "";
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
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.silver,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.jazzberryJam,
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
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.smoking,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: smoking.isNotEmpty ? smoking : badHabitsList.first,
                  hint: Text(badHabitsList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      smoking = newValue!;
                      if (smoking == badHabitsList.first) {
                        smoking = "";
                      }
                    });
                  },
                  items: badHabitsList.map((String badHabit_) {
                    return DropdownMenuItem<String>(
                      value: badHabit_,
                      child: Text(badHabit_),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                StringConstants.drinking,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: drinking.isNotEmpty ? drinking : badHabitsList.first,
                  hint: Text(badHabitsList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      drinking = newValue!;
                      if (drinking == badHabitsList.first) {
                        drinking = "";
                      }
                    });
                  },
                  items: badHabitsList.map((String badHabit_) {
                    return DropdownMenuItem<String>(
                      value: badHabit_,
                      child: Text(badHabit_),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                StringConstants.diet,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButtonFormField<String>(
                  // validator: _validateDiet,
                  value: diet.isNotEmpty ? diet : dietList.first,
                  hint: Text(dietList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      diet = newValue!;
                      if (diet == dietList.first) {
                        diet = "";
                      }
                    });
                  },
                  items: dietList.map((String diet_) {
                    return DropdownMenuItem<String>(
                      value: diet_,
                      child: Text(diet_),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
                StringConstants.maritalStatus,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: DropdownButtonFormField<String>(
                  value: maritalStatus.isNotEmpty
                      ? maritalStatus
                      : maritalStatusList.first,
                  hint: Text(maritalStatusList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      maritalStatus = newValue!;
                      if (maritalStatus == maritalStatusList.first) {
                        maritalStatus = '';
                      }
                    });
                  },
                  items: maritalStatusList.map((String maritalStatus_) {
                    return DropdownMenuItem<String>(
                      value: maritalStatus_,
                      child: Text(maritalStatus_),
                    );
                  }).toList(),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.all(15.0),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.silver,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.jazzberryJam,
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
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to title case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = toTitleCase(newValue.text);
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            // maxLength: 30,
            // maxLengthEnforcement: firstName.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: religion.isNotEmpty ? null : "",
              hintText: StringConstants.religion,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.religion,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              // prefixIcon: Icon(
              //   Icons.person_outline,
              //   color: ColorConstants.color3,
              // ),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                religion = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to title case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = toTitleCase(newValue.text);
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            // maxLength: 30,
            // maxLengthEnforcement: firstName.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: caste.isNotEmpty ? null : "",
              hintText: StringConstants.caste,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.caste,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              // prefixIcon: Icon(
              //   Icons.person_outline,
              //   color: ColorConstants.color3,
              // ),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                caste = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                  RegExp(r'[a-zA-Z ]') // Allow alphabets and space
                  ),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  // Convert the new input to title case
                  if (newValue.text.isNotEmpty) {
                    final convertedValue = toTitleCase(newValue.text);
                    return TextEditingValue(
                      text: convertedValue,
                      selection: TextSelection.fromPosition(
                        TextPosition(offset: convertedValue.length),
                      ),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            // maxLength: 30,
            // maxLengthEnforcement: goutraToExclude.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: goutraToExclude.isNotEmpty ? null : "",
              hintText: StringConstants.goutraToExclude,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.goutraToExclude,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                goutraToExclude = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 100,
            maxLengthEnforcement: aboutPartner.isNotEmpty
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            decoration: InputDecoration(
              counterText: aboutPartner.isNotEmpty ? null : "",
              hintText: StringConstants.aboutPartner,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.aboutPartner,
              labelStyle: TextStyle(color: ColorConstants.tundora),
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.silver,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: BorderSide(
                  color: ColorConstants.jazzberryJam,
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
            keyboardType: TextInputType.multiline,
            onChanged: (val) {
              setState(() {
                aboutPartner = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(
          //         RegExp(r'[a-zA-Z ]') // Allow alphabets and space
          //         ),
          //     TextInputFormatter.withFunction(
          //       (oldValue, newValue) {
          //         // Convert the new input to title case
          //         if (newValue.text.isNotEmpty) {
          //           final convertedValue = toTitleCase(newValue.text);
          //           return TextEditingValue(
          //             text: convertedValue,
          //             selection: TextSelection.fromPosition(
          //               TextPosition(offset: convertedValue.length),
          //             ),
          //           );
          //         }
          //         return newValue;
          //       },
          //     ),
          //   ],
          //   // maxLength: 30,
          //   // maxLengthEnforcement: goutra.isNotEmpty
          //   //     ? MaxLengthEnforcement.none
          //   //     : MaxLengthEnforcement.enforced,
          //   decoration: InputDecoration(
          //     counterText: residentialStatus.isNotEmpty ? null : "",
          //     hintText: StringConstants.residentialStatus,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.residentialStatus,
          //     labelStyle: TextStyle(color: ColorConstants.color3),
          //     contentPadding: const EdgeInsets.all(15.0),
          //     enabledBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color5,
          //         width: 1,
          //       ),
          //     ),
          //     focusedBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: BorderSide(
          //         color: ColorConstants.color1,
          //         width: 1,
          //       ),
          //     ),
          //     errorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //     focusedErrorBorder: OutlineInputBorder(
          //       borderRadius: BorderRadius.circular(5),
          //       borderSide: const BorderSide(
          //         color: Colors.red,
          //         width: 1,
          //       ),
          //     ),
          //   ),
          //   keyboardType: TextInputType.name,
          //   onChanged: (val) {
          //     setState(() {
          //       residentialStatus = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.residentialStatus,
              style: TextStyle(
                color: ColorConstants.tundora,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10.0),
          Align(
            alignment: Alignment.topLeft,
            child: DropdownButtonFormField<String>(
              value: residentialStatus.isNotEmpty
                  ? residentialStatus
                  : residentialStatusList.first,
              hint: Text(residentialStatusList.first),
              onChanged: (String? newValue) {
                setState(() {
                  residentialStatus = newValue!;
                  if (residentialStatus == residentialStatusList.first) {
                    residentialStatus = '';
                  }
                });
              },
              items: residentialStatusList.map((String residentialStatus_) {
                return DropdownMenuItem<String>(
                  value: residentialStatus_,
                  child: Text(residentialStatus_),
                );
              }).toList(),
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(15.0),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.silver,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5),
                  borderSide: BorderSide(
                    color: ColorConstants.jazzberryJam,
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
          const SizedBox(height: 40.0),
          Visibility(
            visible: true,
            replacement: Center(
              child: CircularProgressIndicator(
                color: ColorConstants.theWhite,
                strokeWidth: 3.0,
              ),
            ),
            child: ColoredButton(
              color: ColorConstants.pickledBluewood,
              onPressed: () async {
                Get.to(() => const RegisterScreen6());
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                }
              },
              child: Text(
                StringConstants.next,
                style: TextStyle(
                  fontSize: 18,
                  color: ColorConstants.theWhite,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}
