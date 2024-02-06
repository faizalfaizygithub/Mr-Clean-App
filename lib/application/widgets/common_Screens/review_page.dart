import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/my_button.dart';
import 'package:clean_app/application/componets/textInputField.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';
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
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  double? forReview;
  String? type;
  String? status;
  String? name;

  void addSchedule() {
    final data = {
      'name': name,
      'price': forReview,
      'types': type,
      'date': _selectedDate,
      'starttime': _startTime,
      'endtime': _endTime,
      'username': _nameController.text,
      'userphone': _phoneController.text,
      'address': _addressController.text,
    };
    _items.add(data);
  }

  final CollectionReference _items =
      FirebaseFirestore.instance.collection('review');
  void deleteReview(docId) {
    _items.doc(docId).delete();
  }

  final DateTime _selectedDate = DateTime.now();

  final String _endTime = '10:30 PM';
  final String _startTime =
      DateFormat('hh:mm a').format(DateTime.now()).toString();
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

    String selectedDate = context.watch<HouseCleaningProvider>().userDate;
    String selectedStarttime =
        context.watch<HouseCleaningProvider>().userStartTime;
    String selectedEndTime = context.watch<HouseCleaningProvider>().userEndTime;

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
                  hint: selectedDate,
                  widget: const SizedBox(),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextInputField(
                        title: 'Start Time:',
                        hint: selectedStarttime,
                        widget: const SizedBox(),
                        controller: _startTimeController,
                      ),
                    ),
                    Expanded(
                      child: TextInputField(
                        title: 'End Time:',
                        hint: selectedEndTime,
                        widget: const SizedBox(),
                        controller: _endTimeController,
                      ),
                    ),
                  ],
                ),
                gyap(heightgyap: 30),
                Text(
                  'Details:',
                  style: subHeadingStyle,
                ),
                gyap(heightgyap: 15),
                currentAddress('Name', _nameController),
                gyap(heightgyap: 15),
                currentAddress('Phone', _phoneController),
                gyap(heightgyap: 15),
                currentAddress('Address', _addressController),
                gyap(heightgyap: 20),
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
                paymentMethod('COD', 'Cash On Delivery', () => null),
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
                'Place Order',
                style: subHeadingStyle,
              ),
              onPressed: () {
                showImagePickerOption(context);
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }

  currentAddress(name, controller) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.black,
          ),
          borderRadius: BorderRadius.circular(5)),
      child: TextFormField(
        style: const TextStyle(color: Colors.black),
        controller: controller,
        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 10),
            hintText: name,
            enabled: true),
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

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Colors.grey.shade200,
        context: context,
        builder: (builder) {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4.0,
                child: Column(
                  children: [
                    Text(
                      'Please Confirm Your Booking',
                      style: hintStyle,
                    ),
                    Lottie.asset('assets/json/hand.json',
                        height: 80, width: 80),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        MyButton(
                          text: 'Cancel',
                          action: () {
                            Navigator.pop(context);
                          },
                        ),
                        MyButton(
                          text: 'Confirm Order',
                          color: Colors.yellow.shade400,
                          action: () async {
                            try {
                              if (type!.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content:
                                        Text('Please select your category'),
                                  ),
                                );
                                return;
                              }

                              addSchedule();

                              Navigator.of(context).pushReplacementNamed(
                                  'orderConfirm',
                                  arguments: {'price': forReview});
                            } catch (e) {}
                          },
                        ),
                      ],
                    )
                  ],
                )),
          );
        });
  }
}
