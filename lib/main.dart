import 'package:flutter/material.dart';
import 'package:mobile_computing_smart_home/screen/Home.dart';
// import 'package:mobile_computing_smart_home/screen/Home.dart';
import 'package:mobile_computing_smart_home/screen/login.dart';
import 'package:mobile_computing_smart_home/screen/profile.dart';
import 'package:mobile_computing_smart_home/screen/signup.dart';
import 'package:mobile_computing_smart_home/screen/splash.dart';
import 'package:mobile_computing_smart_home/screen/Bottom_Navigation.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Splash(),
      routes: {
        '/BottomBar':(context) => const BottomBar(),
        '/SignUp':(context)=> const SignUp(),
        '/SignIn':(context)=> const SignIn(),
        '/Profile':(context)=> const Profile(),
        '/Home' :(context) => const Home(),
      },
    );
  }
}
