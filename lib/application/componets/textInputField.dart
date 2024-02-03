import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';

class TextInputField extends StatelessWidget {
  final String title;
  final String hint;
  final TextEditingController? controller;
  final Widget widget;

  const TextInputField(
      {super.key,
      required this.title,
      required this.hint,
      this.controller,
      required this.widget});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: subHeadingStyle,
          ),
          Container(
              margin: const EdgeInsets.only(top: 6),
              padding: const EdgeInsets.only(left: 14),
              height: 50,
              decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(10)),
              child: Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: widget == null ? false : true,
                      autofocus: false,
                      cursorColor: Colors.grey.shade500,
                      controller: controller,
                      style: hintStyle,
                      decoration: InputDecoration(
                          hintText: hint,
                          hintStyle: hintStyle,
                          focusedBorder: const UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1))),
                    ),
                  ),
                  widget == null
                      ? Container()
                      : Container(
                          child: widget,
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
