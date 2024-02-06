import 'dart:core';

import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/textInputField.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class ScheduleScreen extends StatefulWidget {
  const ScheduleScreen({super.key});

  @override
  State<ScheduleScreen> createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _startTimeController = TextEditingController();
  final TextEditingController _endTimeController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();

  final CollectionReference _items =
      FirebaseFirestore.instance.collection('review');
  double? forSchedule;
  String? type;
  String? name;
  DateTime _selectedDate = DateTime.now();

  String _endTime = '10:30 PM';
  String _startTime = DateFormat('hh:mm a').format(DateTime.now()).toString();

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
    // Check and convert the 'types' value tostring
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
    _addHeadingSec() {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$name',
            style: subHeadingStyle,
          ),
          gyap(heightgyap: 10),
          Text(
            DateFormat.yMMMMd().format(
              DateTime.now(),
            ),
            style: hintStyle,
          ),
          Text(
            'Today',
            style: subHeadingStyle,
          ),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Schedule',
          style: HeadingStyle,
        ),
        leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios),
            onPressed: () {
              Navigator.pop(context);
            }),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              gyap(heightgyap: 5),
              _addHeadingSec(),
              _addDateSec(),
              TextInputField(
                controller: _dateController,
                title: 'Date:',
                hint: DateFormat.yMd().format(_selectedDate).toString(),
                widget: IconButton(
                  icon: const Icon(
                    Icons.calendar_month,
                    color: Colors.grey,
                  ),
                  onPressed: () {
                    _addDateFromUser();
                  },
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextInputField(
                      title: 'Start Time:',
                      hint: _startTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _addTimeFromUser(isStartTime: true);
                        },
                      ),
                      controller: _startTimeController,
                    ),
                  ),
                  Expanded(
                    child: TextInputField(
                      title: 'End Time:',
                      hint: _endTime,
                      widget: IconButton(
                        icon: const Icon(
                          Icons.access_time,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          _addTimeFromUser(isStartTime: false);
                        },
                      ),
                      controller: _endTimeController,
                    ),
                  ),
                ],
              ),
              gyap(heightgyap: 15),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹$forSchedule-/'.toString(),
              style: subHeadingStyle,
            ),
            AppText(txt: '$type', color: Colors.black38, size: 10),
            TextButton.icon(
              label: Text(
                'Continue',
                style: subHeadingStyle,
              ),
              onPressed: () {
                // Navigate to the 'cartScreen' only if reviewSnap is not null

                //for navigate to reviewscreen date,time datas
                context.read<HouseCleaningProvider>().changeUserSchedule(
                    newUserDate: _selectedDate.toString(),
                    newUserStartTime: _startTime.toString(),
                    newUserEndTime: _endTime.toString());
                FocusManager.instance.primaryFocus?.unfocus();
                _dateController.clear();
                _startTimeController.clear();
                _endTimeController.clear(); //end code

                setState(() {
                  Navigator.pushNamed(context, 'cartScreen', arguments: {
                    'price': forSchedule,
                    'types': type,
                    'name': name
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

  _addDateFromUser() async {
    DateTime? _pickerDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015),
        lastDate: DateTime(2035));
    if (_pickerDate != null) {
      setState(() {
        _selectedDate = _pickerDate;
      });
    } else {
      print('its null or something is wrong');
    }
  }

  _addTimeFromUser({required bool isStartTime}) async {
    var pickedTime = await _showTimePicker();
    String _formatedTime = pickedTime.format(context);
    if (pickedTime == null) {
      print('Time Cancelled');
    } else if (isStartTime == true) {
      setState(() {
        _startTime = _formatedTime;
      });
    } else if (isStartTime == false) {
      setState(() {
        _endTime = _formatedTime;
      });
    }
  }

  _showTimePicker() {
    return showTimePicker(
      initialEntryMode: TimePickerEntryMode.input,
      context: context,
      initialTime: TimeOfDay(
        hour: int.parse(_startTime.split(":")[0]),
        minute: int.parse(_startTime.split(":")[1].split(" ")[0]),
      ),
    );
  }
}

_addDateSec() {
  DateTime _selectedDate = DateTime.now();
  return DatePicker(DateTime.now(),
      height: 110,
      width: 90,
      initialSelectedDate: DateTime.now(),
      selectionColor: Colors.blue,
      selectedTextColor: Colors.white,
      dateTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 16, color: Colors.grey, fontWeight: FontWeight.w600),
      ),
      dayTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
      ),
      monthTextStyle: GoogleFonts.lato(
        textStyle: const TextStyle(
            fontSize: 10, color: Colors.grey, fontWeight: FontWeight.w600),
      ), onDateChange: (date) {
    _selectedDate = date;
  });
}
