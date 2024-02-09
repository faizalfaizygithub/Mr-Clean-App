import 'package:clean_app/application/componets/AppText.dart';
import 'package:clean_app/application/widgets/common_Screens/aboutMe.dart';
import 'package:clean_app/application/widgets/common_Screens/admin_pages.dart';
import 'package:clean_app/application/widgets/common_Screens/blank_page.dart';
import 'package:clean_app/application/widgets/common_Screens/login_page.dart';
import 'package:clean_app/application/widgets/common_Screens/mainPage.dart';
import 'package:clean_app/application/widgets/common_Screens/order_confirm.dart';
import 'package:clean_app/application/widgets/common_Screens/review_page.dart';
import 'package:clean_app/application/widgets/common_Screens/schedule.dart';
import 'package:clean_app/application/widgets/common_Screens/sign_up_page.dart';
import 'package:clean_app/application/widgets/common_Screens/splash_screen.dart';
import 'package:clean_app/application/widgets/main_pages/Gardening_Page.dart';
import 'package:clean_app/application/widgets/main_pages/WaterTank_cleaning.dart';
import 'package:clean_app/application/widgets/main_pages/glass_cleaning.dart';
import 'package:clean_app/application/widgets/main_pages/homePage.dart';
import 'package:clean_app/application/widgets/main_pages/houseCleaning.dart';
import 'package:clean_app/application/widgets/main_pages/profile_page.dart';
import 'package:clean_app/application/widgets/main_pages/settings_page.dart';
import 'package:clean_app/application/widgets/main_pages/vehicle_cleaning.dart';
import 'package:clean_app/data/provider/exclusion_provider.dart';
import 'package:clean_app/data/provider/house_cleaning_provider.dart';
import 'package:clean_app/data/provider/inclusion_provider.dart';
import 'package:clean_app/domain/Credit_Card_Payment/credit_card_payment.dart';
import 'package:clean_app/domain/UPI%20Payment/upi_india.dart';
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
            'splashScreen': (context) => const SplashScreen(),
            'loginScreen': (context) => const LoginPage(),
            'signupScreen': (context) => const SignUpScreen(),
            'mainPage': (context) => const MainPage(),
            'homeScreen': (context) => const HomePage(),
            'profilePage': (context) => const ProfilePage(),
            'settingsPage': (context) => const SettingsPage(),
            'houseScreen': (context) => const HouseCleanScreen(),
            'scheduleScreen': (context) => const ScheduleScreen(),
            'cartScreen': (context) => const ReviewScreen(),
            'orderConfirm': (context) => const OrderConfirmation(),
            'vehicleScreen': (context) => const VehicleCleanScreen(),
            'gardenScreen': (context) => const GardeningScreen(),
            'glassScreen': (context) => const GlassCleaningScreen(),
            'tankScreen': (context) => const WaterTankScreen(),
            'adminPanel': (context) => const AdminPage(),
            'upiScreen': (context) => UPIPayment(),
            'creditCardScreen': (context) => CreditCardPayment(),
            'updateSoon': (context) => UpdateSoon(),
            'aboutme': (context) => AboutMe(),
          },
          initialRoute: 'splashScreen',
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
                backgroundColor: Colors.yellow.shade400,
                centerTitle: true,
                titleTextStyle: HeadingStyle),
            scaffoldBackgroundColor: Colors.white,
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
            useMaterial3: true,
          ),
          home: const HomePage()),
    );
  }
}
