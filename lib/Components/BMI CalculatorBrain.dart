import "../Constants.dart";
class BMICalcuatorBrain{
  double? height;
  int? weight;


  BMICalcuatorBrain({required this.height,required this.weight}) ;

    double bmi() {
      return (((weight! / height! / height!) * 10000));
    }


  String getLabel({required String label} ) {

    double kBMI = bmi();
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