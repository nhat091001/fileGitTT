import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:demo_getx/controllers/my_home_page_controller.dart';

import 'about_page.dart';

class MyHomePage extends StatelessWidget {
  final String title;
  final MyHomePageController controller = Get.put(MyHomePageController());
  MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text('${controller.count}')),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            GetBuilder(
              init: MyHomePageController(),
              builder: (_) => Text('${controller.count}'),
            ),
            Obx(
              () => Text(
                "${controller.count.value}",
                style: Theme.of(context).textTheme.headline4,
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('About GetX'),
                onPressed: () {
                  //dùng get.off người dùng không thể back lại về được
                  Get.to(AboutPage());
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Snackbar'),
                onPressed: () {
                  Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar');
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Snackbar bottom'),
                onPressed: () {
                  Get.snackbar('GetX Snackbar', 'Yay! Awesome GetX Snackbar',
                      snackPosition: SnackPosition.BOTTOM,
                      backgroundColor: Colors.orange);
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Show AlertDialog'),
                onPressed: () {
                  Get.defaultDialog(
                      title: 'GetX Alert',
                      middleText: 'Simple GetX alert',
                      textConfirm: 'Okay',
                      confirmTextColor: Colors.amberAccent,
                      textCancel: 'Cancel');
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Show snackbar222'),
                onPressed: () {
                  Get.bottomSheet(Container(
                    child: Wrap(
                      children: <Widget>[
                        ListTile(
                            leading: Icon(Icons.music_note),
                            title: Text('Music'),
                            onTap: () {}),
                        ListTile(
                          leading: Icon(Icons.videocam),
                          title: Text('Video'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ));
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
          controller.increment2();
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
