import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class UpdatePartnerAboutScreen extends StatefulWidget {
  const UpdatePartnerAboutScreen({super.key});

  @override
  State<UpdatePartnerAboutScreen> createState() =>
      _UpdatePartnerAboutScreenState();
}

class _UpdatePartnerAboutScreenState extends State<UpdatePartnerAboutScreen> {
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
              StringConstants.aboutPartner,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.jazzberryJam,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdatePartnerLifestyleForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdatePartnerLifestyleForm extends StatefulWidget {
  const UpdatePartnerLifestyleForm({super.key});

  @override
  State<UpdatePartnerLifestyleForm> createState() =>
      _UpdatePartnerLifestyleFormState();
}

class _UpdatePartnerLifestyleFormState
    extends State<UpdatePartnerLifestyleForm> {
  String aboutPartner = '';
  TextEditingController aboutPartnerTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
            controller: aboutPartnerTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.tundora),
            maxLength: 100,
            maxLengthEnforcement: aboutPartner.isNotEmpty
                ? MaxLengthEnforcement.enforced
                : MaxLengthEnforcement.none,
            decoration: InputDecoration(
              counterText: aboutPartner.isNotEmpty ? null : "",
              hintText: StringConstants.aboutPartner,
              hintStyle: TextStyle(color: ColorConstants.tundora),
              labelText: StringConstants.aboutPartner,
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
                aboutPartner = val;
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
