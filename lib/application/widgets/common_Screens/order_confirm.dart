import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/my_button.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class OrderConfirmation extends StatefulWidget {
  const OrderConfirmation({super.key});

  @override
  State<OrderConfirmation> createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  double? forConfirm;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    // Check and convert the 'price' value to double
    dynamic priceValue = args['price'];

    if (priceValue is int) {
      forConfirm = priceValue.toDouble();
    } else if (priceValue is double) {
      forConfirm = priceValue;
    } else {
      // Handle other cases or provide a default value
      forConfirm = 0.0;
    }
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Order Confirmation',
          style: HeadingStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Lottie.asset('assets/json/tick.json', height: 200, width: 250),
              Text(
                'Booking Successful',
                style: HeadingStyle,
              ),
              Text('Order ID: 2701', style: hintStyle),
              Card(
                color: Colors.white,
                elevation: 10,
                margin: const EdgeInsets.all(10),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AppText(
                    txt:
                        'Dear customer , Thank you so much for your order . Very soon our professional will contact you. ',
                    size: 10,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Total Amount',
                      style: subHeadingStyle,
                    ),
                    Text(
                      '₹$forConfirm-/'.toString(),
                      style: subHeadingStyle,
                    )
                  ],
                ),
              ),
              gyap(heightgyap: 10),
              const Divider(),
              Column(
                children: [
                  Text(
                    'Schedule Date and Time',
                    style: hintStyle,
                  ),
                  AppText(
                    txt: context.watch<HouseCleaningProvider>().userDate,
                    size: 12,
                    color: Colors.grey,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AppText(
                        txt: context
                            .watch<HouseCleaningProvider>()
                            .userStartTime,
                        size: 12,
                        color: Colors.grey,
                      ),
                      AppText(
                        txt: ':',
                        size: 12,
                        color: Colors.grey,
                      ),
                      AppText(
                        txt: context.watch<HouseCleaningProvider>().userEndTime,
                        size: 12,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                ],
              ),
              gyap(heightgyap: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  MyButton(
                    text: 'Track Booking',
                    action: () {},
                    color: Colors.yellow.shade400,
                  ),
                  MyButton(
                    text: 'Home',
                    action: () {
                      Navigator.pushNamed(context, 'homeScreen');
                    },
                    color: Colors.white,
                  ),
                ],
              ),
              gyap(heightgyap: 50),
              MyButton(
                  text: 'Admin Only',
                  action: () {
                    Navigator.pushNamed(context, 'adminPanel');
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
