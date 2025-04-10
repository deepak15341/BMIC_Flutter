import 'package:bmi_calculator/calculator/bloc/calculator_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Constants.dart';

class CalculatorBloc extends Cubit<CalculatorState> {
  CalculatorBloc()
      : super(CalculatorState(
            selectGender: SelectGender.Na, height: 120, age: 16, weight: 30));

  void updateGender(SelectGender gender) {
    emit(CalculatorState(
        selectGender: gender,
        height: state.height,
        age: state.age,
        weight: state.weight));
  }

  void updateHeight(double height) {
    emit(CalculatorState(
        selectGender: state.selectGender,
        height: height,
        age: state.age,
        weight: state.weight));
  }

  void updateAge(int age) {
    emit(CalculatorState(
        selectGender: state.selectGender,
        height: state.height,
        age: age,
        weight: state.weight));
  }

  void updateWeight(int weight) {
    emit(CalculatorState(
        selectGender: state.selectGender,
        height: state.height,
        age: state.age,
        weight: weight));
  }
  double kBMI = -1;
  calculateBMI() {
    if (state.selectGender != SelectGender.Na) {
      kBMI =  (((state.weight / state.height / state.height) * 10000));
    } else {
      kBMI = -1;
    }
  }

  String getLabel({required String label}) {

    if (label == 'labelTag') {
      if (kBMI >= 25.0) {
        return overWeight;
      } else if (kBMI <= 18.5) {
        return underWeight;
      } else {
        return normal;
      }
    } else if (label == 'labelDescription') {
      if (kBMI >= 25.0) {
        return 'Your BMI is $overWeight than the normal BMI set By the WHO! Please Exercise more';
      } else if (kBMI <= 18.5) {
        return 'Your BMI is $underWeight than the normal BMI set By the WHO! Please Exercise and take good Diet';
      } else {
        return 'Your BMI is $normal according to the BMI set By the WHO! Take Care';
      }
    } else {
      return "not Needed";
    }
  }
}
