import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'cm_container.dart';
import '../config.dart';

// ignore: must_be_immutable
class CmTextField extends StatefulWidget {
  final String hintText;
  final Color hintTextColor;
  final String? labelText;
  final Color labelTextColor;
  final Color inputColor;
  final Color borderColor;
  final Color focusBorderColor;
  final double borderRadius;
  final String? error;
  TextEditingController? controller;
  IconData? iconData;
  bool obscureText;
  dynamic filter;
  int minLines;
  int maxLines;
  dynamic keyboardType;
  bool enabled;
  final double marginTop;
  final double marginBottom;
  final double? width;
  final double? height;
  final bool readOnly;
  final VoidCallback? onTap;
  IconData? suffixIconData;
  final VoidCallback? onSuffixIconTap;
  final FocusNode? focusNode;
  final void Function(String)? onChanged;
  final VoidCallback? onEditingComplete;
  bool autofocus;
  final double scrollPadding;
  final TextInputAction textInputAction;
  bool isUnderLineBorder;
  final String fontFamily;
  final List<String> fontFamilyFallBack;
  final double fontSize;
  final FontStyle fontStyle;
  final FontWeight fontWeight;
   String type;

  CmTextField({
    Key? key,
    this.hintText = "",
    this.hintTextColor = cmTextFieldHintTextColor,
    this.labelText,
    this.labelTextColor = cmTextFieldLabelTextColor,
    this.inputColor = cmTextFieldInputColor,
    this.borderColor = cmTextFieldBorderColor,
    this.focusBorderColor = cmTextFieldFocusBorderColor,
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
    this.marginTop = cmTextFieldMarginTop,
    this.marginBottom = cmTextFieldMarginBottom,
    this.width = cmTextFieldWidth,
    this.height=cmTextFieldHeight,
    this.readOnly = false,
    this.onTap,
    this.suffixIconData,
    this.onSuffixIconTap,
    this.onChanged,
    this.onEditingComplete,
    this.focusNode,
    this.autofocus = false,
    this.scrollPadding=cmTextFieldScrollPadding,
    this.textInputAction=TextInputAction.next,
    this.isUnderLineBorder = false,
    this.fontFamily = textFontFamily,
    this.fontFamilyFallBack = textFontFamilyFallback,
    this.fontSize = 16,
    this.fontWeight = FontWeight.normal,
    this.fontStyle = FontStyle.normal,
    this.type = "text",
  }) : super(key: key);

  @override
  State<CmTextField> createState() => _CmTextFieldState();
}

class _CmTextFieldState extends State<CmTextField> {
  @override
  Widget build(BuildContext context) {
    dynamic errorBorder;
    dynamic border;
    dynamic focusBorder;
    dynamic disabledBorder;
    if (widget.isUnderLineBorder) {
      errorBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      border = UnderlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      focusBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: widget.focusBorderColor, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      disabledBorder = UnderlineInputBorder(
        borderSide: BorderSide(color: widget.inputColor, width: 0.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
    } else {
      errorBorder = OutlineInputBorder(
        borderSide: const BorderSide(color: Colors.red, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      border = OutlineInputBorder(
        borderSide: BorderSide(color: widget.borderColor, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      focusBorder = OutlineInputBorder(
        borderSide: BorderSide(color: widget.focusBorderColor, width: 1.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
      disabledBorder = OutlineInputBorder(
        borderSide: BorderSide(color: widget.inputColor, width: 0.0),
        borderRadius: BorderRadius.circular(widget.borderRadius),
      );
    }
    if (widget.type == "password") {
      widget.suffixIconData = Icons.remove_red_eye;
    }else
    if (widget.type == "email") {
      widget.filter = FilteringTextInputFormatter.deny(RegExp('[ ]'));
    }
    return CmContainer(
      isClipHardEdge: false,
      width: widget.width,
      height: 70,
      marginTop: widget.marginTop,
      marginBottom: widget.marginBottom,
      child: TextField(

        textInputAction: widget.textInputAction,
        scrollPadding:EdgeInsets.only(bottom: widget.scrollPadding) ,
        autofocus: widget.autofocus,
        focusNode: widget.focusNode,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        onTap: widget.onTap,
        readOnly: widget.readOnly,
        enabled: widget.enabled,
        minLines: widget.minLines,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        controller: widget.controller,
        keyboardType: widget.keyboardType,
        inputFormatters: [
          widget.filter ?? FilteringTextInputFormatter.deny(RegExp('[]')),
        ],
        style: TextStyle(

          fontFamily: widget.fontFamily,
          fontFamilyFallback: widget.fontFamilyFallBack,
          fontSize: widget.fontSize,
          fontStyle: widget.fontStyle,
          fontWeight: widget.fontWeight,
        ),

        decoration: InputDecoration(

          prefixIcon: Icon(
            widget.iconData,
            color: cmTextFieldIconColor,
          ),
          suffixIcon:widget.suffixIconData != null
              ? InkWell(
            borderRadius: BorderRadius.circular(100),
            onTap: (){
              if( widget.onSuffixIconTap!=null){
                widget.onSuffixIconTap!();
              }
              if(widget.type=="password"){
                setState((){
                  widget.obscureText=!widget.obscureText;
                });
              }
            },
            child: Icon(
              widget.suffixIconData,
              color: cmTextFieldIconColor,
            ),
          )
          :null,
          hintText: widget.hintText,
          hintStyle: TextStyle(color: widget.hintTextColor),
          labelText: widget.labelText,
          labelStyle: TextStyle(color: widget.labelTextColor),
          fillColor: widget.inputColor,
          filled: true,
          errorText: widget.error,
          errorMaxLines: 3,
          focusedErrorBorder: errorBorder,
          errorBorder: errorBorder,
          enabledBorder: border,
          focusedBorder: focusBorder,
          disabledBorder: disabledBorder,
        ),
      ),
    );
  }
}
