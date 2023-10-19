import 'package:flutter/material.dart';
import 'Constants.dart';

class ResultPage extends StatefulWidget {
   ResultPage(
      {super.key,
      required this.gender,
      required this.height,
      required this.weight,
      required this.age});
  final SelectGender gender;
  final int height;
   int weight;
   int age;
  @override
  State<StatefulWidget> createState() {
    return MyResultPage();
  }
}

class MyResultPage extends State<ResultPage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Center(child: Text(title))),
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
                    children: [
                      Text(getLabel(bmi: bmi(),label: 'labelTag'),style: kLabelTextMedium),
                      Text(bmi(), style: kLabelLarge),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(getLabel(bmi: bmi(),label: 'labelDescription'), style: kLabelSmall),
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

  String bmi() {
    int height = widget.height;
    double weight = widget.weight.toDouble();

    return (((weight / height / height) * 10000).toStringAsFixed(2));
  }

  String getLabel({required String bmi,required String label} ) {

    double kBMI = double.parse(bmi);
   if(label=='labelTag') {
     if (kBMI >= 25.0) {
       return overWeight;
     }
     else if (kBMI <= 18.5) {
       return underWeight;
     }
     else {
       return normal;
     }
   }
   else if(label=='labelDescription'){
     if (kBMI >= 25.0) {
       return 'Your BMI is $overWeight than the normal BMI set By the WHO! Please Exercise more';
     }
     else if (kBMI <= 18.5) {
       return 'Your BMI is $underWeight than the normal BMI set By the WHO! Please Exercise and take good Diet';
     }
     else {
       return 'Your BMI is $normal according to the BMI set By the WHO! Take Care';
     }
   }
   else{
    return "not Needed";
   }

  }
}
