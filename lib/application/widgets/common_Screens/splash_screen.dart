import 'dart:async';

import 'package:clean_app/application/widgets/common_Screens/sign_up_page.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreeState();
}

class _SplashScreeState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
      const Duration(seconds: 3),
      () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const SignUpScreen()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
              color: Colors.white,
              height: 200,
              width: 200,
              child: Container(
                child:
                    Image.asset('assets/logo/logo.jpg', fit: BoxFit.fitWidth),
              )),
        ));
  }
}
