import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        children: [
          Text(
            'About Me',
            style: subHeadingStyle,
          ),
          Divider(),
          gyap(heightgyap: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _aboutTileCard('Developer', 'Muhammed faizal v', Icons.person),
              _aboutTileCard('Phone', '+91 9847959648', Icons.phone),
              _aboutTileCard('Email', 'faizalfaizy648@gmail.com', Icons.email)
            ],
          )
        ],
      ),
    );
  }

  _aboutTileCard(text, subtxt, icon) {
    return ListTile(
      title: Text(
        text,
        style: subHeadingStyle,
      ),
      subtitle: Text(
        subtxt,
        style: hintStyle,
      ),
      leading: Icon(icon),
    );
  }
}
