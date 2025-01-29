import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/colored_button.dart';

class UpdateFamilyDetailsScreen extends StatefulWidget {
  const UpdateFamilyDetailsScreen({super.key});

  @override
  State<UpdateFamilyDetailsScreen> createState() =>
      _UpdateFamilyDetailsScreenState();
}

class _UpdateFamilyDetailsScreenState extends State<UpdateFamilyDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
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
              StringConstants.familyDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.jazzberryJam,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateFamilyDetailsForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateFamilyDetailsForm extends StatefulWidget {
  const UpdateFamilyDetailsForm({super.key});

  @override
  State<UpdateFamilyDetailsForm> createState() =>
      _UpdateFamilyDetailsFormState();
}

class _UpdateFamilyDetailsFormState extends State<UpdateFamilyDetailsForm> {
  String fatherName = '';
  TextEditingController fatherNameTEC = TextEditingController();
  String motherName = '';
  TextEditingController motherNameTEC = TextEditingController();
  String brothers = '';
  TextEditingController brothersTEC = TextEditingController();
  String sisters = '';
  TextEditingController sistersTEC = TextEditingController();
  String fatherOccupation = '';
  TextEditingController fatherOccupationTEC = TextEditingController();
  String motherOccupation = '';
  TextEditingController motherOccupationTEC = TextEditingController();
  String familyAnnualIncome = '';
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
  String familyStatus = '';
  final List<String> familyStatusList = [
    'Select',
    "Lower Class",
    "Middle Class",
    "Upper Class",
    "Elite Class",
    "Super Rich",
  ];
  String familyType = '';
  final List<String> familyTypeList = [
    'Select',
    "Nuclear Family",
    "Joint Family",
    "Extended Family",
  ];
  String aboutMyFamily = '';
  TextEditingController aboutFamilyTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  String? _validateFatherName(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.fatherNameIsRequired;
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

  // String? _validateMotherName(String? value) {
  //   if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
  //     return StringConstants.motherNameIsRequired;
  //   }
  //   return null;
  // }

  // String? _validateFamilyType(String? value) {
  //   if (value == familyTypeList.first) {
  //     return StringConstants.employeeInIsRequired;
  //   }
  //
  //   return null;
  // }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    familyType = familyTypeList.first;

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: fatherNameTEC,
            style: TextStyle(color: ColorConstants.tundora),
            validator: _validateFatherName,
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
              counterText: fatherName.isNotEmpty ? null : "",
              hintText: StringConstants.fatherName,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.fatherName,
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
                fatherName = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: motherNameTEC,
            style: TextStyle(color: ColorConstants.tundora),
            // validator: _validateMotherName,
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
              counterText: motherName.isNotEmpty ? null : "",
              hintText: StringConstants.motherName,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.motherName,
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
                motherName = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: brothersTEC,
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[1-9]'), // Add characters to allow
              ),
            ],
            maxLength: 1,
            maxLengthEnforcement: brothers.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: brothers.isNotEmpty ? null : "",
              hintText: StringConstants.numberOfBrothers,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.numberOfBrothers,
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
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                brothers = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            controller: sistersTEC,
            style: TextStyle(color: ColorConstants.tundora),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[1-9]'), // Add characters to allow
              ),
            ],
            maxLength: 1,
            maxLengthEnforcement: sisters.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: sisters.isNotEmpty ? null : "",
              hintText: StringConstants.numberOfSisters,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.numberOfSisters,
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
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                sisters = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: fatherOccupationTEC,
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
              counterText: fatherOccupation.isNotEmpty ? null : "",
              hintText: StringConstants.fatherOccupation,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.fatherOccupation,
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
                fatherOccupation = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: motherOccupationTEC,
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
              counterText: motherOccupation.isNotEmpty ? null : "",
              hintText: StringConstants.motherOccupation,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.motherOccupation,
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
                motherOccupation = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: familyAnnualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.familyAnnualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.familyAnnualIncome,
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
          //       familyAnnualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.familyAnnualIncome,
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
              value: familyAnnualIncome.isNotEmpty
                  ? familyAnnualIncome
                  : annualIncomeList.first,
              hint: Text(annualIncomeList.first),
              onChanged: (String? newValue) {
                setState(() {
                  familyAnnualIncome = newValue!;
                  if (familyAnnualIncome == annualIncomeList.first) {
                    familyAnnualIncome = "";
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
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: familyStatus.isNotEmpty ? null : "",
          //     hintText: StringConstants.familyStatus,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.familyStatus,
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
          //       familyStatus = val;
          //     });
          //   },
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.familyStatus,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  // validator: _validateFamilyType,
                  value: familyStatus.isNotEmpty
                      ? familyStatus
                      : familyStatusList.first,
                  hint: Text(familyStatusList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      familyStatus = newValue!;
                      if (familyStatus == familyStatusList.first) {
                        familyStatus = "";
                      }
                    });
                  },
                  items: familyStatusList.map((String familyStatus_) {
                    return DropdownMenuItem<String>(
                      value: familyStatus_,
                      child: Text(familyStatus_),
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
                StringConstants.familyType,
                style: TextStyle(
                  color: ColorConstants.tundora,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.55,
                child: DropdownButtonFormField<String>(
                  // validator: _validateFamilyType,
                  value:
                      familyType.isNotEmpty ? familyType : familyTypeList.first,
                  hint: Text(familyTypeList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      familyType = newValue!;
                      if (familyType == familyTypeList.first) {
                        familyType = "";
                      }
                    });
                  },
                  items: familyTypeList.map((String familyType_) {
                    return DropdownMenuItem<String>(
                      value: familyType_,
                      child: Text(familyType_),
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
            controller: aboutFamilyTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 100,
            maxLengthEnforcement: aboutMyFamily.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutMyFamily.isNotEmpty ? null : "",
              hintText: StringConstants.aboutMyFamily,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.aboutMyFamily,
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
                aboutMyFamily = val;
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
              radius: 50.0,
              color: ColorConstants.brickRed,
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
