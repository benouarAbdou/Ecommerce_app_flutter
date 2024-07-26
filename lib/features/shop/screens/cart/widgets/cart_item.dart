import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:ecommerce/common/widgets/texts/product_title.dart';
import 'package:ecommerce/common/widgets/texts/tbrand_title_with_verification.dart';
import 'package:ecommerce/features/shop/models/cart_item_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class TCartItem extends StatelessWidget {
  const TCartItem({
    super.key,
    required this.cartItem,
  });

  final CartItemModel cartItem;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TRoundedImage(
          imageUrl: cartItem.image!,
          width: 60,
          height: 60,
          isNetworkImage: true,
          padding: const EdgeInsets.all(TSizes.sm),
          backgroundColor: THelperFunctions.isDarkMode(context)
              ? TColors.darkerGrey
              : TColors.light,
        ),
        const SizedBox(
          width: TSizes.spaceBtwItems,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TBrandTitleWithVerification(title: cartItem.brandName!),
            Flexible(
              child: TProductTitleText(
                title: cartItem.title,
                maxLines: 1,
              ),
            ),
            /*Text.rich(TextSpan(children: [
              TextSpan(
                text: "Color ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "Green ",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              TextSpan(
                text: "Size ",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              TextSpan(
                text: "UK 08 ",
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ]))*/
          ],
        )
      ],
    );
  }
}
