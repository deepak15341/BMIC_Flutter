import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
           title: Text(widget.title),
      ),
           body: const Column(
              children: [
             Expanded(
               child: Row(
                 children: [
                   Reusable(),
                   Reusable(),
                 ],
               ),
             ),
                Expanded(child: Row(
                  children: [
                    Reusable(),
                  ],
                )),
                Expanded(child: Row(
                  children: [
                    Reusable(),
                    Reusable(),
                  ],
                ))
        ],
      ),
    ));
  }
}

class Reusable extends StatelessWidget{
  const Reusable({super.key});

  @override
  Widget build(BuildContext context) {
return Expanded(
  child: Container(
    margin: const EdgeInsets.all(15),
    decoration: BoxDecoration(
        color: const Color(0xff1D1E33),
        borderRadius: BorderRadius.circular(10.0)),
  ),
);
  }

}