import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  String labeltxt;

  IconData icon;
  TextEditingController controller;
  IconData? suffxicon;

  CustomTextField(
      {super.key,
      required this.controller,
      required this.labeltxt,
      this.suffxicon,
      required this.icon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            style: TextStyle(fontSize: 12),
            cursorColor: Colors.black54,
            controller: controller,
            keyboardType: TextInputType.text,
            enabled: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.grey.shade200,
              prefixIcon: Icon(
                icon,
                color: Colors.blueGrey,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.grey.shade200,
                  width: 2,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: Colors.blue,
                  width: 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              labelText: labeltxt,
              labelStyle: const TextStyle(
                color: Colors.blueGrey,
                fontSize: 10,
              ),
              suffixIcon: Icon(
                suffxicon,
                size: 20,
                color: Colors.black54,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
