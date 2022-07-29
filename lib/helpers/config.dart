import 'package:flutter/material.dart';
import 'package:get/get.dart';
var appDir = "ltr".obs;
const Color primaryColor = Colors.deepPurple;
final Map<int, Color> primaryColorMap = {
  50: primaryColor,
  100: primaryColor,
  200: primaryColor,
  300: primaryColor,
  400: primaryColor,
  500:primaryColor,
  600: primaryColor,
  700: primaryColor,
  800: primaryColor,
  900: primaryColor,
};
final MaterialColor primaryColorSwatch = MaterialColor(50, primaryColorMap);

///***CmTextField
const Color cmTextFieldHintTextColor = primaryColor;
const Color cmTextFieldLabelTextColor = primaryColor;
const Color cmTextFieldInputColor = Colors.transparent;
const Color cmTextFieldBorderColor = Colors.grey;
const Color cmTextFieldFocusBorderColor = primaryColor;
const Color cmTextFieldIconColor = primaryColor;
const double cmTextFieldBorderRadius = 100;
const double cmTextFieldWidth = 300;
const double cmTextFieldHeight = 70;
const double cmTextFieldMarginTop = 10;
const double cmTextFieldMarginBottom = 10;
const double cmTextFieldScrollPadding = 120;


///***CmButton
const Color cmButtonColor = Colors.white;
const Color cmButtonBackgroundColor = primaryColor;
const Color cmButtonBorderColor = Colors.white;
const Color cmButtonBoxShadowColor = Colors.grey;
const double cmButtonPadding = 15.0;
const double cmButtonBorderRadius = 100;
const double cmButtonBorderWidth = 2;
const double cmButtonWidth = 300;
const double cmButtonMarginTop = 10;
const double cmButtonMarginBottom = 10;

///***CmCachedNetworkImage
const Widget cmCachedNetworkImagePlaceholder=CircularProgressIndicator();

///***fontFamily
const String textFontFamily="";
const List<String> textFontFamilyFallback=["Droid.Arabic.Kufi"];


const double widthSmallScreen=600;
const double widthMidScreen=1000;