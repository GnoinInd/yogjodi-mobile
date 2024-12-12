import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yog_jodi/views/screens/register_screen_5.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../../common/utils/utility_methods.dart';
import '../widgets/colored_button.dart';
import 'package:get/get.dart';

class RegisterScreen4 extends StatefulWidget {
  const RegisterScreen4({super.key});

  @override
  State<RegisterScreen4> createState() => _RegisterScreen4State();
}

class _RegisterScreen4State extends State<RegisterScreen4> {
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
              Get.to(() => const RegisterScreen5());
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
              StringConstants.familyAndLifestyle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm4(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm4 extends StatefulWidget {
  const RegisterForm4({super.key});

  @override
  State<RegisterForm4> createState() => _RegisterForm4State();
}

class _RegisterForm4State extends State<RegisterForm4> {
  String fatherName = '';
  String motherName = '';
  String brothers = '';
  String sisters = '';
  String fatherOccupation = '';
  String motherOccupation = '';
  String familyAnnualIncome = '';
  String familyStatus = '';
  String familyType = '';
  final List<String> familyTypeList = [
    'Select',
    "Nuclear Family",
    "Joint Family",
    "Extended Family",
  ];
  String aboutMyFamily = '';

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
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.fatherName,
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
                fatherName = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.motherName,
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
                motherName = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
              hintText: StringConstants.brothers,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.brothers,
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
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                brothers = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
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
              hintText: StringConstants.sisters,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.sisters,
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
            keyboardType: TextInputType.number,
            onChanged: (val) {
              setState(() {
                sisters = val;
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
              counterText: fatherOccupation.isNotEmpty ? null : "",
              hintText: StringConstants.fatherOccupation,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.fatherOccupation,
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
                fatherOccupation = val;
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
              counterText: motherOccupation.isNotEmpty ? null : "",
              hintText: StringConstants.motherOccupation,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.motherOccupation,
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
                motherOccupation = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            decoration: InputDecoration(
              counterText: familyAnnualIncome.isNotEmpty ? null : "",
              hintText: StringConstants.familyAnnualIncome,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.familyAnnualIncome,
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
                familyAnnualIncome = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            decoration: InputDecoration(
              counterText: familyStatus.isNotEmpty ? null : "",
              hintText: StringConstants.familyStatus,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.familyStatus,
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
                familyStatus = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.familyType,
                style: TextStyle(
                  color: ColorConstants.color3,
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
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: aboutMyFamily.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutMyFamily.isNotEmpty ? null : "",
              hintText: StringConstants.aboutMyFamily,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.aboutMyFamily,
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
                aboutMyFamily = val;
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
                Get.to(() => const RegisterForm5());

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
