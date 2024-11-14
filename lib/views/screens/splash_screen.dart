import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:yog_jodi/views/screens/about_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    await Future.delayed(const Duration(seconds: 1));
    Get.to(() => const AboutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: FlutterLogo(size: 150.0),
      ),
    );
  }
}
