import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class UpdatePartnerReligionScreen extends StatefulWidget {
  const UpdatePartnerReligionScreen({super.key});

  @override
  State<UpdatePartnerReligionScreen> createState() =>
      _UpdatePartnerReligionScreenState();
}

class _UpdatePartnerReligionScreenState
    extends State<UpdatePartnerReligionScreen> {
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
              "${StringConstants.partner} ${StringConstants.religion}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdatePartnerReligionForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdatePartnerReligionForm extends StatefulWidget {
  const UpdatePartnerReligionForm({super.key});

  @override
  State<UpdatePartnerReligionForm> createState() =>
      _UpdatePartnerReligionFormState();
}

class _UpdatePartnerReligionFormState extends State<UpdatePartnerReligionForm> {
  String religion = '';
  TextEditingController religionTEC = TextEditingController();
  String caste = '';
  TextEditingController casteTEC = TextEditingController();
  String goutraToExclude = '';
  TextEditingController goutraToExcludeTEC = TextEditingController();

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
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: religionTEC,
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
            controller: casteTEC,
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
            controller: goutraToExcludeTEC,
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
            // maxLengthEnforcement: goutraToExclude.isNotEmpty
            //     ? MaxLengthEnforcement.none
            //     : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: goutraToExclude.isNotEmpty ? null : "",
              hintText: StringConstants.goutraToExclude,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.goutraToExclude,
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
                goutraToExclude = val;
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
