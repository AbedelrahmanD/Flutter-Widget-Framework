import 'package:flutter/material.dart';

class CmText extends StatelessWidget {
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final bool isFitted;


  const CmText({
    Key? key,
    required this.text,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.isFitted=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Widget textWidget= Text(
      text,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: fontWeight,
        color: color,
      ),
    );
    return isFitted?FittedBox(child: textWidget,):textWidget;
  }
}
