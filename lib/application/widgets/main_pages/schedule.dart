import 'package:clean_app/application/services/AppText.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:clean_app/application/widgets/timeschedule.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class SchedulePage extends StatefulWidget {
  @override
  State<SchedulePage> createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final CollectionReference review =
      FirebaseFirestore.instance.collection('review');

  // ignore: recursive_getters

  double? forSchedule;
  int tappeddate = -1;
  int _addamount = 0;
  final daysList = [
    'Mon',
    'Tues',
    'Wed',
    'Theus',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Theus',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Theus',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Theus',
    'Fri',
    'Sat',
    'Sun',
    'Mon',
    'Tues',
    'Wed',
    'Theus',
  ];

  final daycount = List.generate(31, (index) => index + 1);

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

    return Scaffold(
      appBar: AppBar(
        title: AppText(
          txt: 'Schedule',
        ),
        automaticallyImplyLeading: false,
        leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
            onPressed: () {}),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0, left: 10, right: 10),
        child: Column(
          children: [
            Container(
              height: 130,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (
                  context,
                  index,
                ) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        tappeddate = index;
                      });
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color:
                              tappeddate == index ? Colors.blue : Colors.blue,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        color: tappeddate == index
                            ? Colors.blue.shade300
                            : Colors.white,
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 1,
                            blurRadius: 3,
                          )
                        ],
                      ),
                      width: 130,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          AppText(
                            txt: 'Jan',
                            size: 19,
                          ),
                          AppText(
                            txt: daycount[index].toString(),
                            size: 19,
                          ),
                          AppText(
                            txt: daysList[index],
                            size: 19,
                          ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: 31, // Set itemCount to the length of daysList
                separatorBuilder: (context, index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
              ),
            ),
            gyap(heightgyap: 30),
            const Expanded(child: TimeSchedule()),
          ],
        ),
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
                txt: 'Continue',
                color: Colors.black,
                size: 20,
              ),
              onPressed: () {
                // Navigate to the 'cartScreen' only if reviewSnap is not null

                setState(() {
                  Navigator.pushNamed(context, 'cartScreen', arguments: {
                    'price': forSchedule,
                  });
                });
              },
              icon: const Icon(Icons.arrow_forward_ios),
            ),
          ],
        ),
      ),
    );
  }
}
