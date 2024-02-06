import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/customTextField.dart';
import 'package:clean_app/application/componets/my_button.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
      child: SingleChildScrollView(
        child: Column(
          children: [
            gyap(heightgyap: 30),
            Text('Edit Profile', style: subHeadingStyle),
            Divider(),
            Stack(
              children: [
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/logo/pro.webp'),
                  radius: 80,
                ),
                Positioned(
                  bottom: 20,
                  left: 100,
                  child: IconButton(
                      onPressed: () {}, icon: const Icon(Icons.add_a_photo)),
                )
              ],
            ),
            AppText(
              txt: 'Set new photo',
              size: 10,
              color: Colors.blue,
            ),
            gyap(heightgyap: 10),
            CustomTextField(
                controller: _nameController,
                hinttxt: 'Name',
                labeltxt: ' name',
                icon: Icons.person),
            CustomTextField(
                controller: _nameController,
                hinttxt: 'Email',
                labeltxt: 'faizy@gmail.com',
                icon: Icons.email),
            CustomTextField(
                controller: _nameController,
                hinttxt: 'Address',
                labeltxt: 'full address',
                icon: Icons.location_pin),
            gyap(heightgyap: 10),
            MyButton(
              text: 'Save Profile',
              color: Colors.yellow.shade400,
              action: () {},
            ),
          ],
        ),
      ),
    );
  }
}
