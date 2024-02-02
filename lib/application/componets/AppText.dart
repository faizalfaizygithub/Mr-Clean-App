import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppText extends StatelessWidget {
  String txt;
  dynamic? fw;
  dynamic? fs;
  Color? color;
  double? size;
  String? ffam;

  AppText(
      {super.key,
      required this.txt,
      this.fw,
      this.fs,
      this.color,
      this.size,
      this.ffam});

  @override
  Widget build(BuildContext context) {
    return Text(
      txt,
      style: TextStyle(
        color: color,
        fontWeight: fw,
        fontSize: size,
        fontStyle: fs,
        fontFamily: ffam,
      ),
      textDirection: TextDirection.ltr,
      overflow: TextOverflow.visible,
    );
  }
}

TextStyle get subHeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.bold,
  ));
}

TextStyle get HeadingStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold));
}

TextStyle get hintStyle {
  return GoogleFonts.lato(
      textStyle: const TextStyle(fontSize: 11, color: Colors.black));
}
