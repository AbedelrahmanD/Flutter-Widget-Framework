import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cm_container.dart';
import '../config.dart';

// ignore: must_be_immutable
class CmTextField extends StatelessWidget {
  final String hintText;
  final Color hintTextColor;
  final String? labelText;
  final Color labelTextColor;
  final Color inputColor;
  final Color borderColor;
  final double borderRadius;
  final String? error;
  TextEditingController? controller;
  IconData? iconData;
  final bool obscureText;
  dynamic filter;
  int minLines;
  int maxLines;
  dynamic keyboardType;
  bool enabled;
  final double marginTop;
  final double marginBottom;
  final double? width;
  final bool readOnly;
  final VoidCallback? onTap;
  IconData? suffixIconData;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  bool autofocus;

  CmTextField({
    Key? key,
    this.hintText = "",
    this.hintTextColor = cmTextFieldHintTextColor,
    this.labelText,
    this.labelTextColor = cmTextFieldLabelTextColor,
    this.inputColor = cmTextFieldInputColor,
    this.borderColor = cmTextFieldBorderColor,
    this.borderRadius = cmTextFieldBorderRadius,
    this.error,
    this.controller,
    this.iconData,
    this.obscureText = false,
    this.filter,
    this.minLines = 1,
    this.maxLines = 1,
    this.keyboardType = TextInputType.text,
    this.enabled = true,
    this.marginTop = cmButtonMarginTop,
    this.marginBottom = cmButtonMarginBottom,
    this.width = cmTextFieldWidth,
    this.readOnly = false,
    this.onTap,
    this.suffixIconData,
    this.onChanged,
    this.focusNode,
    this.autofocus=false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CmContainer(
      isClipHardEdge: false,
      width: width,
      marginTop: marginTop,
      marginBottom:marginBottom,
      child: TextField(
        autofocus: autofocus,
        focusNode:focusNode,
        onChanged:onChanged,
        onTap: onTap,
        readOnly: readOnly,
        enabled: enabled,
        minLines: minLines,
        maxLines: maxLines,
        obscureText: obscureText,
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: [
          filter ?? FilteringTextInputFormatter.deny(RegExp('[]')),
        ],
        decoration: InputDecoration(
          prefixIcon: Icon(
            iconData,
            color: cmTextFieldIconColor,
          ),
          suffixIcon: Icon(
            suffixIconData,
            color: cmTextFieldIconColor,
          ),
          hintText: hintText,
          hintStyle: TextStyle(color: hintTextColor),
          labelText: labelText,
          labelStyle: TextStyle(color: labelTextColor),
          fillColor: inputColor,
          filled: true,
          errorText: error,
          errorMaxLines: 3,
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.red, width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: borderColor, width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),

          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(
                color: cmTextFieldFocusBorderColor, width: 1.0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: inputColor, width: 0.0),
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
      ),
    );
  }
}
