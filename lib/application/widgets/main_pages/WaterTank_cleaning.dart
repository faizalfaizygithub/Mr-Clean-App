import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Carousel.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/assets.dart';
import 'package:flutter/material.dart';

class WaterTankScreen extends StatefulWidget {
  const WaterTankScreen({super.key});

  @override
  State<WaterTankScreen> createState() => _WaterTankScreenState();
}

class _WaterTankScreenState extends State<WaterTankScreen> {
  @override
  String _selectedName = 'Water Tank Cleaning ';

  bool _click = true;
  String _addedType = '';
  String _selectedType = 'home';
  int _addamount = 0;
  int get addamount => _addamount;
  int _amount = 999;
  int get amount => _amount;
  // ignore: non_constant_identifier_names

  @override
  Widget build(BuildContext context) {
    Widget container(
      final types,
      final Function() acn,
    ) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
          color: const Color.fromARGB(255, 6, 3, 19),
        ),
        alignment: Alignment.center,
        height: MediaQuery.of(context).size.height * 0.07,
        width: MediaQuery.of(context).size.width * 0.30,
        child: InkWell(
          onTap: acn,
          child: AppText(
            txt: types,
            size: 14,
            color: const Color.fromARGB(255, 60, 163, 247),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        leadingWidth: 20,
        clipBehavior: Clip.none,
        title: Text(
          'Water Tank Cleaning',
          style: HeadingStyle,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_rounded),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(children: [
          gyap(heightgyap: 20),
          CarouselScreen(
            photos: tankphotos,
          ),
          gyap(heightgyap: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            container('Home', () {
              setState(() {
                _selectedType = _selectedType = 'Home';
                _amount = _amount = 999;
              });
            }),
            container(
              'Office',
              () {
                setState(() {
                  _selectedType = _selectedType = 'Office';
                  _amount = _amount = 1499;
                });
              },
            ),
            container(
              'Others',
              () {
                setState(() {
                  _selectedType = _selectedType = 'Others';
                  _amount = _amount = 1799;
                });
              },
            ),
          ]),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.shade400,
                        offset: const Offset(4, 3),
                        blurRadius: 5,
                        spreadRadius: 2)
                  ]),
              height: 80,
              width: double.infinity,
              child: ListTile(
                leading: Text(
                  'Starts at ',
                  style: subHeadingStyle,
                ),
                title: Text(
                  '₹ $_amount-/',
                  style: subHeadingStyle,
                ),
                trailing: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: Text(
                    'Add',
                    style: hintStyle,
                  ),
                  onPressed: () {
                    setState(() {
                      _addedType = _addedType = _selectedType;
                      _addamount = _addamount = _amount;
                    });
                  },
                ),
              ),
            ),
          ),
          gyap(heightgyap: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Services",
                style: subHeadingStyle,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                tanknotes,
                style: hintStyle,
              ),
            ],
          ),
          gyap(heightgyap: 50),
        ]),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              '₹ $_addamount-/',
              style: subHeadingStyle,
            ),
            AppText(txt: '--$_addedType--', color: Colors.black38, size: 10),
            TextButton.icon(
              label: Text(
                'Continue',
                style: subHeadingStyle,
              ),
              onPressed: () {
                setState(() {
                  Navigator.pushNamed(context, 'scheduleScreen', arguments: {
                    'price': _addamount,
                    'types': _addedType,
                    'name': _selectedName
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
