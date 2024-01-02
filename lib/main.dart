import 'package:clean_app/application/widgets/home.dart';
import 'package:clean_app/application/widgets/houseCleaning.dart';
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
      ],
      child: MaterialApp(
          routes: {
            'homeScreen': (context) => HomePage(),
            'houseScreen': (context) => HouseCleanScreen(),
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
          home: HomePage()),
    );
  }
}
