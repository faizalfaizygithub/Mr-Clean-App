import 'package:clean_app/application/services/AppText.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class Cart extends StatefulWidget {
  const Cart({super.key});

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  double? forReview;
  void deleteReview(docId) {
    review.doc(docId).delete();
  }

  String? status;
  final CollectionReference review =
      FirebaseFirestore.instance.collection('review');
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
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {}),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: review.snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            }

            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }

            if (!snapshot.hasData ||
                snapshot.data == null ||
                snapshot.data!.docs.isEmpty) {
              return Text('No data available');
            }

            var index = 0;

            final DocumentSnapshot reviewSnap = snapshot.data!.docs[index];
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: ListView(children: [
                Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        txt: reviewSnap['name'],
                        fw: FontWeight.bold,
                        size: 25,
                      ),
                      gyap(heightgyap: 20),
                      Slidable(
                        startActionPane:
                            ActionPane(motion: StretchMotion(), children: [
                          SlidableAction(
                            onPressed: ((context) {
                              Navigator.pushNamed(context, 'houseScreen');
                              deleteReview(reviewSnap.id);
                            }),
                            icon: Icons.edit,
                            backgroundColor: Colors.blue,
                          ),
                          SlidableAction(
                            onPressed: ((context) {
                              Navigator.pushNamed(context, 'homeScreen');
                              deleteReview(reviewSnap.id);
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
                          title: AppText(
                            txt: '1 BHK',
                            size: 22,
                          ),
                          subtitle: AppText(
                            txt: reviewSnap['types'],
                            size: 18,
                            color: Colors.grey,
                          ),
                          trailing: AppText(
                            txt: reviewSnap['price'].toString(),
                            size: 25,
                            fw: FontWeight.w500,
                          ),
                        ),
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
                      AppText(
                        txt: 'Payment Summary',
                        size: 23,
                        color: Colors.black,
                        fw: FontWeight.w500,
                      ),
                      paymentsummary(
                          'Item Total', reviewSnap['price'].toString()),
                      paymentsummary('Convenience Fee', '₹ 50-/'),
                      paymentsummary('Promotion & Discount', '-50/'),
                      const Divider(),
                      paymentsummary(
                          'Net Total', reviewSnap['price'].toString()),
                      const Divider(
                        thickness: 3,
                      ),
                      gyap(heightgyap: 30),
                      AppText(
                        txt: 'Schedule Date and Time:',
                        size: 22,
                        fw: FontWeight.w500,
                      ),
                      gyap(heightgyap: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          scheduleDateTime(
                              () {},
                              const Icon(Icons.date_range_rounded),
                              '10/01/2024'),
                          scheduleDateTime(() {},
                              const Icon(Icons.punch_clock_rounded), '5pm:7pm'),
                        ],
                      ),
                      gyap(heightgyap: 30),
                      AppText(
                        txt: 'Select Payment Method:',
                        size: 22,
                        fw: FontWeight.w500,
                      ),
                      paymentMethod('UPI', 'Pay by any UPI app', () => null),
                      paymentMethod(
                          'Credit/Debit/ATM Card',
                          'Add and secure cards as per RBI guidelines',
                          () => null),
                      paymentMethod(
                          'Net Banking',
                          'This method has low success,use UPI or Cards for better experience',
                          () => null),
                      paymentMethod('COD', 'Cash On Delivery', () => null)
                    ]),
              ]),
            );
          }),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: '₹$forReview-/'.toString(),
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

Widget scheduleDateTime(
  buttonAction,
  buttonIcon,
  buttonText,
) {
  return OutlinedButton.icon(
      style: const ButtonStyle(),
      onPressed: buttonAction,
      icon: buttonIcon,
      label: Text(buttonText));
}
