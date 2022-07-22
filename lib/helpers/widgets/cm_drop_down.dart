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
  TextEditingController controller;
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
  String? selectedOptionId;
  String optionId;
  bool showSpinner;
  Color spinnerColor;
  Color spinnerBackground;
  bool openDialog;
  final void Function(String)? onSearch;
  final void Function(String)? onSelect;
  final void Function(CmDropDownState)? getInstance;
  final FocusNode? focusNode;
  bool autofocus;
  Color selectedColor;
  String searchText;

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
      required this.controller,
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
      required this.optionId,
      this.selectedOptionId,
      this.onSelect,
      this.onSearch,
      this.showSpinner = false,
      this.spinnerColor = Colors.blueAccent,
      this.spinnerBackground = Colors.white,
      this.openDialog = false,
      this.getInstance,
      this.focusNode,
      this.autofocus = false,
      this.selectedColor = Colors.blueGrey,
      this.searchText = "Search..."})
      : super(key: key);

  @override
  State<CmDropDown> createState() => CmDropDownState();
}

class CmDropDownState extends State<CmDropDown> {
  var options = [].obs;

  updateOptions(newOptions) {
    widget.options = newOptions;
    options.value = newOptions;
  }

  filterOptions(value) async {
    if (widget.onSearch != null) {
      widget.onSearch!(value);
    }

    options.value = widget.options;
    if (value.trim() == "") {
      return;
    }

    List filteredOptions = [];
    for (dynamic option in options) {
      if (option[widget.optionText]
          .toString()
          .toLowerCase()
          .contains(value.toString().toLowerCase())) {
        filteredOptions.add(option);
      }
    }

    options.value = filteredOptions;
  }

  onCompleteBuild() async {
    options.value = widget.options;
    if (widget.selectedOptionId != null) {
      for (dynamic option in widget.options) {
        if (option[widget.optionId].toString() == widget.selectedOptionId.toString()) {
          widget.controller.text = option[widget.optionText];

        }
      }
    }
    await Future.delayed(const Duration(milliseconds: 400));
    widget.getInstance!(this);
    if (widget.openDialog) {
      openDialog();
    }
  }

  openDialog() {
    Get.dialog(Scaffold(
      resizeToAvoidBottomInset: false,
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
                              labelText: widget.searchText,
                              onChanged: (value) => filterOptions(value),
                            )),
                        CmDirectionality(
                          child: Obx(() => CmContainer(
                                width: Get.width,
                                height:
                                    MediaQuery.of(context).viewInsets.bottom ==
                                            0.0
                                        ? Get.height * 0.7
                                        : Get.height * 0.2,
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      if (widget.showSpinner)
                                        Center(
                                          child: CmContainer(
                                              paddingAll: 5,
                                              child: CircularProgressIndicator(
                                                color: widget.spinnerColor,
                                                backgroundColor:
                                                    widget.spinnerBackground,
                                              )),
                                        ),
                                      for (dynamic option in options)
                                        InkWell(
                                          onTap: () {
                                            widget.controller.text =
                                                option[widget.optionText];
                                            widget
                                                .onSelect!(jsonEncode(option));
                                            Get.back();
                                          },
                                          child: CmContainer(
                                              width: Get.width,
                                              paddingAll: 15,
                                              borderWidthBottom: 1,
                                              borderColor: Colors.grey,
                                              color: widget.controller.text ==
                                                      option[widget.optionText]
                                                  ? widget.selectedColor
                                                      .withOpacity(0.5)
                                                  : Colors.white,
                                              child: CmText(
                                                  text: option[
                                                      widget.optionText])),
                                        )
                                    ],
                                  ),
                                ),
                              )),
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
    ));
  }

  @override
  void initState() {
    super.initState();
    onCompleteBuild();
  }

  @override
  Widget build(BuildContext context) {
    return CmTextField(
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
    );
  }
}
