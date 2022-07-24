import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config.dart';

class CmDirectionality extends StatelessWidget {
  final Widget child;

  const CmDirectionality({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(()=>Directionality(
        textDirection: appDir.value == "ltr" ? TextDirection.ltr : TextDirection.rtl,
        child: child));
  }
}
