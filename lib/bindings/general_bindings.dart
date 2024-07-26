import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/utils/network/networkManager.dart';
import 'package:get/get.dart';

class GeneralBindings extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(NetworkManager());
    Get.put(AddressController());
  }
}
