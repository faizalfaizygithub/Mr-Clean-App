import 'package:clean_app/application/componets/AppText.dart';
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
      width: MediaQuery.of(context).size.width,
      child: Card(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          gyap(widthgyap: 10),
          CircleAvatar(
            backgroundImage: AssetImage(img),
            radius: 35,
          ),
          gyap(widthgyap: 5),
          AppText(
            txt: title,
            size: 15,
          ),
          gyap(widthgyap: 10),
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
