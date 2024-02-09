import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class UpdateSoon extends StatelessWidget {
  const UpdateSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset(
              'assets/json/update.json',
            ),
            Text('Update Soon', style: HeadingStyle)
          ],
        ),
      ),
    );
  }
}
