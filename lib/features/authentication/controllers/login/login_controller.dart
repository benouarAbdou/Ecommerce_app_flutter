import 'package:ecommerce/data/repositories/auth/auth_repo.dart';
import 'package:ecommerce/features/personalization/controllers/user_controller.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/network/networkManager.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();
  final hidePassword = true.obs;
  final rememberMe = false.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());

  @override
  void onInit() {
    // TODO: implement onInit
    email.text = localStorage.read("remember_email") ?? '';
    password.text = localStorage.read("remember_password") ?? '';
    super.onInit();
  }

  void loginEmailPassword() async {
    try {
      //domething
      TFullScreenLoader.openLoadingDialog(
          "Logging in", TImages.onBoardingImage1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'oops', message: "Check your internet connexion");
        return;
      }

      if (!loginFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      if (rememberMe.value) {
        localStorage.write("remember_email", email.text.trim());
        localStorage.write("remember_password", password.text.trim());
      }

      await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text, password.text);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.ScreenRedirect();
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      //something,
    }
  }

  Future<void> googleSignIn() async {
    try {
      TFullScreenLoader.openLoadingDialog(
          "Signing in", TImages.onBoardingImage1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();
        TLoaders.errorSnackBar(
            title: 'oops', message: "Check your internet connexion");
        return;
      }

      final userCredentials =
          await AuthenticationRepository.instance.signInWithGoogle();

      await userController.saveUserRecord(userCredentials);

      TFullScreenLoader.stopLoading();

      AuthenticationRepository.instance.ScreenRedirect();
    } catch (e) {
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      TFullScreenLoader.stopLoading();
    }
  }
}
