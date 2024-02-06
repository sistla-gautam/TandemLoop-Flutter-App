
import 'package:flutter/material.dart';
import 'package:flutter_tutorial/pages/home.dart';
import 'package:flutter_tutorial/pages/sign-in.dart';
import 'package:flutter_tutorial/pages/user-profile.dart';
import 'package:flutter_tutorial/theme/theme_provider.dart';
import 'package:flutter_tutorial/theme/themes.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Sign_in(),
      theme: Provider.of<ThemeProvider>(context).themeData,
      routes: {
        '/sign-in': (context) => Sign_in(),
        '/homepage': (context) => HomePage(),
        '/user-profile': (context) => UserProfile()
      },
    );
  }
}
