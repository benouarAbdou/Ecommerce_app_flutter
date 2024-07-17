import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class TSocialsButtons extends StatelessWidget {
  const TSocialsButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: TColors.grey,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
                height: TSizes.iconMd,
                width: TSizes.iconMd,
                image: AssetImage(TImages.google)),
            onPressed: () {},
          ),
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Container(
          decoration: BoxDecoration(
              border: Border.all(
                color: TColors.grey,
              ),
              borderRadius: BorderRadius.circular(100)),
          child: IconButton(
            icon: const Image(
                height: TSizes.iconMd,
                width: TSizes.iconMd,
                image: AssetImage(TImages.facebook)),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
