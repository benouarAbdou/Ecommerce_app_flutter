import 'package:ecommerce/data/repositories/auth/auth_repo.dart';
import 'package:ecommerce/data/repositories/user/user_repo.dart';
import 'package:ecommerce/features/authentication/models/user.dart';
import 'package:ecommerce/features/authentication/screens/signup/verify_email.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/network/networkManager.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  static SignupController get instance => Get.find();
  final hidePassword = true.obs;
  final privacyPolicy = false.obs;
  final email = TextEditingController();
  final lastName = TextEditingController();
  final firstName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final phoneNumber = TextEditingController();
  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  void signup() async {
    try {
      //domething
      TFullScreenLoader.openLoadingDialog(
          "We are processing your informations", TImages.onBoardingImage1);

      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        TFullScreenLoader.stopLoading();

        return;
      }

      if (!signupFormKey.currentState!.validate()) {
        TFullScreenLoader.stopLoading();

        return;
      }

      if (!privacyPolicy.value) {
        TLoaders.warningSnackBar(
            title: "Accept privacy policy",
            message: "please accept our privacy policy");
        TFullScreenLoader.stopLoading();

        return;
      }

      final userCred = await AuthenticationRepository.instance
          .registerWithEmailAndPassword(email.text, password.text);

      final newUser = UserModel(
          id: userCred.user!.uid,
          firstName: firstName.text.trim(),
          lastName: lastName.text.trim(),
          username: userName.text.trim(),
          email: email.text.trim(),
          phoneNumber: phoneNumber.text.trim(),
          profilePicture: '');

      final userRepo = Get.put(UserRepository());
      await userRepo.saveUserRecord(newUser);

      TFullScreenLoader.stopLoading();

      Get.to(() => VerifyEmailScreen(
            email: email.text.trim(),
          ));
    } catch (e) {
      TFullScreenLoader.stopLoading();
      TLoaders.errorSnackBar(title: 'Oh snap', message: e.toString());
      //something,
    }
  }
}
