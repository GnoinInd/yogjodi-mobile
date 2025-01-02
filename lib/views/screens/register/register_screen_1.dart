import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:yog_jodi/views/screens/register/register_screen_2.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/border_button.dart';
import '../../widgets/colored_button.dart';

class RegisterScreen1 extends StatefulWidget {
  const RegisterScreen1({super.key});

  @override
  State<RegisterScreen1> createState() => _RegisterScreen1State();
}

class _RegisterScreen1State extends State<RegisterScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.color4,
      appBar: AppBar(
        title: const Text(StringConstants.register),
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Text(
              StringConstants.accountDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const RegisterForm1(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class RegisterForm1 extends StatefulWidget {
  const RegisterForm1({super.key});

  @override
  State<RegisterForm1> createState() => _RegisterForm1State();
}

class _RegisterForm1State extends State<RegisterForm1> {
  String firstName = '';
  String middleName = '';
  String lastName = '';
  String gender = '';
  String mobile = '';
  // String contactPrivacySetting = '';
  String profilePerson = '';
  final List<String> profilePersons = [
    'Select',
    'Self',
    'Son',
    'Daughter',
    'Brother',
    'Sister',
    'Relative',
    'Friend',
    'Other',
  ];
  String email = '';
  String password = '';
  String confirmPassword = '';

  bool _showPassword = false;
  bool _showConfirmPassword = false;

  final _formKey = GlobalKey<FormState>();

  String? _validateFirstName(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.firstNameIsRequired;
    }
    return null;
  }

  String? _validateLastName(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.lastNameIsRequired;
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

  String? _validateMobileNumber(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.mobileNumberIsRequired;
    }

    // if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    //   return StringConstants.enterAValid10DigitMobileNumber;
    // }

    return null;
  }

  String genderError = '';
  bool validateGender() {
    if (gender.isEmpty) {
      setState(() {
        genderError = StringConstants.genderError;
      });
      return false;
    } else {
      setState(() {
        genderError = '';
      });
      return true;
    }
  }

  // String contactPrivacySettingError = '';
  // bool validateContactPrivacySetting() {
  //   if (contactPrivacySetting.isEmpty) {
  //     setState(() {
  //       contactPrivacySettingError = StringConstants.contactPrivacySettingError;
  //     });
  //     return false;
  //   } else {
  //     setState(() {
  //       contactPrivacySettingError = '';
  //     });
  //     return true;
  //   }
  // }

  String? _validateProfilePerson(String? value) {
    if (value == profilePersons.first) {
      return StringConstants.fieldIsRequired;
    }

    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.emailIsRequired;
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return StringConstants.enterAValidEmailAddress;
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.passwordIsRequired;
    }
    if (value.length < 8) {
      return StringConstants.passwordMustHaveAtLeast8Characters;
    }
    // Password must contain at least 8 characters, one uppercase letter, one lowercase letter, and one number
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
    );
    if (!passwordRegExp.hasMatch(value)) {
      return StringConstants.thePasswordMustContainAtLeast;
    }
    return null;
  }

  bool isPasswordValid(String password) {
    // Password must contain at least 8 characters, one uppercase letter, one lowercase letter, and one number
    final RegExp passwordRegExp = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d).{8,}$',
    );

    return passwordRegExp.hasMatch(password);
  }

  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  @override
  void initState() {
    profilePerson = profilePersons.first;
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
            validator: _validateFirstName,
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
            maxLength: 30,
            maxLengthEnforcement: firstName.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: firstName.isNotEmpty ? null : "",
              hintText: StringConstants.firstName,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.person_outline,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                firstName = val;
              });
            },
          ),
          const SizedBox(height: 16),
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
            maxLength: 30,
            maxLengthEnforcement: middleName.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: middleName.isNotEmpty ? null : "",
              hintText: StringConstants.middleName,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.person_outline,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                middleName = val;
              });
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            validator: _validateLastName,
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
            maxLength: 30,
            maxLengthEnforcement: lastName.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: lastName.isNotEmpty ? null : "",
              hintText: StringConstants.lastName,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.person_outline,
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
            keyboardType: TextInputType.name,
            onChanged: (val) {
              setState(() {
                lastName = val;
              });
            },
          ),
          const SizedBox(height: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    StringConstants.gender,
                    style: TextStyle(
                      color: ColorConstants.color3,
                      fontSize: 17.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BorderButton(
                    width: 70,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    bgColor: ColorConstants.textWhite,
                    borderColor: gender == StringConstants.male
                        ? ColorConstants.color1
                        : ColorConstants.color5,
                    onPressed: () async {
                      setState(() {
                        gender = StringConstants.male;
                      });
                    },
                    child: Text(
                      StringConstants.male,
                      style: TextStyle(
                        fontSize: 12,
                        color: gender == StringConstants.male
                            ? ColorConstants.color1
                            : ColorConstants.color3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(width: 10),
                  BorderButton(
                    width: 70,
                    padding: const EdgeInsets.symmetric(
                      vertical: 5.0,
                      horizontal: 0.0,
                    ),
                    bgColor: ColorConstants.textWhite,
                    borderColor: gender == StringConstants.female
                        ? ColorConstants.color1
                        : ColorConstants.color5,
                    onPressed: () async {
                      setState(() {
                        gender = StringConstants.female;
                      });
                    },
                    child: Text(
                      StringConstants.female,
                      style: TextStyle(
                        fontSize: 12,
                        color: gender == StringConstants.female
                            ? ColorConstants.color1
                            : ColorConstants.color3,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 5),
              if (genderError.isNotEmpty)
                Text(
                  genderError,
                  style: TextStyle(
                    color: ColorConstants.textRed,
                    fontSize: 12.0,
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          // TextFormField(
          //   style: TextStyle(
          //     color: ColorConstants.color3,
          //     fontSize: 17.0,
          //   ),
          //   validator: _validateMobileNumber,
          //   inputFormatters: [
          //     FilteringTextInputFormatter.allow(
          //       RegExp(r'[0-9+]'), // Add characters to allow
          //     ),
          //   ],
          //   decoration: InputDecoration(
          //     hintText: StringConstants.mobileNumber,
          //     prefixIcon: SizedBox(
          //       width: 95.0,
          //       child: Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceAround,
          //         children: [
          //           Padding(
          //             padding: const EdgeInsets.only(left: 10.0),
          //             child: Icon(
          //               Icons.phone_in_talk_outlined,
          //               color: ColorConstants.color3,
          //             ),
          //           ),
          //           const Padding(
          //             padding: EdgeInsets.only(left: 10.0, bottom: 3.0),
          //             child: Text(
          //               "+91 - ",
          //               style: TextStyle(
          //                 fontSize: 17.0,
          //                 fontWeight: FontWeight.w600,
          //               ),
          //             ),
          //           )
          //         ],
          //       ),
          //     ),
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
          //   keyboardType: TextInputType.phone,
          //   onChanged: (val) {
          //     mobile = val;
          //   },
          // ),
          // const SizedBox(height: 16),
          InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              mobile = number.phoneNumber!;
            },
            validator: _validateMobileNumber,
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(color: Colors.black),
            initialValue: number,
            // textFieldController: mobileTEC,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
              signed: true,
              decimal: true,
            ),
            inputDecoration: InputDecoration(
              hintText: StringConstants.mobileNumber,
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
          const SizedBox(height: 16),
          // Align(
          //   alignment: Alignment.centerLeft,
          //   child: Column(
          //     crossAxisAlignment: CrossAxisAlignment.start,
          //     children: [
          //       Text(
          //         StringConstants.contactPrivacySetting,
          //         style: TextStyle(
          //           color: ColorConstants.color3,
          //           fontSize: 17.0,
          //           fontWeight: FontWeight.w600,
          //         ),
          //       ),
          //       const SizedBox(height: 10),
          //       Wrap(
          //         spacing: 10.0,
          //         runSpacing: 10.0,
          //         children: [
          //           BorderButton(
          //             width: 90,
          //             padding: const EdgeInsets.symmetric(
          //               vertical: 5.0,
          //               horizontal: 0.0,
          //             ),
          //             bgColor: ColorConstants.textWhite,
          //             color: contactPrivacySetting == StringConstants.showToAll
          //                 ? ColorConstants.color1
          //                 : ColorConstants.color5,
          //             onPressed: () async {
          //               setState(() {
          //                 contactPrivacySetting = StringConstants.showToAll;
          //               });
          //             },
          //             child: Text(
          //               StringConstants.showToAll,
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color:
          //                     contactPrivacySetting == StringConstants.showToAll
          //                         ? ColorConstants.color1
          //                         : ColorConstants.color3,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           BorderButton(
          //             width: 100,
          //             padding: const EdgeInsets.symmetric(
          //               vertical: 5.0,
          //               horizontal: 0.0,
          //             ),
          //             bgColor: ColorConstants.textWhite,
          //             color:
          //                 contactPrivacySetting == StringConstants.hideFromAll
          //                     ? ColorConstants.color1
          //                     : ColorConstants.color5,
          //             onPressed: () async {
          //               setState(() {
          //                 contactPrivacySetting = StringConstants.hideFromAll;
          //               });
          //             },
          //             child: Text(
          //               StringConstants.hideFromAll,
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: contactPrivacySetting ==
          //                         StringConstants.hideFromAll
          //                     ? ColorConstants.color1
          //                     : ColorConstants.color3,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //           BorderButton(
          //             width: 240,
          //             padding: const EdgeInsets.symmetric(
          //               vertical: 5.0,
          //               horizontal: 0.0,
          //             ),
          //             bgColor: ColorConstants.textWhite,
          //             color: contactPrivacySetting ==
          //                     StringConstants.showToMyInterests
          //                 ? ColorConstants.color1
          //                 : ColorConstants.color5,
          //             onPressed: () async {
          //               setState(() {
          //                 contactPrivacySetting =
          //                     StringConstants.showToMyInterests;
          //               });
          //             },
          //             child: Text(
          //               StringConstants.showToMyInterests,
          //               style: TextStyle(
          //                 fontSize: 12,
          //                 color: contactPrivacySetting ==
          //                         StringConstants.showToMyInterests
          //                     ? ColorConstants.color1
          //                     : ColorConstants.color3,
          //               ),
          //               textAlign: TextAlign.center,
          //             ),
          //           ),
          //         ],
          //       ),
          //       const SizedBox(height: 5),
          //       if (contactPrivacySettingError.isNotEmpty)
          //         Text(
          //           contactPrivacySettingError,
          //           style: TextStyle(
          //             color: ColorConstants.textRed,
          //             fontSize: 12.0,
          //           ),
          //         ),
          //     ],
          //   ),
          // ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.creatingProfileFor,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: DropdownButtonFormField<String>(
                  validator: _validateProfilePerson,
                  value: profilePerson,
                  hint: Text(profilePersons.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      profilePerson = newValue!;
                    });
                  },
                  items: profilePersons.map((String profilePerson_) {
                    return DropdownMenuItem<String>(
                      value: profilePerson_,
                      child: Text(profilePerson_),
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
            style: TextStyle(color: ColorConstants.color3),
            validator: _validateEmail,
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(r'[a-zA-Z0-9@._-]'), // Allow valid email characters
              ),
            ],
            decoration: InputDecoration(
              hintText: StringConstants.email,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.mail_outlined,
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
            keyboardType: TextInputType.emailAddress,
            onChanged: (val) {
              email = val;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            obscureText: !_showPassword,
            validator: _validatePassword,
            decoration: InputDecoration(
              hintText: StringConstants.password,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: ColorConstants.color3,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _showPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: ColorConstants.color3,
                ),
                onPressed: () {
                  setState(() {
                    _showPassword = !_showPassword;
                  });
                },
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
              password = val;
            },
          ),
          const SizedBox(height: 16),
          TextFormField(
            style: TextStyle(color: ColorConstants.color3),
            obscureText: !_showConfirmPassword,
            validator: (value) {
              if (value != password) {
                return StringConstants.passwordsDoNotMatch;
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: StringConstants.confirmPassword,
              hintStyle: TextStyle(color: ColorConstants.color3),
              prefixIcon: Icon(
                Icons.lock_outline_rounded,
                color: ColorConstants.color3,
              ),
              suffixIcon: IconButton(
                icon: Icon(
                  _showConfirmPassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                  color: ColorConstants.color3,
                ),
                onPressed: () {
                  setState(() {
                    _showConfirmPassword = !_showConfirmPassword;
                  });
                },
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
              confirmPassword = val;
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
                // Get.to(() => const OTPVerificationScreen());
                Get.to(() => const RegisterScreen2());

                // if (!validateGender() || !validateContactPrivacySetting()) {
                //   return;
                // }

                if (!validateGender()) {
                  return;
                }
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
