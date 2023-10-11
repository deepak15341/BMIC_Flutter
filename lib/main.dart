import 'package:flutter/material.dart';

import 'MyHomePage.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(
          primary:  const Color(0xff0E1020),
        ),
         scaffoldBackgroundColor: const Color( 0xff0E1020),
        textTheme: const TextTheme(bodyMedium: TextStyle(color: Colors.white,fontSize: 20))


      ),
      home: const MyHomePage(title: 'BMI CALCULATOR'),
    );
  }
}

