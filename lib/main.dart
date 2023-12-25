import 'package:clean_app/application/widgets/home.dart';
import 'package:clean_app/application/widgets/houseCleaning.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        routes: {
          'homeScreen': (context) => HomePage(),
          'houseScreen': (context) => HouseCleanScreen(),
        },
        initialRoute: 'homeScreen',
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.grey.shade100,
          ),
          scaffoldBackgroundColor: Colors.yellow.shade400,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
          useMaterial3: true,
        ),
        home: HomePage());
  }
}
