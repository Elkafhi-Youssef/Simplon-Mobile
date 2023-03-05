import 'package:flutter/material.dart';
import 'package:simplonline/screens/home_screen.dart';
import 'package:simplonline/screens/login_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',

      routes: {
        '/': (context) => const LoginScreen(),
        '/home': (context) => HomeScreen(),
        
      },
    );
  }
}
