import 'package:get/get.dart';

class HomeController extends GetxController {
  static HomeController get instance => Get.find();
  Rx<int> currentCarousalIndex = 0.obs;
  void updateCarousalIndicator(index) {
    currentCarousalIndex.value = index;
  }
}
