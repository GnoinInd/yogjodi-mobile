import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/common/constants/color_constants.dart';
import '../../common/constants/string_constants.dart';
import '../../common/utils/utility_methods.dart';
import '../widgets/border_button.dart';
import '../widgets/colored_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  void initState() {
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [
        SystemUiOverlay.top,
        SystemUiOverlay.bottom,
      ],
    );

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: ColorConstants.color1,
        statusBarIconBrightness: Brightness.light,
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false, //It should be false to work
      onPopInvokedWithResult: (didPop, _) async {
        if (didPop) {
          return;
        }
        await _onBackPressed();
      },
      child: Scaffold(
        backgroundColor: ColorConstants.color4,
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  StringConstants.appName,
                  style: TextStyle(
                    fontFamily: "Ikaros",
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    color: ColorConstants.color1,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 80.0),
                const LoginForm(),
                const SizedBox(height: 55.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.doNotHaveAnAccount,
                      style: TextStyle(
                        color: ColorConstants.color3,
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(width: 10),
                    BorderButton(
                      width: 80,
                      padding: const EdgeInsets.symmetric(
                        vertical: 5.0,
                        horizontal: 0.0,
                      ),
                      bgColor: ColorConstants.color1,
                      color: ColorConstants.color1,
                      onPressed: () async {
                        // Get.to(() => const SignUpScreen());
                      },
                      child: const Text(
                        StringConstants.register,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _onBackPressed() async {
    await showAdaptiveDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text(
            StringConstants.confirm,
            style: TextStyle(
              color: Colors.red,
            ),
          ),
          content: const Text(StringConstants.doYouWantToExitTheApp),
          actions: <Widget>[
            TextButton(
              child: const Text(
                StringConstants.no,
                style: TextStyle(color: Colors.blue),
              ),
              onPressed: () {
                Navigator.of(context).pop(); //Will not exit the App
              },
            ),
            TextButton(
              child: const Text(
                StringConstants.yes,
                style: TextStyle(color: Colors.red),
              ),
              onPressed: () {
                SystemNavigator.pop();
                Navigator.of(context).pop(); //Will exit the App
              },
            )
          ],
        );
      },
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  String email = '';
  String password = '';

  bool _showPassword = false;

  final _formKey = GlobalKey<FormState>();

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return 'Email is required';
    }
    if (!RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$')
        .hasMatch(value)) {
      return 'Enter a valid email address';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty || UtilityMethods.isBlank(value)) {
      return 'Password is required';
    }
    if (value.length < 6) {
      return 'Password must have at least 8 characters';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            style: TextStyle(
              color: ColorConstants.color3,
            ),
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
              // filled: true, // Enables the background fill
              // fillColor: ColorConstants.color5, // Sets the background color
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5), // Rounded corners
                borderSide: BorderSide(
                  color: ColorConstants.color5, // Border color
                  width: 1, // Border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5), // Same corners
                borderSide: const BorderSide(
                  color: Colors.white, // Color when focused
                  width: 2, // Border width
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
            // validator: _validatePassword,
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
              // filled: true, // Enables the background fill
              // fillColor: ColorConstants.color5, // Sets the background color
              contentPadding: const EdgeInsets.all(15.0),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5), // Rounded corners
                borderSide: BorderSide(
                  color: ColorConstants.color5, // Border color
                  width: 1, // Border width
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5), // Same corners
                borderSide: const BorderSide(
                  color: Colors.white, // Color when focused
                  width: 1, // Border width
                ),
              ),
            ),
            onChanged: (val) {
              password = val;
            },
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  // Get.to(() => const ForgotPasswordScreen());
                },
                child: Text(
                  StringConstants.forgotPassword,
                  style: TextStyle(
                    color: ColorConstants.color1,
                    fontSize: 16.0,
                    fontWeight: FontWeight.w400,
                    decoration: TextDecoration.underline,
                    decorationColor: ColorConstants.color1,
                  ),
                ),
              ),
              const SizedBox(width: 8.0),
            ],
          ),
          const SizedBox(height: 50.0),
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
                StringConstants.login,
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
