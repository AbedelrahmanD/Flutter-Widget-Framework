// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_widget_framework/helpers/utils/connecter.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_container.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text_field.dart';
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

  @override
  void initState() {
    super.initState();
    controller.text = "aa";
  }

  dynamic selectedOption = {};
  var isLoading = false;
  var isOpen = false;
  CmDropDownState d= CmDropDownState();
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
                openDialog: isOpen,
                showSpinner: isLoading,
                controller: controller,
                options: products,
                optionText: "title",
                // dialog:optionsList(),
                getInstance: (ob){
                  d=ob;
                },
                onSelect: (value) {
                  selectedOption = jsonDecode(value);
                },
                onSearch: (value)  {
                  print("searchedddd");
                  setState((){
                    products=[{"title":"zzzz","id":50}];
                  });
                  print(jsonEncode(products));
                },
                hintText: "Dropdown",
                labelText: "Dropdown",
              ),
              CmTextField(
                onChanged:(value) async{
                  var response=await Connector().sendRequest(url: "https://jsonplaceholder.typicode.com/todos");
                 setState((){
                   products=response.body;
                 });
                },
                // controller: controller,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
