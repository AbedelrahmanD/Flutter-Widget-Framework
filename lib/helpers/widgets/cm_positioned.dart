import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
    return Obx(()=>Positioned(
      left: appDir.value == "ltr" ? start : end,
      right: appDir.value == "ltr" ? end : start,
      top: top,
      bottom: bottom,
      height: height,
      width: width,
      child: child,));
  }
}
