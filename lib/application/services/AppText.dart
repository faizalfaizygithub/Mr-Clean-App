import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  String txt;
  dynamic? fw;
  dynamic? fs;
  Color? color;
  double? size;

  AppText({required this.txt, this.fw, this.fs, this.color, this.size});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
          color: color, fontWeight: fw, fontSize: size, fontStyle: fs),
      textDirection: TextDirection.ltr,
      overflow: TextOverflow.visible,
    );
  }
}
