import 'package:bmi_calculator/Components/BMI%20CalculatorBrain.dart';
import 'package:flutter/material.dart';
import 'Components/IconContent.dart';
import 'Components/Reusable.dart';
import 'Constants.dart';
import 'ResultPage.dart';
import 'package:fluttertoast/fluttertoast.dart';

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
        child: Scaffold(appBar: AppBar(
        title: Text(widget.title),
          ), body: Center(child: Column(
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
                          color: Color(kMaleCardColour =
                              kSelectedGender == SelectGender.male
                                  ? kActiveCardColour
                                  : kInactiveCardColour),
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
                          color: Color(kFemaleCardColour =
                              kSelectedGender == SelectGender.female
                                  ? kActiveCardColour
                                  : kInactiveCardColour),
                          childCard: const ChildCard(
                              iconImg: Icons.female_sharp, gender: 'FEMALE')),
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
                      color: const Color(kActiveCardColour),
                      childCard: Center(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text("HEIGHT", style: kLabelTextStyle),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  Text(height.toStringAsFixed(0),
                                      style: kLabelLarge),
                                  const SizedBox(
                                    width: 5,
                                  ),
                                  const Text("cm", style: kLabelSmall),
                                ],
                              ),
                              SliderTheme(
                                data: const SliderThemeData(
                                  thumbShape: RoundSliderThumbShape(
                                      enabledThumbRadius: 15),
                                ),
                                child: Slider(
                                  value: height,
                                  min: 60,
                                  max: 220,
                                  activeColor: Colors.white,
                                  inactiveColor: Colors.white30,
                                  label: height.round().toString(),
                                  thumbColor: const Color(0xffeb1555),
                                  onChanged: (double newValue) {
                                    setState(() {
                                      height = newValue;
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
                      color: const Color(kActiveCardColour),
                      childCard:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                           'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            weight.toString(),
                            style: kLabelLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                     weight--;
                                    });
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.remove)),

                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                    weight++;
                                    });
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.add)),


                            ],
                          )
                        ],
                      ),
                    ),
                    Reusable(
                      color: const Color(kActiveCardColour),
                      childCard:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kLabelLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.remove)),

                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                  onPressed: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.add)),


                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                )),
            InkWell(
              onTap: () {
                if (kSelectedGender != null) {
                  BMICalcuatorBrain(height: height, weight: weight);
                 /* print(ReusableWAState().getWeight());*/

                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResultPage(
                         kBMI: (BMICalcuatorBrain(weight: weight,height: height).bmi()),

                        ),
                      ));
                } else {
                  Fluttertoast.showToast(
                      msg: "Please Choose Gender",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      backgroundColor: Colors.grey);
                }
              },
              child: Container(
                color: const Color(kBottomColour),
                margin: const EdgeInsets.all(10),
                width: double.infinity,
                height: kBottomHeight,
                child: const Center(
                    child: Text(
                  "CALCULATE",
                  style: kLabelTextLarge,
                )),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
