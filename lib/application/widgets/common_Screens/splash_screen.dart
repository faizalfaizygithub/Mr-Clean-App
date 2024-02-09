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
        MaterialPageRoute(builder: (context) => SignUpScreen()),
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.yellow, Color.fromARGB(255, 192, 176, 31)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: CircleAvatar(
          radius: 80,
          backgroundImage: AssetImage(
            'assets/logo/logo.jpg',
          ),
        ),
      ),
    );
  }
}
