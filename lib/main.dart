import 'package:english_quiz/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'package:flutter/services.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await MobileAds.instance.initialize();

  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'English Quiz',

      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: Brightness.light,

        primarySwatch: Colors.blue,

        scaffoldBackgroundColor:
        const Color(0xFFF5F7FB),

        fontFamily: 'Poppins',
      ),

      darkTheme: ThemeData(
        appBarTheme: const AppBarTheme(
          centerTitle: true,
        ),
        brightness: Brightness.dark,

        scaffoldBackgroundColor:
        const Color(0xFF121212),

        cardColor:
        const Color(0xFF1E1E1E),

        fontFamily: 'Poppins',
      ),

      themeMode: ThemeMode.light,

      home: const SplashScreen(),
    );
  }
}