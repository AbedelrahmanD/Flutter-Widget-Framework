import 'package:flutter/material.dart';
import '../config.dart';

// ignore: must_be_immutable
class CmContainer extends StatelessWidget {
  final Widget child;
  final Color color;
  final double paddingAll;
  double paddingStart;
  double paddingEnd;
  double paddingTop;
  double paddingBottom;
  final double marginAll;
  double marginStart;
  double marginEnd;
  double marginTop;
  double marginBottom;
  final Color borderColor;
  final double borderWidthAll;
  double borderWidthTop;
  double borderWidthBottom;
  double borderWidthStart;
  double borderWidthEnd;
  final double borderRadiusAll;
  double borderRadiusTopStart;
  double borderRadiusTopEnd;
  double borderRadiusBottomStart;
  double borderRadiusBottomEnd;

  final double? width;
  final double? height;

  final Color boxShadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;

  final bool isClipHardEdge;
  CmContainer(
      {Key? key,
      required this.child,
      this.color = Colors.transparent,
      this.paddingAll = 0,
      this.paddingStart = 0,
      this.paddingEnd = 0,
      this.paddingBottom = 0,
      this.paddingTop = 0,
      this.marginAll = 0,
      this.marginStart = 0,
      this.marginEnd = 0,
      this.marginBottom = 0,
      this.marginTop = 0,
      this.borderColor = Colors.transparent,
      this.borderWidthAll = 0,
      this.borderWidthTop = 0,
      this.borderWidthBottom = 0,
      this.borderWidthStart = 0,
      this.borderWidthEnd = 0,
      this.borderRadiusAll = 0,
      this.borderRadiusTopStart = 0,
      this.borderRadiusTopEnd = 0,
      this.borderRadiusBottomStart = 0,
      this.borderRadiusBottomEnd = 0,
      this.width,
      this.height,
      this.boxShadowColor = Colors.transparent,
      this.spreadRadius = 1,
      this.blurRadius = 5,
      this.offset = const Offset(0, 1),
        this.isClipHardEdge=true,
      })
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (paddingAll > 0) {
      paddingStart = paddingEnd = paddingTop = paddingBottom = paddingAll;
    }
    if (marginAll > 0) {
      marginStart = marginEnd = marginTop = marginBottom = marginAll;
    }
    if (borderRadiusAll > 0) {
      borderRadiusTopStart = borderRadiusTopEnd =
          borderRadiusBottomStart = borderRadiusBottomEnd = borderRadiusAll;
    }
    if (borderWidthAll > 0) {
      borderWidthTop = borderWidthBottom =
          borderWidthStart = borderWidthEnd = borderWidthAll;
    }
    double borderStart = appLang == "en" ? borderWidthStart : borderWidthEnd;
    double borderEnd = appLang == "en" ? borderWidthEnd : borderWidthStart;

    bool isBorderRadius = (borderWidthTop == borderWidthBottom) &&
        (borderStart == borderEnd) &&
        (borderStart == borderWidthTop);
    return Container(
      clipBehavior: isClipHardEdge?Clip.hardEdge :Clip.none,
      margin: EdgeInsets.fromLTRB(appLang == "en" ? marginStart : marginEnd,
          marginTop, appLang == "ar" ? marginStart : marginEnd, marginBottom),
      padding: EdgeInsets.fromLTRB(
          appLang == "en" ? paddingStart : paddingEnd,
          paddingTop,
          appLang == "ar" ? paddingStart : paddingEnd,
          paddingBottom),
      decoration: BoxDecoration(
        color: color,
        border: Border(
          left: BorderSide(
            color: borderStart > 0 ? borderColor : Colors.transparent,
            width: borderStart,
          ),
          right: BorderSide(
            color: borderEnd > 0 ? borderColor : Colors.transparent,
            width: borderEnd,
          ),
          top: BorderSide(
            color: borderWidthTop > 0 ? borderColor : Colors.transparent,
            width: borderWidthTop,
          ),
          bottom: BorderSide(
            color: borderWidthBottom > 0 ? borderColor : Colors.transparent,
            width: borderWidthBottom,
          ),
        ),

        borderRadius: isBorderRadius
            ? BorderRadius.only(
                bottomLeft: Radius.circular(appLang == "en"
                    ? borderRadiusBottomStart
                    : borderRadiusBottomEnd),
                bottomRight: Radius.circular(appLang == "en"
                    ? borderRadiusBottomEnd
                    : borderRadiusBottomStart),
                topLeft: Radius.circular(appLang == "en"
                    ? borderRadiusTopStart
                    : borderRadiusTopEnd),
                topRight: Radius.circular(appLang == "en"
                    ? borderRadiusTopEnd
                    : borderRadiusTopStart),
              )
            : null,
        boxShadow: [
          if(boxShadowColor!=Colors.transparent)
          BoxShadow(
            color: boxShadowColor.withOpacity(0.5),
            spreadRadius: spreadRadius,
            blurRadius: blurRadius,
            offset: offset, // changes position of shadow
          ),
        ],
      ),
      width: width,
      height: height,
      child: child,
    );
  }
}
