import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/assets.dart';
import 'package:clean_app/application/widgets/Carousel.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:clean_app/data/provider/exclusion_provider.dart';
import 'package:clean_app/data/provider/inclusion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class VehicleCleanScreen extends StatefulWidget {
  const VehicleCleanScreen({super.key});

  @override
  State<VehicleCleanScreen> createState() => _VehicleCleanScreenState();
}

class _VehicleCleanScreenState extends State<VehicleCleanScreen> {
  bool _click = true;
  String _addedType = 'null';
  String _selectedType = 'Bikes';
  int _addamount = 0;
  int get addamount => _addamount;
  int _amount = 199;
  int get amount => _amount;
  // ignore: non_constant_identifier_names
  void addname() {
    final name = {
      'name': 'Full Home Deep Cleaning',
    };
  }

  @override
  Widget build(BuildContext context) {
    final inclutiondatas = Provider.of<InclusionProvider>(context);
    final exclutiondatas = Provider.of<ExclusionProvider>(context);

    Widget container(
      final types,
      final Function() acn,
    ) {
      return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.grey, width: 2),
            color: Colors.black87),
        alignment: Alignment.center,
        height: 50,
        width: 110,
        child: InkWell(
          onTap: acn,
          child: AppText(txt: types, size: 14, color: Colors.white),
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
        title: AppText(
          txt: 'Vehicle Cleaning',
          fw: FontWeight.bold,
          size: 17,
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
            photos: vehiclesphotos,
          ),
          gyap(heightgyap: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            container('Bikes', () {
              setState(() {
                _selectedType = _selectedType = 'Bikes';
                _amount = _amount = 199;
              });
            }),
            container(
              'Cars',
              () {
                setState(() {
                  _selectedType = _selectedType = 'Cars';
                  _amount = _amount = 399;
                });
              },
            ),
            container('Others', () {
              setState(() {
                _selectedType = _selectedType = 'Others';
                _amount = _amount = 599;
              });
            }),
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
                leading: AppText(
                  txt: 'Starts at ',
                  color: Colors.blue,
                  size: 14,
                ),
                title: AppText(
                  txt: '₹ $_amount-/',
                  size: 16,
                  color: Colors.black,
                  fw: FontWeight.bold,
                ),
                trailing: TextButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.blue),
                  ),
                  child: AppText(
                    txt: 'ADD',
                    color: Colors.white,
                    size: 10,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "What's Included..?",
                    style: subHeadingStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " > Washing & drying \n > Foam wash \n > Glass cleaning \n > Tyre polish",
                    style: hintStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Excluded",
                    style: subHeadingStyle,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    " > Diesel wash \n > Body wax \n ",
                    style: hintStyle,
                  )
                ],
              ),
            ],
          ),
          gyap(heightgyap: 20),
          Text(
            'Description',
            style: subHeadingStyle,
          ),
          Text(
            'A comprehensive doorstep bike & Car wash with foam wash ,glass cleaning ,tyre polishing & paint polishing',
            style: hintStyle,
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
            AppText(
              txt: '₹ $_addamount-/',
              color: Colors.black,
              fw: FontWeight.bold,
              size: 15,
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
