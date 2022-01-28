import 'package:get/get.dart';
import 'package:flutter/material.dart';

class MyHomePageController extends GetxController {
  final count = 0.obs;
  increment() => count.value++;
  void increment2() {
    count.value++;
    update();
  }
}
