import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/assets.dart';
import 'package:clean_app/application/widgets/Carousel.dart';
import 'package:clean_app/application/widgets/Services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 20,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.shopping_cart))
        ],
        centerTitle: true,
        title: AppText(
          txt: 'Welcome.. ',
          size: 25,
          fw: FontWeight.bold,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20),
              child: Row(
                children: [
                  AppText(
                    txt: 'Our Services for you..',
                    size: 18,
                    color: Colors.black87,
                    fs: FontStyle.italic,
                  ),
                ],
              ),
            ),
            gyap(heightgyap: 15),
            CarouselScreen(
              photos: servicephotos,
            ),
            gyap(heightgyap: 30),
            ServiceCard(
                img: homelogo,
                title: 'House Cleaning',
                action: () {
                  Navigator.of(context).pushNamed('houseScreen');
                }),
            gyap(heightgyap: 15),
            ServiceCard(
                img: carlogo,
                title: 'Vehicle Cleaning',
                action: () {
                  Navigator.of(context).pushNamed('vehicleScreen');
                }),
            gyap(heightgyap: 15),
            ServiceCard(
                img: gardnlogo,
                title: 'Gardening',
                action: () {
                  Navigator.of(context).pushNamed('houseScreen');
                }),
            gyap(heightgyap: 15),
            ServiceCard(
                img: shoplogo,
                title: 'Building Glass ',
                action: () {
                  Navigator.of(context).pushNamed('houseScreen');
                }),
            gyap(heightgyap: 15),
            ServiceCard(
                img: tanklogo,
                title: 'WaterTank Clean',
                action: () {
                  Navigator.of(context).pushNamed('houseScreen');
                }),
            gyap(heightgyap: 15),
          ],
        ),
      ),
      drawer: const Drawer(),
    );
  }
}
