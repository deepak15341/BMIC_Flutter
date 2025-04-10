import 'package:bmi_calculator/calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'calculator/calculator_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CalculatorBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            colorScheme: ColorScheme.fromSwatch().copyWith(
              primary: const Color(0xff0E1020),
            ),
            scaffoldBackgroundColor: const Color(0xff0E1020),
            textTheme: const TextTheme(
                bodyMedium: TextStyle(color: Colors.white, fontSize: 20))),
        home: const CalculatorScreen(),
      ),
    );
  }
}
