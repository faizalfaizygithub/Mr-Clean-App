import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/componets/Services.dart';
import 'package:clean_app/application/componets/customTextField.dart';
import 'package:clean_app/domain/firebase_auth_services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  TextEditingController usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  var loading = false.obs;

  @override
  void dispose() {
    usernameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 60.0),
            child: Column(children: [
              Text('Welcome Back', style: LoginStyle),
              gyap(heightgyap: 20),
              Text(
                'Signup your Account to access  \n our service..',
                style: hintStyle,
              ),
              gyap(heightgyap: 20),
              CustomTextField(
                  controller: usernameController,
                  labeltxt: 'username',
                  icon: Icons.person),
              CustomTextField(
                  controller: _emailController,
                  labeltxt: 'email',
                  icon: Icons.email),
              CustomTextField(
                  controller: _passwordController,
                  labeltxt: 'password',
                  suffxicon: Icons.remove_red_eye,
                  icon: Icons.lock),
              _customButton(() {
                _signUp();
              }, 'Create account', Color.fromARGB(255, 192, 176, 31),
                  Colors.white)
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppText(
                txt: "Already have an account ?",
                size: 10,
              ),
              TextButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed('loginScreen');
                  },
                  child: AppText(
                    txt: 'Login',
                    color: Colors.blue,
                    size: 11,
                  ))
            ],
          )
        ]),
      ),
    );
  }

  void _signUp() async {
    loading.value = true;
    String username = usernameController.text;
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.SignUpWithEmailAndPassword(email, password);

    if (user != null) {
      print('User sUccesfully created');
      Navigator.of(context).pushReplacementNamed('mainPage');
      loading.value = false;
    } else {
      print('some error happend');
      loading.value = false;
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
