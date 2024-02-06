import 'package:clean_app/application/componets/AppText.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  const DrawerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      ListOfDrawer(
        icon: Icons.home,
        txtname: 'Home',
        txtAction: () {
          Navigator.of(context).pop();
        },
      ),
      ListOfDrawer(
        icon: Icons.person_2,
        txtname: 'Profile',
        txtAction: () {
          Navigator.of(context).pushNamed('profilePage');
        },
      ),
      ListOfDrawer(
        icon: Icons.miscellaneous_services_rounded,
        txtname: 'Services',
        txtAction: () {
          Navigator.of(context).pop();
        },
      ),
      ListOfDrawer(
        icon: Icons.work,
        txtname: 'Settings',
        txtAction: () {
          Navigator.of(context).pushNamed('settingsPage');
        },
      ),
      ListOfDrawer(
        icon: Icons.contact_support,
        txtname: 'About Us',
        txtAction: () {
          Navigator.of(context).pushNamed('aboutPage');
        },
      ),
    ]);
  }
}

class ListOfDrawer extends StatelessWidget {
  String txtname;
  void Function() txtAction;
  IconData icon;
  ListOfDrawer(
      {super.key,
      required this.txtname,
      required this.icon,
      required this.txtAction});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextButton.icon(
        autofocus: true,
        icon: Icon(
          icon,
          color: Colors.blueGrey,
        ),
        onPressed: txtAction,
        label: Text(txtname, style: subHeadingStyle),
      ),
    );
  }
}
