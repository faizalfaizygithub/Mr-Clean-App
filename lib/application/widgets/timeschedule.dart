import 'package:clean_app/application/services/AppText.dart';
import 'package:flutter/material.dart';

class TimeSchedule extends StatefulWidget {
  const TimeSchedule({super.key});

  @override
  State<TimeSchedule> createState() => _TimeScheduleState();
}

class _TimeScheduleState extends State<TimeSchedule> {
  int tappedtime = -1;
  final timeList = [
    '9am : 11am',
    '11am : 1pm',
    '2pm : 4pm',
    '5pm : 7pm',
  ];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 300,
          crossAxisSpacing: 50,
          mainAxisExtent: 80,
        ),
        itemCount: timeList.length,
        itemBuilder: (BuildContext context, indexx) {
          return GestureDetector(
            onTap: () {
              setState(() {
                tappedtime = indexx;
              });
            },
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(20),
                    color: tappedtime == indexx
                        ? Colors.blue.shade300
                        : Colors.white,
                    boxShadow: const [
                      BoxShadow(
                          color: Colors.grey,
                          offset: Offset(5, 4),
                          blurRadius: 2),
                    ]),
                child: Center(
                  child: AppText(
                    txt: timeList[indexx],
                    size: 20,
                    fw: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
