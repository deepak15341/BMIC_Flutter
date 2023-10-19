import 'package:bmi_calculator/BMI%20CalculatorBrain.dart';
import 'package:flutter/material.dart';
import '../Constants.dart';

class ResultPage extends StatefulWidget {
   const ResultPage(
      {super.key,
      required this.kBMI
     });

  final double kBMI;

  @override
  State<StatefulWidget> createState() {
    return MyResultPage();
  }
}

class MyResultPage extends State<ResultPage> {
  BMICalcuatorBrain bmiCalculatorBrain = BMICalcuatorBrain(height:height,weight: weight);
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(bottom: 16.0),
              child: Text("Your Result",style: kLabelTextLarge,),
            ),
            Expanded(
              child: Center(
                child: Container(
                  color: const Color(kActiveCardColour),
                  width: double.maxFinite,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(bmiCalculatorBrain.getLabel(label: 'labelTag'),style: kLabelTextMedium),
                      Text((widget.kBMI).toStringAsFixed(2), style: kLabelLarge),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(bmiCalculatorBrain.getLabel(label: 'labelDescription'), style: kLabelSmall),
                      ),
                    ],
                  ),
                ),
              ),
            ),


            InkWell(
              onTap: () {
                if (kSelectedGender != null) {
                  Navigator.pop(context);
                }
              },
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                color: const Color(kBottomColour),
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
