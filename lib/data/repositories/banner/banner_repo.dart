import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/exceptions/firebase_exceptions.dart';
import 'package:ecommerce/utils/exceptions/format_exceptions.dart';
import 'package:ecommerce/utils/exceptions/platform_exceptions.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BannerRepository extends GetxController {
  static BannerRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<List<BannerModel>> getAllBanners() async {
    try {
      final documentSnapshot = await _db
          .collection("Banners")
          .where('active', isEqualTo: true)
          .get();
      final list = documentSnapshot.docs
          .map((doc) => BannerModel.fromSnapshot(doc))
          .toList();
      return list;
    } on FirebaseException catch (e) {
      throw TFirebaseException(e.code).message;
    } on FormatException catch (_) {
      throw const TFormatException();
    } on PlatformException catch (e) {
      throw TPlatformException(e.code).message;
    } catch (e) {
      throw 'Something went wrong. Please try again';
    }
  }
}
