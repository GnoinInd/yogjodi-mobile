import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/colored_button.dart';

class UpdateMyEduCareerScreen extends StatefulWidget {
  const UpdateMyEduCareerScreen({super.key});

  @override
  State<UpdateMyEduCareerScreen> createState() =>
      _UpdateMyEduCareerScreenState();
}

class _UpdateMyEduCareerScreenState extends State<UpdateMyEduCareerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
        title: const Text(
          StringConstants.update,
          style: TextStyle(
            fontFamily: "Inter",
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Text(
              StringConstants.educationAndCareer,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateMyEduCareerForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateMyEduCareerForm extends StatefulWidget {
  const UpdateMyEduCareerForm({super.key});

  @override
  State<UpdateMyEduCareerForm> createState() => _UpdateMyEduCareerFormState();
}

class _UpdateMyEduCareerFormState extends State<UpdateMyEduCareerForm> {
  String highestDegree = '';
  TextEditingController highestDegreeTEC = TextEditingController();
  String occupation = '';
  TextEditingController occupationTEC = TextEditingController();
  String employeeIn = '';
  final List<String> employeeInList = [
    'Select',
    'Self Employed',
    'Private',
    'Government',
  ];
  String organization = '';
  TextEditingController organizationTEC = TextEditingController();
  String designation = '';
  TextEditingController designationTEC = TextEditingController();
  String yearsOfExperience = '';
  final List<String> yearsOfExperienceList = [
    'Select',
    'Fresher',
  ];
  String monthlyIncome = '';
  TextEditingController monthlyIncomeTEC = TextEditingController();
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
  TextEditingController aboutJobTEC = TextEditingController();
  String aboutJobLocation = '';
  TextEditingController aboutJobLocationTEC = TextEditingController();

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
            controller: highestDegreeTEC,
            style: TextStyle(color: ColorConstants.color3),
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
            controller: occupationTEC,
            style: TextStyle(color: ColorConstants.color3),
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
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.employeeIn,
                style: TextStyle(
                  color: ColorConstants.color3,
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
          if (employeeIn != employeeInList[3]) ...{
            const SizedBox(height: 16),
            TextFormField(
              controller: organizationTEC,
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
                counterText: organization.isNotEmpty ? null : "",
                hintText: StringConstants.organization,
                hintStyle: TextStyle(color: ColorConstants.color3),
                labelText: StringConstants.organization,
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
                  organization = val;
                });
              },
            ),
          },
          const SizedBox(height: 16),
          TextFormField(
            controller: designationTEC,
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
              counterText: designation.isNotEmpty ? null : "",
              hintText: StringConstants.designation,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.designation,
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
                  color: ColorConstants.color3,
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
          const SizedBox(height: 16),
          TextFormField(
            controller: monthlyIncomeTEC,
            style: TextStyle(color: ColorConstants.color3),
            decoration: InputDecoration(
              counterText: monthlyIncome.isNotEmpty ? null : "",
              hintText: StringConstants.monthlyIncome,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.monthlyIncome,
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
                color: ColorConstants.color3,
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
          const SizedBox(height: 16),
          TextFormField(
            controller: aboutJobTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: aboutJob.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutJob.isNotEmpty ? null : "",
              hintText: StringConstants.aboutJob,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.aboutJob,
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
                aboutJob = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: aboutJobLocationTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: aboutJobLocation.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutJobLocation.isNotEmpty ? null : "",
              hintText: StringConstants.aboutJobLocation,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.aboutJobLocation,
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
                color: ColorConstants.textWhite,
                strokeWidth: 3.0,
              ),
            ),
            child: ColoredButton(
              radius: 50.0,
              color: ColorConstants.color13,
              onPressed: () async {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  FocusScope.of(context).unfocus();
                }
              },
              child: Text(
                StringConstants.save,
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
