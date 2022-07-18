// ignore_for_file: depend_on_referenced_packages

import 'package:get/get.dart';
class Controller extends GetxController{
  var counter=0.obs;
  setCount(){
    counter(counter.value++);
    update();
  }
}