// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_container.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_directionality.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_positioned.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text_field.dart';
import 'package:get/get.dart';
import '../config.dart';

// ignore: must_be_immutable
class CmDropDown extends StatefulWidget {
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
  List options;
  String optionText;

  bool showSpinner;
  bool openDialog;
  final void Function(String)? onSearch;
  final void Function(String)? onSelect;
  final void Function(CmDropDownState)? getInstance;
  final FocusNode? focusNode;
  bool autofocus;
  Widget? dialog;

  CmDropDown(
      {Key? key,
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
      required this.options,
      required this.optionText,
      this.onSelect,
      this.onSearch,
      this.showSpinner = false,
      this.openDialog = false,
      this.getInstance,
      this.focusNode,
      this.autofocus = false,
      this.dialog})
      : super(key: key);

  @override
  State<CmDropDown> createState() => CmDropDownState();
}

class CmDropDownState extends State<CmDropDown> {
  filterOptions(value) async {
    if (widget.onSearch != null) {
      widget.onSearch!(value);
    }

    if (value.trim() == "") {
      widget.options = widget.options;
      return;
    }

    List filteredOptions = [];
    for (dynamic option in widget.options) {
      print("${option[widget.optionText]} === ${value.toString()}");
      if (option[widget.optionText]
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        filteredOptions.add(option);
      }
    }

    setState((){
      widget.options = filteredOptions;
    });
  }

  onCompleteBuild() async {
    await Future.delayed(const Duration(milliseconds: 400));
    widget.getInstance!(this);
    if (widget.openDialog) {
      openDialog();
    }
  }

  @override
  void initState() {
    super.initState();
    onCompleteBuild();
  }



  searchDialog() {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: SafeArea(
        child: CmContainer(
            color: Colors.transparent,
            paddingAll: 20,
            child: Center(
              child: Stack(
                children: [
                  CmContainer(
                    color: Colors.white,
                    borderRadiusAll: 5,
                    child: Column(
                      children: [
                        CmContainer(
                            paddingAll: 10,
                            child: CmTextField(
                              autofocus: true,
                              labelText: "Search...",
                              onChanged: (value) => filterOptions(value),
                            )),
                        CmDirectionality(
                          child: SingleChildScrollView(
                            child: CmContainer(
                              width: Get.width,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  if (widget.showSpinner)
                                    Center(
                                      child: CmContainer(
                                          paddingAll: 5,
                                          child:
                                              const CircularProgressIndicator()),
                                    ),
                                  if (widget.dialog == null)
                                    for (dynamic option in widget.options)
                                      InkWell(
                                        onTap: () {
                                          widget.controller?.text =
                                              option[widget.optionText];
                                          widget.onSelect!(jsonEncode(option));
                                          Get.back();
                                        },
                                        child: CmContainer(
                                            width: Get.width,
                                            paddingAll: 15,
                                            borderWidthBottom: 1,
                                            borderColor: Colors.grey,
                                            color: widget.controller!.text ==
                                                    option[widget.optionText]
                                                ? Colors.blueAccent
                                                    .withOpacity(0.5)
                                                : Colors.white,
                                            child: CmText(
                                                text:
                                                    option[widget.optionText])),
                                      ),
                                  if (widget.dialog != null)
                                    widget.dialog ?? const SizedBox()
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  CmPositioned(
                      bottom: 5,
                      end: 5,
                      child: CmContainer(
                        color: Colors.white,
                        boxShadowColor: Colors.grey,
                        borderRadiusAll: 5,
                        child: IconButton(
                            onPressed: () => Get.back(),
                            icon: const Icon(Icons.close)),
                      ))
                ],
              ),
            )),
      ),
    );
  }

  openDialog() {
    Get.dialog(searchDialog());
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CmTextField(
          autofocus: widget.autofocus,
          enabled: widget.enabled,
          borderColor: widget.borderColor,
          borderRadius: widget.borderRadius,
          width: widget.width,
          hintText: widget.hintText,
          hintTextColor: widget.hintTextColor,
          inputColor: widget.inputColor,
          marginBottom: widget.marginBottom,
          marginTop: widget.marginTop,
          filter: widget.filter,
          obscureText: widget.obscureText,
          error: widget.error,
          key: widget.key,
          keyboardType: widget.keyboardType,
          labelTextColor: widget.labelTextColor,
          maxLines: widget.maxLines,
          minLines: widget.maxLines,
          iconData: widget.iconData,
          onChanged: widget.onSelect,
          readOnly: true,
          controller: widget.controller,
          onTap: () => openDialog(),
          labelText: "Dropdown",
          suffixIconData: Icons.arrow_drop_down,
        ),
        CmText(text: widget.options.length.toString())
      ],
    );
  }
}
