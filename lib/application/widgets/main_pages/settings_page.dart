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
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 30, left: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Settings',
            style: LoginStyle,
          ),
          gyap(heightgyap: 30),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'profilePage');
            },
            text: 'Profile settings',
            subtxt: 'contact information and details',
            icon: Icons.person,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'updateSoon');
            },
            text: 'Account settings',
            subtxt: 'account informations',
            icon: Icons.settings,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'updateSoon');
            },
            text: 'Cookies',
            subtxt: 'cookies and policy',
            icon: Icons.cookie,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'updateSoon');
            },
            text: 'Privacy',
            subtxt: 'Privacy settings',
            icon: Icons.lock,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'updateSoon');
            },
            text: 'Help Center',
            subtxt: 'Help center',
            icon: Icons.help_center,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'aboutme');
            },
            text: 'About us',
            subtxt: 'about us informations',
            icon: Icons.group,
          ),
          CustomListTile(
            action: () {
              Navigator.pushNamed(context, 'updateSoon');
            },
            text: 'Terms',
            subtxt: 'terms and conditions of Mr clean application ;',
            icon: Icons.rule_rounded,
          ),
          CustomListTile(
            action: () {
              signOutPopup();
            },
            text: 'Sign Out',
            subtxt: 'exit to app',
            icon: Icons.exit_to_app,
          ),
          gyap(heightgyap: 20),
        ],
      ),
    );
  }

  void signOutPopup() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              'Sign out',
              style: HeadingStyle,
            ),
            content: Text(
              'Are you sure want to Sign Out?',
              style: hintStyle,
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('NO')),
              TextButton(
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, 'loginScreen');
                  },
                  child: Text('YES')),
            ],
          );
        });
  }
}

class CustomListTile extends StatelessWidget {
  Function() action;
  String text;
  String? subtxt;
  IconData? icon;

  CustomListTile(
      {super.key,
      required this.action,
      required this.text,
      this.subtxt,
      this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: action,
        title: Text(
          text,
          style: subHeadingStyle,
        ),
        subtitle: Text(
          subtxt!,
          style: buttonStyle,
        ),
        leading: Icon(icon),
        trailing: const Icon(Icons.arrow_forward_ios));
  }
}
