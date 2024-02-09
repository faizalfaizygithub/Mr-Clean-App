import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/widgets/main_pages/settings_page.dart';
import 'package:flutter/material.dart';

class AboutMe extends StatelessWidget {
  const AboutMe({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          gyap(heightgyap: 40),
          Text(
            'About Me',
            style: HeadingStyle,
          ),
          Divider(),
          gyap(heightgyap: 30),
          Card(
            child: CustomListTile(
              action: () {},
              text: 'Developer',
              subtxt: 'Muhammed Faizal v',
              icon: Icons.developer_mode,
            ),
          ),
          Card(
            child: CustomListTile(
              action: () {},
              text: 'Phone',
              subtxt: '+91 9847959648',
              icon: Icons.phone_android_outlined,
            ),
          ),
          Card(
            child: CustomListTile(
                action: () {},
                text: 'Email',
                subtxt: 'faizalfaizy648@gmail.com',
                icon: Icons.email),
          )
        ],
      ),
    );
  }
}
