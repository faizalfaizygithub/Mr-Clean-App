import 'package:clean_app/application/services/AppText.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:flutter/material.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  String? status;
  int _addamount = 0;
  double? forSchedule;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    // Check and convert the 'price' value to double
    dynamic priceValue = args['price'];

    if (priceValue is int) {
      forSchedule = priceValue.toDouble();
    } else if (priceValue is double) {
      forSchedule = priceValue;
    } else {
      // Handle other cases or provide a default value
      forSchedule = 0.0;
    }
    Widget paymentMethod(
      final paymntText,
      final subtxt,
      Function() action,
    ) {
      return RadioListTile(
        activeColor: Colors.blue,
        onChanged: (value) {
          setState(() {
            status = value;
          });
        },
        value: paymntText,
        groupValue: status,
        title: AppText(
          txt: paymntText,
          size: 18,
        ),
        subtitle: AppText(
          txt: subtxt,
          size: 16,
          color: Colors.grey,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          txt: 'Review',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              AppText(
                txt: '',
                fw: FontWeight.bold,
                size: 25,
              ),
              ListTile(
                title: AppText(
                  txt: '1 BHK',
                  size: 22,
                ),
                subtitle: AppText(
                  txt: 'Classic',
                  size: 18,
                  color: Colors.grey,
                ),
                trailing: AppText(
                  txt: ' ₹ 2499-/',
                  size: 25,
                  fw: FontWeight.w500,
                ),
              ),
              Card(
                elevation: 10,
                color: Colors.yellow.shade400,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  alignment: Alignment.center,
                  height: 100,
                  width: double.infinity,
                  child: ListTile(
                    minLeadingWidth: 50,
                    leading: const Icon(
                      Icons.add_shopping_cart_sharp,
                      size: 28,
                      color: Colors.black,
                    ),
                    title: AppText(
                      txt: 'Apply Coupon',
                      size: 20,
                      color: Colors.black,
                    ),
                    trailing: IconButton(
                      icon: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 25,
                        color: Colors.black,
                      ),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
              gyap(heightgyap: 30),
              const Divider(
                thickness: 2,
              ),
            ],
          ),
          AppText(
            txt: 'Payment Summary',
            size: 23,
            color: Colors.black,
            fw: FontWeight.w500,
          ),
          paymentsummary('Item Total', '₹ 2499-/'),
          paymentsummary('Convenience Fee', '₹ 50-/'),
          paymentsummary('Promotion & Discount', '-50/'),
          const Divider(),
          paymentsummary('Net Total', '₹ 2499-/'),
          const Divider(
            thickness: 3,
          ),
          gyap(heightgyap: 30),
          AppText(
            txt: 'Select Payment Method',
            size: 20,
          ),
          paymentMethod('UPI', 'Pay by any UPI app', () => null),
          paymentMethod('Credit/Debit/ATM Card',
              'Add and secure cards as per RBI guidelines', () => null),
          paymentMethod(
              'Net Banking',
              'This method has low success,use UPI or Cards for better experience',
              () => null),
          paymentMethod('COD', 'Cash On Delivery', () => null)
        ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: '₹$forSchedule-/'.toString(),
              color: Colors.black,
              size: 22,
            ),
            TextButton.icon(
              label: AppText(
                txt: 'Confirm Order',
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {},
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}

Widget paymentsummary(
  final name,
  final rupees,
) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        AppText(
          txt: name,
          size: 18,
          color: Colors.black87,
        ),
        AppText(
          txt: rupees,
          size: 18,
          color: Colors.black87,
        ),
      ],
    ),
  );
}
