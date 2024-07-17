import 'package:ecommerce/common/styles/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/common/styles/widgets/login_signup/socials_buttons.dart';
import 'package:ecommerce/features/authentication/screens/signup/widgets/signup_form.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                TTexts.signupTitle,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              //form
              const TSignupForm(),
              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
              TFormDivider(dark: dark, dividerText: TTexts.orSignUpWith),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              const TSocialsButtons()
            ],
          ),
        ),
      ),
    );
  }
}
