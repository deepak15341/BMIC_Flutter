import 'package:flutter/material.dart';
import 'Components/IconContent.dart';
import 'Components/Reusable.dart';
import 'Constants.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double _height = 120;
  int weight = 30;
  int age = 18;
  @override
  Widget build(BuildContext context) {


    return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
          ),
          body: Center(
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              kSelectedGender = SelectGender.male;
                            });
                          },
                          child: Reusable(
                              color: Color(kMaleCardcolour =
                              kSelectedGender == SelectGender.male
                                  ? kActiveCardcolour
                                  : kInactiveCardcolour),
                              childCard: const ChildCard(
                                iconImg: Icons.male_sharp,
                                gender: 'MALE',
                              )),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              kSelectedGender = SelectGender.female;
                            });
                          },
                          child: Reusable(
                              color: Color(kFemaleCardcolour =
                              kSelectedGender == SelectGender.female
                                  ? kActiveCardcolour
                                  : kInactiveCardcolour),
                              childCard: const ChildCard(
                                  iconImg: Icons.female_sharp,
                                  gender: 'FEMALE')),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Reusable(
                          color: Color(kActiveCardcolour),
                          childCard: Center(
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text("HEIGHT", style: kLabelTextStyle),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment
                                        .baseline,
                                    textBaseline: TextBaseline.alphabetic,
                                    children: [
                                      Text(_height.toStringAsFixed(0),
                                          style: kLabelLarge),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      const Text("cm", style: kLabelsmall),
                                    ],
                                  ),
                                  SliderTheme(
                                    data: const SliderThemeData(
                                      thumbShape: RoundSliderThumbShape(
                                          enabledThumbRadius: 15),
                                    ),
                                    child: Slider(
                                      value: _height,
                                      min: 60,
                                      max: 220,
                                      activeColor: Colors.white,
                                      inactiveColor: Colors.white30,
                                      label: _height.round().toString(),
                                      thumbColor: const Color(0xffeb1555),
                                      onChanged: (double newValue) {
                                        setState(() {
                                          _height = newValue;
                                        });
                                      },
                                    ),
                                  ),
                                ]),
                          ),
                        ),
                      ],
                    )),
                Expanded(
                    flex: 1,
                    child: Row(
                      children: [
                        Reusable(
                          color: Color(kActiveCardcolour),
                          childCard: ReusableWA(title: "WEIGHT",data: weight, pressed: () {
                            setState(() {
                            });
                          },),
                        ),
                        Reusable(
                          color: Color(kActiveCardcolour),
                          childCard: ReusableWA(title: "AGE",data: age, pressed: () {
                            setState(() {

                            });
                          }),
                        ),
                      ],
                    )),
                Container(
                  color: const Color(kBottomColour),
                  margin: const EdgeInsets.only(top: 10),
                  width: double.infinity,
                  height: kBottomheight,
                )
              ],
            ),
          ),
        ));

  }
}
