// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
  final double? widthSm;
  final double? widthMd;
  final double? widthLg;
  final Color boxShadowColor;
  final double spreadRadius;
  final double blurRadius;
  final Offset offset;
  final double? maxHeight;
  final double? minHeight;
  final double? maxWidth;
  final double? minWidth;
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
      this.widthSm,
      this.widthMd,
      this.widthLg,
      this.boxShadowColor = Colors.transparent,
      this.spreadRadius = 1,
      this.blurRadius = 5,
      this.offset = const Offset(0, 1),
      this.isClipHardEdge = false,
      this.maxHeight,
      this.minHeight,
      this.maxWidth,
      this.minWidth})
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
    double borderStart =
        appDir.value == "ltr" ? borderWidthStart : borderWidthEnd;
    double borderEnd =
        appDir.value == "ltr" ? borderWidthEnd : borderWidthStart;

    bool isBorderRadius = (borderWidthTop == borderWidthBottom) &&
        (borderStart == borderEnd) &&
        (borderStart == borderWidthTop);
    double? containerWidth;
    if (width != null) {
      containerWidth = width;
    } else {
      if (Get.width <= widthSmallScreen) {
        containerWidth = widthSm;
      } else if (Get.width <= widthMidScreen) {
        containerWidth = widthMd;
      } else {
        containerWidth = widthLg;
      }
    }

    return Obx(() => Container(
          constraints: BoxConstraints(
            maxHeight: maxHeight ?? double.infinity,
            minHeight: minHeight ?? 0.0,
            maxWidth: maxWidth ?? double.infinity,
            minWidth: minWidth ?? 0.0,
          ),
          clipBehavior: isClipHardEdge ? Clip.hardEdge : Clip.none,
          margin: EdgeInsets.fromLTRB(
              appDir.value == "ltr" ? marginStart : marginEnd,
              marginTop,
              appDir.value == "rtl" ? marginStart : marginEnd,
              marginBottom),
          padding: EdgeInsets.fromLTRB(
              appDir.value == "ltr" ? paddingStart : paddingEnd,
              paddingTop,
              appDir.value == "rtl" ? paddingStart : paddingEnd,
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
                    bottomLeft: Radius.circular(appDir.value == "ltr"
                        ? borderRadiusBottomStart
                        : borderRadiusBottomEnd),
                    bottomRight: Radius.circular(appDir.value == "ltr"
                        ? borderRadiusBottomEnd
                        : borderRadiusBottomStart),
                    topLeft: Radius.circular(appDir.value == "ltr"
                        ? borderRadiusTopStart
                        : borderRadiusTopEnd),
                    topRight: Radius.circular(appDir.value == "ltr"
                        ? borderRadiusTopEnd
                        : borderRadiusTopStart),
                  )
                : null,
            boxShadow: [
              if (boxShadowColor != Colors.transparent)
                BoxShadow(
                  color: boxShadowColor.withOpacity(0.5),
                  spreadRadius: spreadRadius,
                  blurRadius: blurRadius,
                  offset: offset, // changes position of shadow
                ),
            ],
          ),
          width: containerWidth,
          height: height,
          child: child,
        ));
  }
}
