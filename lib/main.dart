import 'package:deals_dray/screens/bottom_navigation_bar.dart';
import 'package:deals_dray/screens/home_screen.dart';
import 'package:deals_dray/screens/login_screen.dart';
import 'package:deals_dray/screens/registration_screen.dart';
import 'package:deals_dray/screens/splash_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        "/": (context) => const SplashScreen(),
        "/loginScreen": (context) => const LoginScreen(),
        "/registrationScreen": (context) => const RegistrationScreen(),
        "/homeScreen": (context) => const HomeScreen(),
        "/bottomAppBarScreen": (context) => const BottomAppBarScreen(),
      },
    );
  }
}
