import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_getx/controllers/my_home_page_controller.dart';

class AboutPage extends StatelessWidget {
  final MyHomePageController controller = Get.put(MyHomePageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AboutPage'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Text(
                      'GetX is an extra-light and powerful solution for Flutter. It combines high performance state management, intelligent dependency injection, and route management in a quick and practical way.'),
                  ElevatedButton(
                      onPressed: () {
                        Get.back();
                      },
                      child: Text('Back'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
