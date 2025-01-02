import 'package:flutter/material.dart';

import '../../../common/constants/color_constants.dart';
import '../../../common/constants/string_constants.dart';
import '../../widgets/colored_button.dart';

class UpdateMyLifestyleScreen extends StatefulWidget {
  const UpdateMyLifestyleScreen({super.key});

  @override
  State<UpdateMyLifestyleScreen> createState() =>
      _UpdateMyLifestyleScreenState();
}

class _UpdateMyLifestyleScreenState extends State<UpdateMyLifestyleScreen> {
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
              StringConstants.lifeStyle,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w600,
                color: ColorConstants.color1,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40.0),
            const UpdateMyLifestyleForm(),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}

class UpdateMyLifestyleForm extends StatefulWidget {
  const UpdateMyLifestyleForm({super.key});

  @override
  State<UpdateMyLifestyleForm> createState() => _UpdateMyLifestyleFormState();
}

class _UpdateMyLifestyleFormState extends State<UpdateMyLifestyleForm> {
  String smoking = '';
  String drinking = '';
  final List<String> badHabitsList = [
    'Select',
    'Never',
    'Sometimes',
    'Occasionally',
    'Regular',
  ];
  String diet = '';
  final List<String> dietList = [
    'Select',
    'Vegetarian',
    'Non-Vegetarian',
    'Vegan',
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // mobileTEC.dispose();
    super.dispose();
  }

  @override
  void initState() {
    smoking = badHabitsList.first;
    drinking = badHabitsList.first;
    diet = dietList.first;
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
                StringConstants.smoking,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: smoking.isNotEmpty ? smoking : badHabitsList.first,
                  hint: Text(badHabitsList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      smoking = newValue!;
                      if (smoking == badHabitsList.first) {
                        smoking = "";
                      }
                    });
                  },
                  items: badHabitsList.map((String badHabit_) {
                    return DropdownMenuItem<String>(
                      value: badHabit_,
                      child: Text(badHabit_),
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
                StringConstants.drinking,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.6,
                child: DropdownButtonFormField<String>(
                  value: drinking.isNotEmpty ? drinking : badHabitsList.first,
                  hint: Text(badHabitsList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      drinking = newValue!;
                      if (drinking == badHabitsList.first) {
                        drinking = "";
                      }
                    });
                  },
                  items: badHabitsList.map((String badHabit_) {
                    return DropdownMenuItem<String>(
                      value: badHabit_,
                      child: Text(badHabit_),
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
                StringConstants.diet,
                style: TextStyle(
                  color: ColorConstants.color3,
                  fontSize: 17.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.7,
                child: DropdownButtonFormField<String>(
                  // validator: _validateDiet,
                  value: diet.isNotEmpty ? diet : dietList.first,
                  hint: Text(dietList.first),
                  onChanged: (String? newValue) {
                    setState(() {
                      diet = newValue!;
                      if (diet == dietList.first) {
                        diet = "";
                      }
                    });
                  },
                  items: dietList.map((String diet_) {
                    return DropdownMenuItem<String>(
                      value: diet_,
                      child: Text(diet_),
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
