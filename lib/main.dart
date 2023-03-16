import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:simplonline/models/briefs.dart';
import 'package:simplonline/screens/briefs.dart';
import 'package:simplonline/screens/home_screen.dart';
import 'package:simplonline/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:simplonline/screens/register_screen.dart';
import 'package:simplonline/widget_tree.dart';


bool? isLogin;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  var user = FirebaseAuth.instance.currentUser;
  if (user == null) {
    isLogin = false;
  } else {
    isLogin = true;
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      home: isLogin == false ?  LoginScreen(): HomeScreen(),
      routes: {
        "login": (context) => LoginScreen(),
        "signup": (context) => Registre(),
        "homepage": (context) => HomeScreen(),
        "birefs": (context)=> BriefsList(),
      },
    );

    
  }
}
