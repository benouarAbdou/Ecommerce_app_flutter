import 'package:ecommerce/data/repositories/auth/auth_repo.dart';
import 'package:ecommerce/features/authentication/screens/password_configuartion/reset_password.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/network/networkManager.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPasswordController extends GetxController {
  static ForgetPasswordController get instance => Get.find();

  final email = TextEditingController();
  GlobalKey<FormState> forgetPasswordKey = GlobalKey<FormState>();

  sendPasswordResetEmail() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing your request", TImages.onBoardingImage1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'oops', message: "Check your internet connexion");
        return;
      }

      if (!forgetPasswordKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      await AuthenticationRepository.instance
          .sendPasswordResetEmail(email.text.trim());
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'yay', message: "Link sent to your email");

      Get.to(() => ResetPassword(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }

  resendPasswordResetEmail(String email) async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Processing your request", TImages.onBoardingImage1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'oops', message: "Check your internet connexion");
        return;
      }

      await AuthenticationRepository.instance.sendPasswordResetEmail(email);
      TFullScreenLoader.stopLoading();

      TLoaders.successSnackBar(
          title: 'yay', message: "Link sent to your email");
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
    }
  }
}
