import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/customTextField.dart';
import 'package:clean_app/domain/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuthService _auth = FirebaseAuthService();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var loading = false.obs;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: const EdgeInsets.only(top: 150.0),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                  'Login',
                  style: LoginStyle,
                ),
                gyap(heightgyap: 20),
                CustomTextField(
                    controller: _emailController,
                    labeltxt: 'Email',
                    icon: Icons.email),
                CustomTextField(
                    controller: _passwordController,
                    labeltxt: 'Password',
                    suffxicon: Icons.remove_red_eye,
                    icon: Icons.lock),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width * 0.5),
                    TextButton(
                        onPressed: () {},
                        child: AppText(
                          txt: 'Forgot Password',
                          size: 10,
                          color: Colors.blue,
                        )),
                  ],
                ),
                gyap(heightgyap: 10),
                _customButton(() {
                  _signIn();
                }, 'Login', Color.fromARGB(255, 192, 176, 31), Colors.white),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppText(
                      txt: "Don't have an account ?",
                      size: 10,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed('signupScreen');
                      },
                      child: AppText(
                        txt: 'Sign Up',
                        color: Colors.blue,
                        size: 11,
                      ),
                    ),
                  ],
                ),
              ]),
            )));
  }

// wrong email message popup
  void wrongEmailOrpasswordMessage() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: AppText(
              txt: 'incorrect email or Password',
              size: 12,
              color: Colors.red,
            ),
          );
        });
  }

  void _signIn() async {
    try {
      loading.value = true;

      String email = _emailController.text;
      String password = _passwordController.text;

      User? user = await _auth.SignInWithEmailAndPassword(email, password);
      loading.value = false;
      if (user != null) {
        print('User sUccesfully signIN');
        Navigator.of(context).pushReplacementNamed('mainPage');
        loading.value = false;
      } else {
        wrongEmailOrpasswordMessage();
        loading.value = false;
      }
    } catch (e) {
      Get.snackbar('incorrect', '$e');
    }
  }

  Widget _customButton(
    final void Function() buttonAction,
    final String buttonText,
    final Color buttonColor,
    final Color txtColor,
  ) {
    return Obx(
      () => ElevatedButton(
        onPressed: buttonAction,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(buttonColor),
          minimumSize: MaterialStateProperty.all(
            const Size(250, 45),
          ),
        ),
        child: loading.value
            ? const CircularProgressIndicator(color: Colors.black)
            : Text(
                buttonText,
                style: TextStyle(fontSize: 14, color: txtColor),
              ),
      ),
    );
  }
}
