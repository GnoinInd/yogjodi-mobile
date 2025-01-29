import 'package:flutter/material.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';
import '../../widgets/my_countries_states_picker.dart';

class UpdatePartnerBasicDetailsScreen extends StatefulWidget {
  const UpdatePartnerBasicDetailsScreen({super.key});

  @override
  State<UpdatePartnerBasicDetailsScreen> createState() =>
      _UpdatePartnerBasicDetailsScreenState();
}

class _UpdatePartnerBasicDetailsScreenState
    extends State<UpdatePartnerBasicDetailsScreen> {
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
              "${StringConstants.partner} ${StringConstants.basicDetails}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.jazzberryJam,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdatePartnerBasicDetailsForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdatePartnerBasicDetailsForm extends StatefulWidget {
  const UpdatePartnerBasicDetailsForm({super.key});

  @override
  State<UpdatePartnerBasicDetailsForm> createState() =>
      _UpdatePartnerBasicDetailsFormState();
}

class _UpdatePartnerBasicDetailsFormState
    extends State<UpdatePartnerBasicDetailsForm> {
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    minAge = ageList.first;
    maxAge = ageList.first;
    minHeight = heightList.first;
    maxHeight = heightList.first;
    maritalStatus = maritalStatusList.first;

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
