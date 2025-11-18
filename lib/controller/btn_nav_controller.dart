import 'package:get/get.dart';

class BtnNavController extends GetxController {
  // index bottom nav
  var currentIndex = 0.obs;

  // fungsi ganti tab
  void changeTab(int index) {
    currentIndex.value = index;
  }
}