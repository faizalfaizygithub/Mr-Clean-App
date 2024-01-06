import 'package:clean_app/application/widgets/main_pages/home.dart';
import 'package:clean_app/application/widgets/main_pages/houseCleaning.dart';
import 'package:clean_app/application/widgets/main_pages/review.dart';
import 'package:clean_app/application/widgets/main_pages/schedule.dart';
import 'package:clean_app/data/provider/add_amount_provider.dart';
import 'package:clean_app/data/provider/exclusion_provider.dart';
import 'package:clean_app/data/provider/inclusion_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => InclusionProvider()),
        ChangeNotifierProvider(create: (context) => ExclusionProvider()),
        ChangeNotifierProvider(create: (context) => CleaningPriceProvider())
      ],
      child: MaterialApp(
          routes: {
            'homeScreen': (context) => HomePage(),
            'houseScreen': (context) => HouseCleanScreen(),
            'scheduleScreen': (context) => SchedulePage(),
            'reviewSceen': (context) => ReviewScreen()
          },
          initialRoute: 'homeScreen',
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade400),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.pink),
            useMaterial3: true,
          ),
          home: SchedulePage()),
    );
  }
}
