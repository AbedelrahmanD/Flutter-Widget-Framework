import 'package:flutter/material.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_container.dart';
import 'package:flutter_widget_framework/helpers/widgets/cm_text_field.dart';
class Compare extends StatefulWidget {
  const Compare({Key? key}) : super(key: key);

  @override
  State<Compare> createState() => _CompareState();
}

class _CompareState extends State<Compare> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child:Center(
          child: Column(
            children: [


              CmContainer(
                paddingAll: 15,
                child: CmTextField(
                  iconData: Icons.person,
                  hintText: "Enter Your Name",
                  labelText: "Name",
                ),
              ),





















              Container(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(
                      Icons.person,
                      color: Colors.blueAccent,
                    ),
                    hintText: "Enter Your Name",
                    labelText: "Name",
                    fillColor: Colors.white,
                    filled: true,
                    focusedErrorBorder:   OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    errorBorder:   OutlineInputBorder(
                      borderSide: const BorderSide(color: Colors.red, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide:const  BorderSide(color: Colors.grey, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),
                    focusedBorder:  OutlineInputBorder(
                      borderSide:const BorderSide(color: Colors.blueAccent, width: 1.0),
                      borderRadius: BorderRadius.circular(100),
                    ),

                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
