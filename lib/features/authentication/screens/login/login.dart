import 'package:ecommerce/common/styles/spacing_styles.dart';
import 'package:ecommerce/common/styles/widgets/login_signup/form_divider.dart';
import 'package:ecommerce/common/styles/widgets/login_signup/socials_buttons.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_form.dart';
import 'package:ecommerce/features/authentication/screens/login/widgets/login_header.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: TspacingStyle.paddingWithAppBarHeight,
          child: Column(
            children: [
              //logo

              LoginHeader(dark: dark),

              const LoginForm(),
              TFormDivider(
                dark: dark,
                dividerText: TTexts.orSignInWith,
              ),

              const SizedBox(
                height: TSizes.spaceBtwSections,
              ),

              const TSocialsButtons()
            ],
          ),
        ),
      ),
    );
  }
}