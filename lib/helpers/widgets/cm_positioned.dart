import 'package:flutter/material.dart';
import '../config.dart';

class CmPositioned extends StatelessWidget {
  final Widget child;
  final double? start;
  final double? top;
  final double? end;
  final double? bottom;
  final double? width;
  final double? height;

  const CmPositioned({
    Key? key,
    required this.child,
    this.start,
    this.top,
    this.end,
    this.bottom,
    this.width,
    this.height,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        left: appLang == "en" ? start : end,
        right: appLang == "en" ? end : start,
        top: top,
        bottom: bottom,
        height: height,
        width: width,
        child: child);
  }
}
