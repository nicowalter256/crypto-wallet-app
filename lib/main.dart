import 'package:crypto_wallet/home_screen.dart';
import 'package:crypto_wallet/sign_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:crypto_wallet/splash_screen1.dart';
import './overview.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto Wallet',
      theme: ThemeData(
        primaryColor: const Color.fromRGBO(32, 39, 55, 100),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const Overview(),
      //home: SignUpScreen(),
      // home: SplashScreen1(),
    );
  }
}
