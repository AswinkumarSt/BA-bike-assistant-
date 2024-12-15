import 'package:breakie/pages/homepage.dart';
import 'package:breakie/pages/loginpage.dart';
import 'package:breakie/pages/resetpassword.dart';
import 'package:breakie/pages/selectionpage.dart';
import 'package:breakie/pages/signuppage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      theme: ThemeData(fontFamily: 'Poppins'),
      debugShowCheckedModeBanner: false,
      home:  HomePage(),
      routes: {
        '/homepage' :(context) => const HomePage(),
        '/loginpage' :(context)=> const LoginPage(),
        '/resetpage' :(context)=> const ResetPage(),
        '/signuppage' :(context)=> const SignUpPage(),
        '/selectionpage' :(context) => const SelectionPage()
      },
    );
  }
}

