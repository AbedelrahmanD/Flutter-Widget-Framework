import 'package:flutter/material.dart';

import '../config.dart';

class CmText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final FontStyle fontStyle;
  final Color color;
  final bool isFitted;
  final String fontFamily;
  final List<String> fontFamilyFallBack;

  const CmText(
      {Key? key,
      required this.text,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal,
      this.fontStyle = FontStyle.normal,
      this.color = Colors.black,
      this.isFitted = false,
      this.fontFamily = textFontFamily,
      this.fontFamilyFallBack = textFontFamilyFallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget textWidget = Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color: color,
          fontStyle: fontStyle,
          fontFamily: fontFamily,
          fontFamilyFallback:
          fontFamilyFallBack
          ),
    );
    return isFitted
        ? FittedBox(
            child: textWidget,
          )
        : textWidget;
  }
}
