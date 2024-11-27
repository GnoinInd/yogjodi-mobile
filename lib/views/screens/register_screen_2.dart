import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../../common/utils/utility_methods.dart';
import '../widgets/colored_button.dart';
import 'package:get/get.dart';

class RegisterScreen2 extends StatefulWidget {
  const RegisterScreen2({super.key});

  @override
  State<RegisterScreen2> createState() => _RegisterScreen2State();
}

class _RegisterScreen2State extends State<RegisterScreen2> {
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
            onPressed: () {},
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
              StringConstants.profileDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm2(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm2 extends StatefulWidget {
  const RegisterForm2({super.key});

  @override
  State<RegisterForm2> createState() => _RegisterForm2State();
}

class _RegisterForm2State extends State<RegisterForm2> {
  String profileManagedBy = '';
  String dob = '';
  String motherTongue = '';
  String religion = '';
  String caste = '';
  String currentAddress = '';
  String maritalStatus = '';
  final List<String> maritalStatusList = [
    'Single',
    'Married',
    'Divorced',
    'Widower',
    'Widow',
  ];

  final _formKey = GlobalKey<FormState>();

  String? _validateName(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.nameIsRequired;
    }
    return null;
  }

  String? _validateDOB(String? value) {
    if (value == null || value.isEmpty) {
      return StringConstants.dateOfBirthIsRequired;
    } else if (!_isValidDate(value)) {
      return StringConstants.enterAValidDateIn;
    }
    return null;
  }

  bool _isValidDate(String input) {
    try {
      final DateFormat formatter = DateFormat('dd/MM/yyyy');
      final DateTime date = formatter.parseStrict(input);
      return date.isBefore(DateTime.now()) && date.isAfter(DateTime(1900));
    } catch (e) {
      return false;
    }
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

  final TextEditingController dobTEC = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Future<void> selectDOB(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        dobTEC.text = DateFormat("dd/MM/yyyy").format(picked);
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    dobTEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    maritalStatus = maritalStatusList.first;
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
            validator: _validateName,
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
              counterText: profileManagedBy.isNotEmpty ? null : "",
              hintText: StringConstants.profileManagedBy,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.profileManagedBy,
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
                profileManagedBy = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            controller: dobTEC,
            readOnly: false, // Allow manual input
            onTap: () => selectDOB(context), // Open the date picker
            keyboardType: TextInputType.datetime,
            validator: _validateDOB,
            decoration: InputDecoration(
              hintText: "DD/MM/YYYY",
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.dateOfBirth,
              labelStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.calendar_today,
                color: ColorConstants.color3,
              ),
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
            onChanged: (val) {
              setState(() {
                profileManagedBy = val;
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
