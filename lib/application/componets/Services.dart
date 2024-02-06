import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String img;
  final String title;

  final void Function() inkTap;
  ServiceCard(
      {super.key,
      required this.img,
      required this.title,
      required this.inkTap});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(
              0,
              5,
            ),
            blurRadius: 5),
      ]),
      height: 150,
      width: MediaQuery.of(context).size.width,
      child: InkWell(
        onTap: inkTap,
        child: Card(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            gyap(widthgyap: 5),
            CircleAvatar(
              backgroundImage: AssetImage(img),
              radius: 35,
            ),
            Text(
              title,
              style: subHeadingStyle,
            ),
            gyap(widthgyap: 10),
          ],
        )),
      ),
    );
  }
}

Widget gyap({
  double? widthgyap,
  double? heightgyap,
}) {
  return SizedBox(
    width: widthgyap,
    height: heightgyap,
  );
}
