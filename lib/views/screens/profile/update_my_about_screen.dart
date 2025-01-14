import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class UpdateMyAboutScreen extends StatefulWidget {
  const UpdateMyAboutScreen({super.key});

  @override
  State<UpdateMyAboutScreen> createState() => _UpdateMyAboutScreenState();
}

class _UpdateMyAboutScreenState extends State<UpdateMyAboutScreen> {
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
              StringConstants.about,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateMyAboutForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateMyAboutForm extends StatefulWidget {
  const UpdateMyAboutForm({super.key});

  @override
  State<UpdateMyAboutForm> createState() => _UpdateMyAboutFormState();
}

class _UpdateMyAboutFormState extends State<UpdateMyAboutForm> {
  String hobbies = '';
  TextEditingController hobbiesTEC = TextEditingController();
  String interests = '';
  TextEditingController interestsTEC = TextEditingController();
  String sports = '';
  TextEditingController sportsTEC = TextEditingController();
  String aboutMe = '';
  TextEditingController aboutMeTEC = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    hobbiesTEC.dispose();
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
            controller: hobbiesTEC,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: hobbies.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: hobbies.isNotEmpty ? null : "",
              hintText: StringConstants.hobbies,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.hobbies,
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
                hobbies = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: interestsTEC,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: interests.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: interests.isNotEmpty ? null : "",
              hintText: StringConstants.interests,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.interests,
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
                interests = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: sportsTEC,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: sports.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: sports.isNotEmpty ? null : "",
              hintText: StringConstants.sports,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.sports,
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
                sports = val;
              });
            },
          ),
          const SizedBox(height: 16.0),
          TextFormField(
            controller: aboutMeTEC,
            minLines: 2,
            maxLines: 5,
            style: TextStyle(color: ColorConstants.color3),
            maxLength: 100,
            maxLengthEnforcement: aboutMe.isNotEmpty
                ? MaxLengthEnforcement.none
                : MaxLengthEnforcement.enforced,
            decoration: InputDecoration(
              counterText: aboutMe.isNotEmpty ? null : "",
              hintText: StringConstants.aboutMe,
              hintStyle: TextStyle(color: ColorConstants.color3),
              labelText: StringConstants.aboutMe,
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
                aboutMe = val;
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