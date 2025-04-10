import 'package:bmi_calculator/calculator/bloc/calculator_bloc.dart';
import 'package:bmi_calculator/calculator/bloc/calculator_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Components/IconContent.dart';
import '../Constants.dart';
import 'ResultPage.dart';


class CalculatorScreen extends StatelessWidget {
  const CalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final bloc = context.read<CalculatorBloc>();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "BMI Calculator",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(kInactiveCardColour),
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            children: [
              BlocSelector<CalculatorBloc,CalculatorState,SelectGender>(
                selector: ( state) { return state.selectGender; },
                builder: (BuildContext context, state) { return Expanded(
                  child: GestureDetector(
                    onTap: () {
                      context.read<CalculatorBloc>().updateGender(SelectGender.male);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: Color(kMaleCardColour =
                        state == SelectGender.male
                            ? kActiveCardColour
                            : kInactiveCardColour),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: const ChildCard(
                        iconImg: Icons.male_sharp,
                        gender: 'MALE',
                      ),
                    ),
                  ),
                ); },

              ),
              BlocSelector<CalculatorBloc,CalculatorState,SelectGender>(
                selector: ( state) { return state.selectGender; },
                builder: (context, state) {
                  return Expanded(
                    child: GestureDetector(
                      onTap: () {
                        context.read<CalculatorBloc>().updateGender(SelectGender.female);
                      },
                      child: Container(
                          padding: const EdgeInsets.all(15),
                          margin: const EdgeInsets.all(15),
                          decoration: BoxDecoration(
                            color: Color(kFemaleCardColour =
                            state == SelectGender.female
                                ? kActiveCardColour
                                : kInactiveCardColour),
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          child: const ChildCard(
                              iconImg: Icons.female_sharp, gender: 'FEMALE')),
                    ),
                  );
                },
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(15),
            margin: const EdgeInsets.symmetric(horizontal: 15,vertical: 25),
            decoration: BoxDecoration(
              color: const Color(kActiveCardColour),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Center(
              child:  BlocSelector<CalculatorBloc,CalculatorState,double>(
                selector: (state) {
                  return state.height;
                },
                builder: (context, state) {
                  return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("HEIGHT", style: kLabelTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(state.toStringAsFixed(0), style: kLabelLarge),
                            const SizedBox(
                              width: 5,
                            ),
                            const Text("cm", style: kLabelSmall),
                          ],
                        ),
                        SliderTheme(
                          data: const SliderThemeData(
                            thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15),
                          ),
                          child: Slider(
                            value: state,
                            min: 60,
                            max: 250,
                            activeColor: Colors.white,
                            inactiveColor: Colors.white30,
                            label: state.round().toString(),
                            thumbColor: const Color(0xffeb1555),
                            onChanged: (double newValue) {
                              context.read<CalculatorBloc>().updateHeight(newValue);
                            },
                          ),
                        )
                      ]);
                },
              ),
            ),
          ),
          Row(
            children: [
              BlocSelector<CalculatorBloc,CalculatorState,int>(
                selector: (state) => state.weight,
                builder: (context, state) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(kActiveCardColour),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'WEIGHT',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            state.toString(),
                            style: kLabelLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(
                                  heroTag: "weight--",
                                  onPressed: () {
                                    if (state > 3) {
                                      context.read<CalculatorBloc>().updateWeight(state-1);
                                    }
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.remove)),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(
                                  heroTag: "weight++",
                                  onPressed: () {
                                    if (state < 300) {
                                      context.read<CalculatorBloc>().updateWeight(state+1);
                                    }
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.add)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },
              ),
              BlocSelector<CalculatorBloc,CalculatorState,int>(
                selector: (state) => state.age,
                builder: (context, state) {
                  return Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(15),
                      margin: const EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: const Color(kActiveCardColour),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            state.toString(),
                            style: kLabelLarge,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FloatingActionButton(  heroTag: "age--",
                                  onPressed: () {
                                    if (state > 0) {
                                      context.read<CalculatorBloc>().updateAge(state-1);
                                    }
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.remove)),
                              const SizedBox(
                                width: 10,
                              ),
                              FloatingActionButton(heroTag: "age++",
                                  onPressed: () {
                                    if (state < 120) {
                                      context.read<CalculatorBloc>().updateAge(state+1);
                                    }
                                  },
                                  backgroundColor: const Color(kFABColour),
                                  child: const Icon(Icons.add)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                },

              ),
            ],
          ),

          GestureDetector(
            onTap: () {
            bloc.calculateBMI();
              if (bloc.kBMI!=-1) {

                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(
                      ),
                    ));
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("please Choose Gender")));
              }
            },
            child: Container(
              decoration: BoxDecoration(
                  color: const Color(kBottomColour),
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.only(top: 45,left: 10,right: 10),
              width: double.infinity,
              height: kBottomHeight,
              child: const Center(
                  child: Text(
                "CALCULATE",
                style: kLabelSmall,
              )),
            ),
          )
        ],
      )),
    );
  }
}
