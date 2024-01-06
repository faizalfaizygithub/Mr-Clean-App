import 'package:clean_app/application/services/AppText.dart';
import 'package:clean_app/application/services/assets.dart';
import 'package:clean_app/application/widgets/Carousel.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:clean_app/data/provider/exclusion_provider.dart';
import 'package:clean_app/data/provider/inclusion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HouseCleanScreen extends StatefulWidget {
  const HouseCleanScreen({super.key});

  @override
  State<HouseCleanScreen> createState() => _HouseCleanScreenState();
}

class _HouseCleanScreenState extends State<HouseCleanScreen> {
  bool _click = true;

  int _addamount = 0;
  int get addamount => _addamount;
  int _amount = 2499;
  int get amount => _amount;

  @override
  Widget build(BuildContext context) {
    final inclutiondatas = Provider.of<InclusionProvider>(context);
    final exclutiondatas = Provider.of<ExclusionProvider>(context);

    Widget container(final String types, final Function() acn) {
      return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey, width: 2),
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        height: 50,
        width: 110,
        child: TextButton(
          onPressed: acn,
          child: AppText(
            txt: types,
            size: 18,
            color: Colors.grey.shade100,
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: AppText(
          txt: 'Full Home Deep Cleaning',
          fw: FontWeight.bold,
          size: 23,
        ),
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.shopping_cart_rounded))
        ],
      ),
      body: ListView(children: [
        gyap(heightgyap: 20),
        CarouselScreen(
          photos: homephotos,
        ),
        gyap(heightgyap: 20),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              container(
                'Classic',
                () {
                  setState(() {
                    _amount = _amount = 2499;
                  });
                },
              ),
              container(
                'Premium',
                () {
                  setState(() {
                    _amount = _amount = 2799;
                  });
                },
              ),
              container(
                'Platinum',
                () {
                  setState(() {
                    _amount = _amount = 2999;
                  });
                },
              )
            ],
          ),
        ),
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
                size: 22,
              ),
              title: AppText(
                txt: '₹ $_amount-/',
                size: 25,
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
                ),
                onPressed: () {
                  setState(() {
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
            TextButton(
              onPressed: () {
                setState(() {
                  _click = !_click;
                  inclutiondatas.iclutionadd();
                });
              },
              child: AppText(
                txt: 'Inclusion',
                size: 20,
                color: Colors.blue,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _click = !_click;
                  exclutiondatas.exclusionadd();
                });
              },
              child: AppText(
                txt: 'Exclusion',
                size: 20,
                color: Colors.blue,
              ),
            ),
          ],
        ),
        _click
            ? Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Divider(
                          thickness: 3,
                          color: 'Inclusion' == 'Inclusion'
                              ? Colors.blue
                              : Colors.white,
                          indent: 10,
                          endIndent: 260,
                        ),
                        AppText(
                          txt: inclutiondatas.inclusions.toString(),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Divider(
                          thickness: 3,
                          color: 'Exclusion' == 'Exclusion'
                              ? Colors.blue
                              : Colors.white,
                          indent: 260,
                          endIndent: 10,
                        ),
                        AppText(
                          txt: exclutiondatas.exclusions.toString(),
                          size: 18,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
        gyap(heightgyap: 50),
      ]),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.only(left: 10, right: 10),
        color: Colors.yellow.shade400,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AppText(
              txt: '₹ $_addamount-/',
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
                setState(() {
                  Navigator.pushNamed(context, 'scheduleScreen',
                      arguments: {'price': _addamount});
                });
              },
              icon: Icon(Icons.arrow_forward_ios),
            )
          ],
        ),
      ),
    );
  }
}
