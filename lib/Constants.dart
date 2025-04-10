import 'package:flutter/material.dart';

const kLabelTextStyle = TextStyle(fontSize: 18 /*,color: Color(0xFF8D8E98)*/);
SelectGender? kSelectedGender;
const double kBottomHeight = 60.0;

const int kActiveCardColour = 0xff1D1E33;
const int kBottomColour = 0xffeb1555;
const int kInactiveCardColour = 0xFF111328;
const kLabelLarge = TextStyle(fontWeight: FontWeight.w900, fontSize: 50.0);
const kLabelSmall = TextStyle(fontWeight: FontWeight.w900, fontSize: 25.0);

int kMaleCardColour = kInactiveCardColour;
int kFemaleCardColour = kInactiveCardColour;
double height = 120;
int weight = 30;
int age = 18;

String normal ='NORMAL';
String underWeight= 'UNDER WEIGHT';
String overWeight = 'OVER WEIGHT';
String title = 'BMI CALCULATOR';
const kLabelTextLarge = TextStyle(fontWeight: FontWeight.bold, fontSize: 35.0);
const kLabelTextMedium = TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0,color: Color(0xff24d876));

enum SelectGender { male, female,Na }
const kFABColour = 0xff4C4F5E;
