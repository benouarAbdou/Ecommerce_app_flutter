import 'package:ecommerce/features/authentication/controllers/onboarding_controller.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboading_page.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_navigation.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_nextbutton.dart';
import 'package:ecommerce/features/authentication/screens/onboarding/widgets/onboarding_skip.dart';

import 'package:ecommerce/utils/constants/image_strings.dart';

import 'package:ecommerce/utils/constants/text_strings.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(OnBoardingController());
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnBoardingPage(
                title: TTexts.onBoardingSubTitle1,
                subtitle: TTexts.onBoardingTitle1,
                image: TImages.onBoardingImage1,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingSubTitle2,
                subtitle: TTexts.onBoardingTitle2,
                image: TImages.onBoardingImage2,
              ),
              OnBoardingPage(
                title: TTexts.onBoardingSubTitle3,
                subtitle: TTexts.onBoardingTitle3,
                image: TImages.onBoardingImage3,
              )
            ],
          ),
          const OnBoardingSkip(),
          const OnBoardingNavigation(),
          const OnBoardingNextButton()
        ],
      ),
    );
  }
}
