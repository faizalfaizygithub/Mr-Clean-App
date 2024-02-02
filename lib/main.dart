import 'package:clean_app/application/widgets/main_pages/HouseCleaning/houseCleaning.dart';
import 'package:clean_app/application/widgets/main_pages/HouseCleaning/order_confirm.dart';
import 'package:clean_app/application/widgets/main_pages/HouseCleaning/review_page.dart';
import 'package:clean_app/application/widgets/main_pages/HouseCleaning/schedule.dart';
import 'package:clean_app/application/widgets/main_pages/Vehicle_Cleaning/vehicle_cleaning.dart';
import 'package:clean_app/application/widgets/main_pages/home.dart';
import 'package:clean_app/data/provider/exclusion_provider.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:clean_app/data/provider/inclusion_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        ChangeNotifierProvider(create: (context) => HouseCleaningProvider())
      ],
      child: MaterialApp(
          routes: {
            'homeScreen': (context) => const HomePage(),
            'houseScreen': (context) => const HouseCleanScreen(),
            'scheduleScreen': (context) => const ScheduleScreen(),
            'cartScreen': (context) => const ReviewScreen(),
            'orderConfirm': (context) => const OrderConfirmation(),
            'vehicleScreen': (context) => const VehicleCleanScreen(),
          },
          initialRoute: 'homeScreen',
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(backgroundColor: Colors.yellow.shade400),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
