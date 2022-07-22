// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_framework/helpers/utils/connector.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_button.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_container.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text.dart';
import 'package:get/get.dart';
import 'helpers/widgets/cm_drop_down.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List products = [
    {
      "id": 1,
      "title": "pro1",
    },
    {
      "id": 2,
      "title": "pro2",
    }
  ];
  TextEditingController controller = TextEditingController();
  dynamic selectedOption = {};
  var isLoading = false;
  var isOpen = false;
  CmDropDownState d = CmDropDownState();

  searchOnline(value) async {
    setState(() {
      isLoading = true;
    });

    var response = await Connector()
        .sendRequest(url: "https://jsonplaceholder.typicode.com/todos/$value");
    if (response != null) {
      d.updateOptions([response.body]);
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: CmContainer(
        width: Get.width,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CmDropDown(
                hintText: "Dropdown",
                labelText: "Dropdown",
                controller: controller,
                options: products,
                optionText: "title",
                optionId:"id",
                selectedOptionId:"2",
                showSpinner: isLoading,
                // selectedColor: Colors.red,
                getInstance: (ob) {
                  d = ob;
                },
                onSelect: (value) {
                  selectedOption = jsonDecode(value);
                },
                onSearch: (value) async {
                  await searchOnline(value);
                },
              ),
              CmButton(
                backgroundColor: Colors.blueAccent,
                  onPressed: () => d.openDialog(),
                  child: const CmText(
                    text: "OPEN DIALOG",
                    color: Colors.white,
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
