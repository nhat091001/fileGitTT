import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:testgetx/main.dart';

import 'controller.dart';
import 'package:testgetx/controller.dart';

import 'controller.dart';
import 'next1.dart';
import 'next2.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Khởi tạo lớp của bạn bằng Get.put () để cung cấp nó cho tất cả các tuyến "con" ở đó.
    final Controller _c = Get.put(Controller());
    return Scaffold(
      //Sử dụng Obx (() => để cập nhật Text () bất cứ khi nào số lượng được thay đổi.
      appBar: AppBar(title: Obx(() => Text("Clicks: ${_c.count}"))),
      // Thay thế 8 dòng Navigator.push bằng một Get.to () đơn giản. Bạn không cần bối cảnh
      body: Center(
        child: ElevatedButton(
          child: Text('Go to Other'),
          onPressed: () {
            Get.to(Other());
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          _c.increment();
        },
      ),
    );
  }
}

class Other extends StatelessWidget {
  // Bạn có thể yêu cầu Get tìm Bộ điều khiển đang được sử dụng bởi một trang khác và chuyển hướng bạn đến nó.
  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    // Truy cập biến đếm đã cập nhật
    return Scaffold(
      appBar: AppBar(
        title: Obx(() => Text("${c.name}")),
      ),
      body: Center(
        child: Column(
          children: [
            Container(child: Text("${c.count}")),
            Container(
              child: ElevatedButton(
                child: Text('NextScreen'),
                onPressed: () {
                  Get.to(Next1());
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Get.back()'),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Get.off'),
                onPressed: () {
                  Get.off(Next2());
                },
              ),
            ),
            Container(
              child: ElevatedButton(
                child: Text('Get.toNamed'),
                onPressed: () {
                  Get.toNamed("/third", arguments: 'đây là dữ liệu được gửi');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
