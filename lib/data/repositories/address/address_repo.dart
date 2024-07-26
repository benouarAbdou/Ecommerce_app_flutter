import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/data/repositories/auth/auth_repo.dart';
import 'package:ecommerce/features/personalization/models/address_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class AddressRepository extends GetxController {
  static AddressRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<AddressModel>> fetchUserAddresses() async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      if (userId.isEmpty) print("unable to find user info");

      final result = await _db
          .collection("Users")
          .doc(userId)
          .collection('Addresses')
          .get();
      return result.docs
          .map((e) => AddressModel.fromDocumentSnapshot(e))
          .toList();
    } catch (e) {
      TLoaders.errorSnackBar(title: "oops", message: e.toString());

      throw "yooo";
    }
  }

  Future<void> updateSelectedField(String addressId, bool selected) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      await _db
          .collection('Users')
          .doc(userId)
          .collection("Addresses")
          .doc(addressId)
          .update({'SelectedAddress': selected});
    } catch (e) {
      TLoaders.errorSnackBar(title: "oops", message: e.toString());

      throw "yooo";
    }
  }

  Future<String> addAddress(AddressModel address) async {
    try {
      final userId = AuthenticationRepository.instance.authUser!.uid;
      final curreentAddress = await _db
          .collection('Users')
          .doc(userId)
          .collection("Addresses")
          .add(address.toJson());
      return curreentAddress.id;
    } catch (e) {
      TLoaders.errorSnackBar(title: "oops", message: e.toString());

      throw "yooo";
    }
  }
}
