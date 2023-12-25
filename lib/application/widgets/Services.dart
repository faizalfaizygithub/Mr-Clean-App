import 'package:clean_app/application/services/AppText.dart';
import 'package:flutter/material.dart';

class ServiceCard extends StatelessWidget {
  final String img;
  final String title;
  final void Function() action;
  ServiceCard(
      {super.key,
      required this.img,
      required this.title,
      required this.action});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration:
          BoxDecoration(borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
            color: Colors.grey.shade500,
            offset: const Offset(
              3,
              8,
            ),
            blurRadius: 5),
      ]),
      height: 150,
      width: double.infinity,
      child: Card(
          child: Row(
        children: [
          gyap(widthgyap: 10),
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 50,
          ),
          gyap(widthgyap: 25),
          AppText(
            txt: title,
            size: 20,
          ),
          gyap(widthgyap: 20),
          IconButton(
            onPressed: action,
            icon: const Icon(Icons.arrow_forward_ios),
          ),
        ],
      )),
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
