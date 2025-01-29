import 'dart:async';

import 'package:flutter/material.dart';
import 'package:yog_jodi/common/constants/string_constants.dart';

import '../../common/constants/color_constants.dart';
import '../widgets/border_button.dart';
import '../widgets/otp_field.dart';

class OTPVerificationScreen extends StatefulWidget {
  const OTPVerificationScreen({super.key});
  @override
  State<OTPVerificationScreen> createState() => _OTPVerificationScreenState();
}

class _OTPVerificationScreenState extends State<OTPVerificationScreen> {
  bool codeSent = false;
  String verificationCode = '';

  bool _isLoading = false;
  bool _isLoadingResend = false;

  bool _isResendingOTP = true;
  int _resendTimer = 60;
  late Timer _timer;

  void _startTimer() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_resendTimer > 0) {
          _resendTimer--;
        } else {
          _isResendingOTP = false;
          _timer.cancel();
        }
      });
    });
  }

  void _reStartTimer() {
    _isResendingOTP = true;
    _resendTimer = 60;
    _startTimer();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
    _startTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.desertStorm,
      appBar: AppBar(
        backgroundColor: ColorConstants.jazzberryJam,
        foregroundColor: ColorConstants.theWhite,
      ),
      body: ListView(
        children: [
          const SizedBox(height: 50),
          Center(
            child: Text(
              StringConstants.verifyYourMobileNo,
              style: TextStyle(
                fontSize: 22,
                color: ColorConstants.theBlack,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0),
            child: Text(
              StringConstants.enterOTP,
              style: TextStyle(
                color: ColorConstants.theBlack,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Center(
            child: OTPTextField(
              length: 4,
              width: MediaQuery.of(context).size.width - 50,
              fieldWidth: 50,
              style: TextStyle(
                fontSize: 18,
                color: ColorConstants.theBlack,
              ),
              onCompleted: (pin) {
                verificationCode = pin;

                if (verificationCode.length == 4) {
                  /// Code here...
                }
              },
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Center(
            child: BorderButton(
              width: 100,
              padding: const EdgeInsets.symmetric(
                vertical: 6.0,
                horizontal: 0.0,
              ),
              bgColor: ColorConstants.theRed,
              borderColor: ColorConstants.theRed,
              onPressed: () {
                if (_isLoading) {
                  return;
                }

                /// Code here...
              },
              child: _isLoading
                  ? SizedBox(
                      height: 24,
                      width: 24,
                      child: CircularProgressIndicator(
                        color: ColorConstants.theWhite,
                        strokeWidth: 2,
                      ),
                    )
                  : Text(
                      StringConstants.submit,
                      style: TextStyle(
                        fontSize: 16,
                        color: ColorConstants.theWhite,
                      ),
                    ),
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          _isResendingOTP
              ? Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 15.0),
                    child: Text(
                      'Resend OTP in $_resendTimer seconds',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14,
                        color: ColorConstants.theBlack,
                      ),
                    ),
                  ),
                )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      StringConstants.didNotGetOTP,
                      style: TextStyle(color: ColorConstants.theBlack),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_isLoadingResend) {
                          return;
                        }
                        _reStartTimer();
                      },
                      child: _isLoadingResend
                          ? SizedBox(
                              height: 22,
                              width: 22,
                              child: CircularProgressIndicator(
                                color: ColorConstants.theBlue,
                                strokeWidth: 2,
                              ),
                            )
                          : Text(
                              StringConstants.resendNow,
                              style: TextStyle(
                                fontSize: 14,
                                color: ColorConstants.theBlue,
                                decoration: TextDecoration.underline,
                                decorationColor: ColorConstants.theBlue,
                              ),
                            ),
                    ),
                  ],
                ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
