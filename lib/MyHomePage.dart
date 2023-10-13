import 'package:flutter/material.dart';
import 'Components/IconContent.dart';
import 'Components/Reusable.dart';

class MyHomePage extends StatefulWidget {
   const MyHomePage({super.key, required this.title});

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

enum  SelectGender{
 male ,female
}

class _MyHomePageState extends State<MyHomePage> {
  static const double bottomheight =80.0;
  static  int activeCardcolour = 0xff1D1E33;
  static const int bottomColour = 0xffeb1555;
  static  int inactiveCardcolour = 0xFF111328;

  static  int maleCardcolour = inactiveCardcolour;
  static  int femaleCardcolour = inactiveCardcolour;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
           title: Text(widget.title),
      ),
           body:  Center(
             child: Column(
                children: [Expanded(
                 child: Row(
                   children: [
                     Reusable(color:  Color(maleCardcolour),
                         childCard:  GestureDetector(
                           onTap: () {
                             setState(() {
                               updateColor(gender: SelectGender.male);
                               print("male");
                             });
                           },
                             child: const ChildCard( iconImg: Icons.male_sharp, gender: 'MALE',))),
                      Reusable(color:  Color(femaleCardcolour),
                       childCard: GestureDetector(
                         onTap: () {
                           setState(() {
                            updateColor(gender: SelectGender.female);
                            print("female");
                           });
                         },
                           child: const ChildCard(iconImg: Icons.female_sharp, gender: 'FEMALE'))),
                   ],
                 ),
               ),
                    Expanded(child: Row(
                    children: [
                      Reusable(color: Color(activeCardcolour),),
                    ],
                  )),
                    Expanded(child: Row(
                    children: [
                      Reusable(color: Color(activeCardcolour),),
                      Reusable(color: Color(activeCardcolour),),
                    ],
                  )
                  ),
                  Container(
                    color: const Color(bottomColour),
                    margin: const EdgeInsets.only(top: 10),
                    width: double.infinity,
                    height: bottomheight,
                  )
              ],
             ),
           ),
        )
    );
  }
  void updateColor({required SelectGender gender}){
    maleCardcolour = gender == SelectGender.male ? activeCardcolour : inactiveCardcolour;
    femaleCardcolour = gender == SelectGender.female ? activeCardcolour : inactiveCardcolour;
  }
}
