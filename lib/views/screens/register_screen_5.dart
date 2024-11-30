import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:yog_jodi/views/screens/register_screen_3.dart';
import 'package:yog_jodi/views/screens/register_screen_6.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../../common/utils/utility_methods.dart';
import '../widgets/border_button.dart';
import '../widgets/colored_button.dart';
import 'package:get/get.dart';

class RegisterScreen5 extends StatefulWidget {
  const RegisterScreen5({super.key});

  @override
  State<RegisterScreen5> createState() => _RegisterScreen5State();
}

class _RegisterScreen5State extends State<RegisterScreen5> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color4,
      appBar: AppBar(
        title: const Text(StringConstants.register),
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
        actions: [
          TextButton(
            onPressed: () {
              Get.to(() => const RegisterScreen6());
            },
            child: Text(
              StringConstants.skip,
              style: TextStyle(
                fontSize: 20,
                color: ColorConstants.textWhite,
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
                color: ColorConstants.color1,
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
  String country = '';
  String state = '';
  String skills = '';
  String highestDegree = '';
  String occupation = '';
  String minAnnualIncome = '';
  String maxAnnualIncome = '';
  String religion = '';
  String caste = '';
  String maritalStatus = '';
  final List<String> maritalStatusList = [
    'Select',
    'Single',
    'Married',
    'Divorced',
    'Widower',
    'Widow',
  ];
  String smoking = '';
  String drinking = '';
  final List<String> badHabitsList = [
    'Select',
    'Never',
    'Sometimes',
    'Occasionally',
    'Regular',
  ];
  String diet = '';
  final List<String> dietList = [
    'Select',
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
  ];
  String goutra = '';
  String aboutPartner = '';
  String residentialStatus = '';

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
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 200,
                  value: minAge,
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
                        color: ColorConstants.color1,
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
                  value: maxAge,
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
                        color: ColorConstants.color1,
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
                  value: minHeight,
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
                        color: ColorConstants.color1,
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
                  value: maxHeight,
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
                        color: ColorConstants.color1,
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
            style: TextStyle(color: ColorConstants.color3),
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
              counterText: country.isNotEmpty ? null : "",
              hintText: StringConstants.country,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.country,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
                country = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
              counterText: state.isNotEmpty ? null : "",
              hintText: StringConstants.state,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.state,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
                state = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: skills.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: skills.isNotEmpty ? null : "",
              hintText: StringConstants.skills,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.skills,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
                skills = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.highestDegree,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.occupation,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            decoration: InputDecoration(
              counterText: minAnnualIncome.isNotEmpty ? null : "",
              hintText: StringConstants.minAnnualIncome,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.minAnnualIncome,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
            keyboardType: TextInputType.text,
            onChanged: (val) {
              setState(() {
                minAnnualIncome = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            decoration: InputDecoration(
              counterText: maxAnnualIncome.isNotEmpty ? null : "",
              hintText: StringConstants.maxAnnualIncome,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.maxAnnualIncome,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
            keyboardType: TextInputType.text,
            onChanged: (val) {
              setState(() {
                maxAnnualIncome = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.smoking,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: smoking,
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
                        color: ColorConstants.color5,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.color1,
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
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: drinking,
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
                        color: ColorConstants.color5,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.color1,
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
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButtonFormField<String>(
                  // validator: _validateDiet,
                  value: diet,
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
                        color: ColorConstants.color5,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.color1,
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
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.50,
                child: DropdownButtonFormField<String>(
                  value: maritalStatus,
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
                        color: ColorConstants.color5,
                        width: 1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                      borderSide: BorderSide(
                        color: ColorConstants.color1,
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
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.religion,
              labelStyle: TextStyle(color: ColorConstants.color3),
              // prefixIcon: Icon(
              //   Icons.person_outline,
              //   color: ColorConstants.color3,
              // ),
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
                  color: ColorConstants.color1,
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
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.caste,
              labelStyle: TextStyle(color: ColorConstants.color3),
              // prefixIcon: Icon(
              //   Icons.person_outline,
              //   color: ColorConstants.color3,
              // ),
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
                  color: ColorConstants.color1,
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
            style: TextStyle(color: ColorConstants.color3),
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
            // maxLengthEnforcement: goutra.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: goutra.isNotEmpty ? null : "",
              hintText: StringConstants.goutra,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.goutra,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
                goutra = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: aboutPartner.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutPartner.isNotEmpty ? null : "",
              hintText: StringConstants.aboutPartner,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.aboutPartner,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
            // maxLengthEnforcement: goutra.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: residentialStatus.isNotEmpty ? null : "",
              hintText: StringConstants.residentialStatus,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.residentialStatus,
              labelStyle: TextStyle(color: ColorConstants.color3),
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
                  color: ColorConstants.color1,
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
                residentialStatus = val;
              });
            },
          ),
          const SizedBox(height: 40.0),
          Visibility(
            visible: true,
            replacement: Center(
              child: CircularProgressIndicator(
                color: ColorConstants.textWhite,
                strokeWidth: 3.0,
              ),
            ),
            child: ColoredButton(
              color: ColorConstants.color6,
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
                  color: ColorConstants.textWhite,
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
