import 'package:clean_app/application/services/AppText.dart';
import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(
        'Order Confirmation',
        style: HeadingStyle,
      )),
    );
  }
}
