import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Carousel.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/assets.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.only(top: 20, left: 10, right: 10),
      children: [
        Container(
          alignment: Alignment.center,
          height: 70,
          width: double.infinity,
          decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.shade500,
                    offset: const Offset(0, 5),
                    blurRadius: 3)
              ],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
              color: Colors.yellow.shade400),
          child: Text(
            'Welcome to Mr Clean',
            style: HeadingStyle,
          ),
        ),
        gyap(heightgyap: 30),
        Text(
          'Our Services for you..',
          style: subHeadingStyle,
        ),
        gyap(heightgyap: 15),
        CarouselScreen(
          photos: servicephotos,
        ),
        gyap(heightgyap: 30),
        ServiceCard(
          inkTap: () {
            Navigator.of(context).pushNamed('houseScreen');
          },
          img: homelogo,
          title: 'House Cleaning',
        ),
        gyap(heightgyap: 15),
        ServiceCard(
          inkTap: () {
            Navigator.of(context).pushNamed('vehicleScreen');
          },
          img: carlogo,
          title: 'Vehicle Cleaning',
        ),
        gyap(heightgyap: 15),
        ServiceCard(
          inkTap: () {
            Navigator.of(context).pushNamed('gardenScreen');
          },
          img: gardnlogo,
          title: 'Gardening',
        ),
        gyap(heightgyap: 15),
        ServiceCard(
          inkTap: () {
            Navigator.of(context).pushNamed('glassScreen');
          },
          img: shoplogo,
          title: 'Building Glass ',
        ),
        gyap(heightgyap: 15),
        ServiceCard(
          inkTap: () {
            Navigator.of(context).pushNamed('tankScreen');
          },
          img: tanklogo,
          title: 'WaterTank Clean',
        ),
        gyap(heightgyap: 15),
      ],
    );
  }
}
