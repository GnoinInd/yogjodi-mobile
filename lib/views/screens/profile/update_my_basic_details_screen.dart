import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/border_button.dart';
import '../../widgets/colored_button.dart';
import '../../widgets/my_country_state_city_picker.dart';

class UpdateMyBasicDetailsScreen extends StatefulWidget {
  const UpdateMyBasicDetailsScreen({super.key});

  @override
  State<UpdateMyBasicDetailsScreen> createState() =>
      _UpdateMyBasicDetailsScreenState();
}

class _UpdateMyBasicDetailsScreenState
    extends State<UpdateMyBasicDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(StringConstants.update),
        backgroundColor: ColorConstants.color1,
        foregroundColor: ColorConstants.textWhite,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: ListView(
          children: [
            const SizedBox(height: 20.0),
            Text(
              StringConstants.basicDetails,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateMyBasicDetailsForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateMyBasicDetailsForm extends StatefulWidget {
  const UpdateMyBasicDetailsForm({super.key});

  @override
  State<UpdateMyBasicDetailsForm> createState() =>
      _UpdateMyBasicDetailsFormState();
}

class _UpdateMyBasicDetailsFormState extends State<UpdateMyBasicDetailsForm> {
  String firstName = '';
  TextEditingController firstNameTEC = TextEditingController();
  String middleName = '';
  TextEditingController middleNameTEC = TextEditingController();
  String lastName = '';
  TextEditingController lastNameTEC = TextEditingController();
  String gender = '';
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
  String profileManagedBy = '';
  final List<String> profileManagedByList = [
    'Select',
    'Self',
    'Father',
    'Mother',
    'Brother',
    'Sister',
    'Son',
    'Daughter',
    'Relative',
    'Friend',
    'Other',
  ];
  String dob = '';
  TextEditingController dobTEC = TextEditingController();
  String height = '';
  final List<String> heightList = ['Select'];
  String motherTongue = '';
  TextEditingController motherTongueTEC = TextEditingController();
  String maritalStatus = '';
  final List<String> maritalStatusList = [
    'Select',
    'Never Married',
    'Married',
    'Divorced',
    'Widower',
    'Widow',
  ];
  bool? haveChildren;
  String currentAddress = '';
  TextEditingController currentAddressTEC = TextEditingController();
  TextEditingController country = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  String expressYourself = '';
  TextEditingController expressYourselfTEC = TextEditingController();

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

  String? _validateProfilePerson(String? value) {
    if (value == profilePersons.first) {
      return StringConstants.fieldIsRequired;
    }

    return null;
  }

  String? _validateCountry(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.countryIsRequired;
    }
    return null;
  }

  String? _validateState(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.countryIsRequired;
    }
    return null;
  }

  String? _validateCity(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.countryIsRequired;
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

  String? _validateMotherTongue(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.motherTongueIsRequired;
    }
    return null;
  }

  String? _validateMaritalStatus(String? value) {
    if (value == maritalStatusList.first) {
      return StringConstants.maritalStatusIsRequired;
    }

    return null;
  }

  String haveChildrenError = '';
  bool validateHaveChildren() {
    if (haveChildren == null) {
      setState(() {
        haveChildrenError = StringConstants.fieldIsRequired;
      });
      return false;
    } else {
      setState(() {
        haveChildrenError = '';
      });
      return true;
    }
  }

  String? _validateHeight(String? value) {
    if (value == heightList.first) {
      return StringConstants.heightIsRequired;
    }

    return null;
  }

  @override
  void dispose() {
    dobTEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    profilePerson = profilePersons.first;
    profileManagedBy = profileManagedByList.first;
    maritalStatus = maritalStatusList.first;
    height = heightList.first;

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
          TextFormField(
            controller: firstNameTEC,
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
            controller: middleNameTEC,
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
            controller: lastNameTEC,
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
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.profileManagedBy,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.40,
                child: DropdownButtonFormField<String>(
                  value: profileManagedBy.isNotEmpty
                      ? profileManagedBy
                      : profileManagedByList.first,
                  hint: Text(profileManagedByList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      profileManagedBy = newValue!;
                      if (profileManagedBy == profileManagedByList.first) {
                        profileManagedBy = "";
                      }
                    });
                  },
                  items: profileManagedByList.map((String profileManagedBy_) {
                    return DropdownMenuItem<String>(
                      value: profileManagedBy_,
                      child: Text(profileManagedBy_),
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
          const SizedBox(height: 16.0),
          TextFormField(
            controller: motherTongueTEC,
            style: TextStyle(color: ColorConstants.color3),
            // validator: _validateMotherTongue,
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
              counterText: motherTongue.isNotEmpty ? null : "",
              hintText: StringConstants.motherTongue,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.motherTongue,
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
                motherTongue = val;
              });
            },
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
                  validator: _validateMaritalStatus,
                  value: maritalStatus,
                  hint: Text(maritalStatusList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      maritalStatus = newValue!;
                      if (maritalStatus == maritalStatusList[0] ||
                          maritalStatus == maritalStatusList[1]) {
                        haveChildren = null;
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
          if (maritalStatus != maritalStatusList[0] &&
              maritalStatus != maritalStatusList[1]) ...{
            const SizedBox(height: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      StringConstants.haveChildren,
                      style: TextStyle(
                        color: ColorConstants.color3,
                        fontSize: 17.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Row(
                      children: [
                        BorderButton(
                          width: 50,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 0.0,
                          ),
                          bgColor: ColorConstants.textWhite,
                          borderColor: haveChildren == true
                              ? ColorConstants.color1
                              : ColorConstants.color5,
                          onPressed: () async {
                            setState(() {
                              haveChildren = true;
                            });
                          },
                          child: Text(
                            StringConstants.yes,
                            style: TextStyle(
                              fontSize: 12,
                              color: haveChildren == true
                                  ? ColorConstants.color1
                                  : ColorConstants.color3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const SizedBox(width: 10),
                        BorderButton(
                          width: 50,
                          padding: const EdgeInsets.symmetric(
                            vertical: 5.0,
                            horizontal: 0.0,
                          ),
                          bgColor: ColorConstants.textWhite,
                          borderColor: haveChildren == false
                              ? ColorConstants.color1
                              : ColorConstants.color5,
                          onPressed: () async {
                            setState(() {
                              haveChildren = false;
                            });
                          },
                          child: Text(
                            StringConstants.no,
                            style: TextStyle(
                              fontSize: 12,
                              color: haveChildren == false
                                  ? ColorConstants.color1
                                  : ColorConstants.color3,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                if (haveChildrenError.isNotEmpty)
                  Text(
                    haveChildrenError,
                    style: TextStyle(
                      color: ColorConstants.textRed,
                      fontSize: 12.0,
                    ),
                  ),
              ],
            ),
          },
          const SizedBox(height: 16.0),
          TextFormField(
            controller: currentAddressTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: currentAddress.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: currentAddress.isNotEmpty ? null : "",
              hintText: StringConstants.currentAddress,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.currentAddress,
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
                currentAddress = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          CountryStateCityPicker(
            country: country,
            countryValidator: _validateCountry,
            countryInputDecoration: InputDecoration(
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
            state: state,
            stateValidator: _validateState,
            stateInputDecoration: InputDecoration(
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
            city: city,
            cityValidator: _validateCity,
            cityInputDecoration: InputDecoration(
              hintText: StringConstants.city,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.city,
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
            inputTextStyle: TextStyle(color: ColorConstants.color3),
            dialogBGColor: ColorConstants.color4,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                StringConstants.height,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.65,
                child: DropdownButtonFormField<String>(
                  menuMaxHeight: 200,
                  validator: _validateHeight,
                  value: height,
                  hint: Text(heightList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      height = newValue!;
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
            controller: expressYourselfTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: expressYourself.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: expressYourself.isNotEmpty ? null : "",
              hintText: StringConstants.expressYourself,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.expressYourself,
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
                expressYourself = val;
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
                if (!validateGender()) {
                  return;
                }
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
