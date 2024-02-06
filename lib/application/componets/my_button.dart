import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  String text;
  Function() action;
  Color? color;
  MyButton({super.key, required this.text, required this.action, this.color});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(color),
            fixedSize: MaterialStateProperty.all(Size(150, 45))),
        onPressed: action,
        child: Text(
          text,
          style: hintStyle,
        ));
  }
}
