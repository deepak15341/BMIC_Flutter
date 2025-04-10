import 'package:bmi_calculator/calculator/bloc/calculator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../Constants.dart';
import 'bloc/calculator_state.dart';

class ResultPage extends StatelessWidget {
  ResultPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( iconTheme: IconThemeData(color: Colors.white),
        title: Text(
          "Your Result",
          style: TextStyle(
              color: Colors.white, fontSize: 22, fontWeight: FontWeight.w400),
        ),
        backgroundColor: const Color(kInactiveCardColour),
        elevation: 0,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: const Color(kActiveCardColour),
                    borderRadius: BorderRadius.circular(15)),
                width: double.maxFinite,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    BlocSelector<CalculatorBloc, CalculatorState, String>(
                      selector: (state) =>
                          context.read<CalculatorBloc>().getLabel(label: "labelTag"),
                      builder: (context, label) => Text(label, style: kLabelTextMedium),
                    ),
                    BlocSelector<CalculatorBloc, CalculatorState, double>(
                      selector: (state) => context.read<CalculatorBloc>().kBMI,
                      builder: (context, bmi) =>
                          Text(bmi.toStringAsFixed(2), style: kLabelLarge),
                    ),
                    BlocSelector<CalculatorBloc, CalculatorState, String>(
                      selector: (state) =>
                          context.read<CalculatorBloc>().getLabel(label: "labelDescription"),
                      builder: (context, description) => Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(description, style: kLabelSmall),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 10,),
                decoration: BoxDecoration(
                    color: const Color(kBottomColour),
                    borderRadius: BorderRadius.circular(15)),
                width: double.infinity,
                height: kBottomHeight,
                child: const Center(
                    child: Text(
                  "RE-CALCULATE",
                  style: kLabelTextLarge,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
