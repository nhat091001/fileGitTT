import 'package:get/get.dart';

class Controller extends GetxController {
//có thể làm cho bất kỳ biến nào có thể quan sát được đơn giản bằng cách sử dụng ".obs".
  var count = 0.obs;
  var name = 'Nhat'.obs;

//hàm function
  increment() => count++;
}
