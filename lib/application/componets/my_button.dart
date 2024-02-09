import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyButton extends StatelessWidget {
  var loading = false.obs;
  String text;
  Function() action;
  Color? color;
  MyButton({super.key, required this.text, required this.action, this.color});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ElevatedButton(
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(color),
              fixedSize: MaterialStateProperty.all(Size(150, 45))),
          onPressed: action,
          child: loading.value
              ? const CircularProgressIndicator(color: Colors.black)
              : Text(
                  text,
                  style: buttonStyle,
                )),
    );
  }
}
