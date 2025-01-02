import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../../common/utils/utility_methods.dart';
import '../../widgets/colored_button.dart';

class UpdateMyContactScreen extends StatefulWidget {
  const UpdateMyContactScreen({super.key});

  @override
  State<UpdateMyContactScreen> createState() => _UpdateMyContactScreenState();
}

class _UpdateMyContactScreenState extends State<UpdateMyContactScreen> {
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
              StringConstants.contact,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateMyContactForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateMyContactForm extends StatefulWidget {
  const UpdateMyContactForm({super.key});

  @override
  State<UpdateMyContactForm> createState() => _UpdateMyContactFormState();
}

class _UpdateMyContactFormState extends State<UpdateMyContactForm> {
  String mobile = '';
  TextEditingController mobileTEC = TextEditingController();

  String? _validateMobileNumber(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return StringConstants.mobileNumberIsRequired;
    }

    // if (!RegExp(r'^\d{10}$').hasMatch(value)) {
    //   return StringConstants.enterAValid10DigitMobileNumber;
    // }

    return null;
  }

  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    mobileTEC.dispose();
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
            textFieldController: mobileTEC,
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
