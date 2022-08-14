// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_widget_framework/helpers/config.dart';
import 'package:flutter_widget_framework/helpers/utils/connector.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_button.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_cached_network_image.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_container.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_directionality.dart';
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
  List items = [];
  TextEditingController controller = TextEditingController();
  dynamic selectedOption = {};
  var isLoading = false;
  var isOpen = false;
  CmDropDownState dropDownInstance = CmDropDownState();

  searchOnline(value) async {
    dropDownInstance.showSpinner(true);

    var response = await Connector()
        .sendRequest(url: "https://jsonplaceholder.typicode.com/todos/$value");

    if (response.body != null) {
      dropDownInstance.updateOptions(response.body);
    }
    dropDownInstance.showSpinner(false);
  }

  changeDirectionality(){
    appDir.value=appDir.value=="ltr"?"rtl":"ltr";
  }
  @override
  void initState() {
    super.initState();
    dynamic map={"name":"formdata from flutter"};
    // FormData formdata = FormData(map);
    // Connector()
    //     .sendRequest(url: "http://192.168.0.122/php/api/",body: formdata);
  }

  @override
  Widget build(BuildContext context) {
    return CmDirectionality(
      child: Scaffold(

        
        appBar: AppBar(
          title:   const CmText(
            text: "Custom Widgets",
            fontWeight: FontWeight.bold,
            fontSize: 20, 
            color: Colors.white,
          )
        ),
        body: CmContainer(
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CmContainer(
                  marginBottom: 10,
                  marginTop: 10,
                  boxShadowColor: Colors.grey,
                  width: Get.width*0.9,
                  borderRadiusAll: 5,
                  isClipHardEdge: true,
                  child: const CmCachedNetworkImage(
                      openOnTap: true,
                      url: "https://raw.githubusercontent.com/jonataslaw/getx-community/master/get.png"),
                ),
                CmTextField(
                  iconData: Icons.verified_user,
                  isUnderLineBorder: true,
                  error: "Required",
                  hintText: "TextField",
                ),
                CmTextField(
                  iconData: Icons.person,
                  hintText: "Enter Your Name",
                  labelText: "Name",

                ),
                CmTextField(
                  iconData: Icons.lock,
                  hintText: "Enter Your Password",
                  labelText: "Password",
                  type:"password",
                  obscureText: true,
                ),
                CmTextField(
                  iconData: Icons.email,
                  hintText: "Enter Your Email",
                  labelText: "Email",
                  type:"email",
                ),
                CmDropDown(
                  iconData: Icons.opacity,
                  hintText: "Dropdown",
                  labelText: "Dropdown",
                  controller: controller,
                  options: items,
                  optionText: "title",
                  optionId: "id",
                  selectedOptionId: "2",
                  getInstance: (obj) {
                    dropDownInstance = obj;
                  },
                  onSelect: (value) {
                    selectedOption = jsonDecode(value);
                  },
                  onOpen: () async {
                    searchOnline("");
                  },
                  onSearch: (value) async {
                    searchOnline(value);
                  },
                ),
                CmButton(
                    backgroundColor: Colors.blueAccent,
                    onPressed: () => dropDownInstance.openDialog(),
                    child: const CmText(
                      text: "OPEN DIALOG",
                      color: Colors.white,
                    )),
                CmButton(
                    backgroundColor: Colors.pink,
                    onPressed: () => changeDirectionality(),
                    child: const CmText(
                      text: "Change Directionality",
                      color: Colors.white,
                    )),


              ],
            ),
          ),
        ),
      ),
    );
  }
}
