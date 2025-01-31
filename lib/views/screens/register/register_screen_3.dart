import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/register/register_screen_4.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/colored_button.dart';

class RegisterScreen3 extends StatefulWidget {
  const RegisterScreen3({super.key});

  @override
  State<RegisterScreen3> createState() => _RegisterScreen3State();
}

class _RegisterScreen3State extends State<RegisterScreen3> {
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
              Get.to(() => const RegisterScreen4());
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
              StringConstants.careerDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.jazzberryJam,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm3(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm3 extends StatefulWidget {
  const RegisterForm3({super.key});

  @override
  State<RegisterForm3> createState() => _RegisterForm3State();
}

class _RegisterForm3State extends State<RegisterForm3> {
  String highestDegree = '';
  String occupation = '';
  String employeeIn = '';
  final List<String> employeeInList = [
    'Select',
    'Self Employed',
    'Private',
    'Government',
  ];
  String organization = '';
  String designation = '';
  String yearsOfExperience = '';
  final List<String> yearsOfExperienceList = [
    'Select',
    'Fresher',
  ];
  String monthlyIncome = '';
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
  String aboutJob = '';
  String aboutJobLocation = '';

  final _formKey = GlobalKey<FormState>();

  String? _validateHighestDegree(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.highestDegreeIsRequired;
    }
    return null;
  }

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

  String? _validateOccupation(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.occupationIsRequired;
    }
    return null;
  }

  String? _validateemployeeIn(String? value) {
    if (value == employeeInList.first) {
      return StringConstants.employeeInIsRequired;
    }

    return null;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    employeeIn = employeeInList.first;
    yearsOfExperience = yearsOfExperienceList.first;

    ///Add years to list
    for (int year = 1; year <= 20; year++) {
      String newYear = '$year ${(year > 1) ? ' years' : ' year'}';
      yearsOfExperienceList.add(newYear);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            validator: _validateHighestDegree,
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
            validator: _validateOccupation,
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
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.employeeIn,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  validator: _validateemployeeIn,
                  value: employeeIn,
                  hint: Text(employeeInList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      employeeIn = newValue!;
                      if (employeeIn == employeeInList[3]) {
                        organization = '';
                      }
                    });
                  },
                  items: employeeInList.map((String employeeIn_) {
                    return DropdownMenuItem<String>(
                      value: employeeIn_,
                      child: Text(employeeIn_),
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
          if (employeeIn != employeeInList[3]) ...{
            const SizedBox(height: 16),
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
                counterText: organization.isNotEmpty ? null : "",
                hintText: StringConstants.organization,
                hintStyle: TextStyle(color: ColorConstants.tundora),
                labelText: StringConstants.organization,
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
                  organization = val;
                });
              },
            ),
          },
          const SizedBox(height: 16),
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
              counterText: designation.isNotEmpty ? null : "",
              hintText: StringConstants.designation,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.designation,
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
                designation = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.yearsOfExperience,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 200,
                  value: yearsOfExperience.isNotEmpty
                      ? yearsOfExperience
                      : yearsOfExperienceList.first,
                  hint: Text(yearsOfExperienceList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      yearsOfExperience = newValue!;
                      if (yearsOfExperience == yearsOfExperienceList.first) {
                        yearsOfExperience = "";
                      }
                    });
                  },
                  items: yearsOfExperienceList.map((String yearsOfExperience_) {
                    return DropdownMenuItem<String>(
                      value: yearsOfExperience_,
                      child: Text(yearsOfExperience_),
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
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.tundora),
            decoration: InputDecoration(
              counterText: monthlyIncome.isNotEmpty ? null : "",
              hintText: StringConstants.monthlyIncome,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.monthlyIncome,
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
            keyboardType: TextInputType.text,
            onChanged: (val) {
              setState(() {
                monthlyIncome = val;
              });
            },
          ),
          const SizedBox(height: 16),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: annualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.annualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.annualIncome,
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
          //       annualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.annualIncome,
              style: TextStyle(
                color: ColorConstants.tundora,
                fontSize: 17.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(height: 10),
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
          TextFormField(
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 100,
            maxLengthEnforcement: aboutJob.isNotEmpty
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            decoration: InputDecoration(
              counterText: aboutJob.isNotEmpty ? null : "",
              hintText: StringConstants.aboutJob,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.aboutJob,
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
                aboutJob = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 100,
            maxLengthEnforcement: aboutJobLocation.isNotEmpty
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            decoration: InputDecoration(
              counterText: aboutJobLocation.isNotEmpty ? null : "",
              hintText: StringConstants.aboutJobLocation,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.aboutJobLocation,
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
            keyboardType: TextInputType.streetAddress,
            onChanged: (val) {
              setState(() {
                aboutJobLocation = val;
              });
            },
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
                Get.to(() => const RegisterScreen4());
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
