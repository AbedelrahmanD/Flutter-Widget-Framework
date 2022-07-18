import 'package:flutter/material.dart';
import '../config.dart';

class CmDirectionality extends StatelessWidget {
  final Widget child;

  const CmDirectionality({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: appLang == "en" ? TextDirection.ltr : TextDirection.rtl,
        child: child);
  }
}
