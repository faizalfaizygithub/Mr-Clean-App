import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/textInputField.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ReviewScreen extends StatefulWidget {
  const ReviewScreen({super.key});

  @override
  State<ReviewScreen> createState() => _ReviewScreenState();
}

class _ReviewScreenState extends State<ReviewScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  double? forReview;
  String? type;
  String? status;
  String? name;
  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<dynamic, dynamic>;

    // Check and convert the 'price' value to double
    dynamic priceValue = args['price'];

    if (priceValue is int) {
      forReview = priceValue.toDouble();
    } else if (priceValue is double) {
      forReview = priceValue;
    } else {
      // Handle other cases or provide a default value
      forReview = 0.0;
    }
    dynamic typesvalue = args['types'];

    if (typesvalue is String) {
      type = typesvalue.toString();
    } else if (typesvalue is String) {
      type = typesvalue;
    } else {
      // Handle other cases or provide a default value
      type = '';
    }
    dynamic namevalue = args['name'];

    if (namevalue is String) {
      name = namevalue.toString();
    } else if (namevalue is String) {
      name = namevalue;
    } else {
      // Handle other cases or provide a default value
      name = '';
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
        title: Text(
          paymntText,
          style: hintStyle,
        ),
        subtitle: AppText(
          txt: subtxt,
          size: 10,
          color: Colors.grey,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Report Summary',
          style: HeadingStyle,
        ),
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: SingleChildScrollView(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '$name',
                  style: HeadingStyle,
                ),
                gyap(heightgyap: 20),
                Slidable(
                  startActionPane:
                      ActionPane(motion: const StretchMotion(), children: [
                    SlidableAction(
                      onPressed: ((context) {
                        Navigator.pushNamed(context, 'houseScreen');
                      }),
                      icon: Icons.edit,
                      backgroundColor: Colors.blue,
                    ),
                    SlidableAction(
                      onPressed: ((context) {
                        Navigator.pushNamed(context, 'homeScreen');
                      }),
                      icon: Icons.delete,
                      backgroundColor: Colors.red,
                    ),
                  ]),
                  child: ListTile(
                      leading: const Icon(
                        Icons.arrow_back_ios_new,
                        color: Colors.grey,
                      ),
                      tileColor: Colors.grey.shade100,
                      title: Text(
                        'Category',
                        style: subHeadingStyle,
                      ),
                      subtitle: Text(
                        '$type',
                        style: hintStyle,
                      ),
                      trailing: Text(
                        '₹$forReview-/'.toString(),
                        style: subHeadingStyle,
                      )),
                ),
                gyap(heightgyap: 30),
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
                        size: 24,
                        color: Colors.black,
                      ),
                      title: Text(
                        'Apply Coupon',
                        style: subHeadingStyle,
                      ),
                      trailing: IconButton(
                        icon: const Icon(
                          Icons.arrow_forward_ios_rounded,
                          size: 20,
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
                Text(
                  'Payment Summary',
                  style: subHeadingStyle,
                ),
                paymentsummary(
                  'Item Total',
                  '₹$forReview-/'.toString(),
                ),
                paymentsummary('Convenience Fee', '₹ 50-/'),
                paymentsummary('Promotion & Discount', '-50/'),
                const Divider(),
                paymentsummary(
                  'Net Total',
                  '₹$forReview-/'.toString(),
                ),
                const Divider(
                  thickness: 3,
                ),
                gyap(heightgyap: 30),
                Text(
                  'Scheduled Date and Time:',
                  style: subHeadingStyle,
                ),
                TextInputField(
                  controller: _dateController,
                  title: 'Date:',
                  hint: context.watch<HouseCleaningProvider>().userDate,
                  widget: const SizedBox(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextInputField(
                        title: 'Start Time:',
                        hint: context
                            .watch<HouseCleaningProvider>()
                            .userStartTime,
                        widget: const SizedBox(),
                        controller: _startTimeController,
                      ),
                    ),
                    Expanded(
                      child: TextInputField(
                        title: 'End Time:',
                        hint:
                            context.watch<HouseCleaningProvider>().userEndTime,
                        widget: const SizedBox(),
                        controller: _endTimeController,
                      ),
                    ),
                  ],
                ),
                gyap(heightgyap: 30),
                Text(
                  'Select Payment Method:',
                  style: subHeadingStyle,
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
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹$forReview-/'.toString(),
              style: subHeadingStyle,
            ),
            TextButton.icon(
              label: Text(
                'Confirm Order',
                style: subHeadingStyle,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, 'orderConfirm', arguments: {
                    'price': forReview,
                  });
                });
              },
              icon: const Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
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
          Text(
            name,
            style: hintStyle,
          ),
          Text(
            rupees,
            style: subHeadingStyle,
          )
        ],
      ),
    );
  }
}
