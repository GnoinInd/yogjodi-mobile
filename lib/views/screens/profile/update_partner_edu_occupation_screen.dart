import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class UpdatePartnerEduOccupationScreen extends StatefulWidget {
  const UpdatePartnerEduOccupationScreen({super.key});

  @override
  State<UpdatePartnerEduOccupationScreen> createState() =>
      _UpdatePartnerEduOccupationScreenState();
}

class _UpdatePartnerEduOccupationScreenState
    extends State<UpdatePartnerEduOccupationScreen> {
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
              "${StringConstants.partner} ${StringConstants.educationAndOccupation}",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdatePartnerEduOccupationForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdatePartnerEduOccupationForm extends StatefulWidget {
  const UpdatePartnerEduOccupationForm({super.key});

  @override
  State<UpdatePartnerEduOccupationForm> createState() =>
      _UpdatePartnerEduOccupationFormState();
}

class _UpdatePartnerEduOccupationFormState
    extends State<UpdatePartnerEduOccupationForm> {
  String highestDegree = '';
  TextEditingController highestDegreeTEC = TextEditingController();
  String occupation = '';
  TextEditingController occupationTEC = TextEditingController();
  String minAnnualIncome = '';
  String maxAnnualIncome = '';
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
            controller: highestDegreeTEC,
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
            controller: occupationTEC,
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
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: minAnnualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.minAnnualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.minAnnualIncome,
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
          //       minAnnualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.minAnnualIncome,
              style: TextStyle(
                color: ColorConstants.color3,
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
              value: minAnnualIncome.isNotEmpty
                  ? minAnnualIncome
                  : annualIncomeList.first,
              hint: Text(annualIncomeList.first),
              onChanged: (String? newValue) {
                setState(() {
                  minAnnualIncome = newValue!;
                  if (minAnnualIncome == annualIncomeList.first) {
                    minAnnualIncome = "";
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
          // TextFormField(
          //   style: TextStyle(color: ColorConstants.color3),
          //   decoration: InputDecoration(
          //     counterText: maxAnnualIncome.isNotEmpty ? null : "",
          //     hintText: StringConstants.maxAnnualIncome,
          //     hintStyle: TextStyle(color: ColorConstants.color3),
          //     labelText: StringConstants.maxAnnualIncome,
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
          //       maxAnnualIncome = val;
          //     });
          //   },
          // ),
          Align(
            alignment: Alignment.topLeft,
            child: Text(
              StringConstants.maxAnnualIncome,
              style: TextStyle(
                color: ColorConstants.color3,
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
              value: maxAnnualIncome.isNotEmpty
                  ? maxAnnualIncome
                  : annualIncomeList.first,
              hint: Text(annualIncomeList.first),
              onChanged: (String? newValue) {
                setState(() {
                  maxAnnualIncome = newValue!;
                  if (maxAnnualIncome == annualIncomeList.first) {
                    maxAnnualIncome = "";
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
