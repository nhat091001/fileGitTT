import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/home_screen.dart';

import 'next1.dart';
import 'next2.dart';
import 'next3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => Next1()),
        GetPage(name: '/second', page: () => Next2()),
        GetPage(
            name: '/third', page: () => Next3(), transition: Transition.zoom),
      ],
      home: HomeScreen(),
    );
  }
}
