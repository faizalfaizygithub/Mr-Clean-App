import 'package:clean_app/application/widgets/common_Screens/home.dart';
import 'package:clean_app/application/widgets/common_Screens/order_confirm.dart';
import 'package:clean_app/application/widgets/common_Screens/review_page.dart';
import 'package:clean_app/application/widgets/common_Screens/schedule.dart';
import 'package:clean_app/application/widgets/main_pages/Gardening_Page.dart';
import 'package:clean_app/application/widgets/main_pages/WaterTank_cleaning.dart';
import 'package:clean_app/application/widgets/main_pages/glass_cleaning.dart';
import 'package:clean_app/application/widgets/main_pages/houseCleaning.dart';
import 'package:clean_app/application/widgets/main_pages/vehicle_cleaning.dart';
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
            'gardenScreen': (context) => const GardeningScreen(),
            'glassScreen': (context) => const GlassCleaningScreen(),
            'tankScreen': (context) => const WaterTankScreen(),
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
