import 'package:clean_app/application/services/assets.dart';
import 'package:clean_app/application/widgets/Carousel.dart';
import 'package:flutter/material.dart';

class HouseCleanScreen extends StatefulWidget {
  const HouseCleanScreen({super.key});

  @override
  State<HouseCleanScreen> createState() => _HouseCleanScreenState();
}

class _HouseCleanScreenState extends State<HouseCleanScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('House Cleaning'),
      ),
      body: Column(
        children: [
          CarouselScreen(
            photos: homephotos,
          )
        ],
      ),
    );
  }
}
