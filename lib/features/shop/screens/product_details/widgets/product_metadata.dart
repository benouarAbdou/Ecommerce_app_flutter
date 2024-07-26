import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tcircular_image.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';
import 'package:ecommerce/common/widgets/texts/product_title.dart';
import 'package:ecommerce/common/widgets/texts/tbrand_title_with_verification.dart';
import 'package:ecommerce/features/shop/controllers/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/enums.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import 'package:ecommerce/utils/constants/colors.dart';

class ProductMetaData extends StatelessWidget {
  const ProductMetaData({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePrct =
        controller.calculateSalePercentage(product.price, product.salePrice);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //price
        Row(
          children: [
            salePrct == null
                ? const SizedBox.shrink()
                : TRoundedContainer(
                    radius: TSizes.sm,
                    backgroundColor: TColors.secondary.withOpacity(0.8),
                    padding: const EdgeInsets.symmetric(
                        horizontal: TSizes.sm, vertical: TSizes.xs),
                    child: Text(
                      '$salePrct%',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .apply(color: TColors.black),
                    ),
                  ),
            SizedBox(
              width: salePrct == null ? 0 : TSizes.spaceBtwItems,
            ),
            salePrct == null
                ? TProductPriceText(
                    price: "${product.price}",
                    isLarge: true,
                  )
                : Row(
                    children: [
                      Text(
                        "\$${product.price}",
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .apply(decoration: TextDecoration.lineThrough),
                      ),
                      const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                      TProductPriceText(
                        price: "${product.salePrice}",
                        isLarge: true,
                      )
                    ],
                  ),
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //title
        TProductTitleText(title: product.title),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),
        //stockstaus

        Row(
          children: [
            const TProductTitleText(title: "Status"),
            const SizedBox(
              width: TSizes.spaceBtwItems,
            ),
            Text(
              controller.getProductStockStatus(product.stock),
              style: Theme.of(context).textTheme.titleMedium,
            )
          ],
        ),
        const SizedBox(
          height: TSizes.spaceBtwItems / 1.5,
        ),

        //brand

        Row(
          children: [
            TCircularImage(
              image: product.brand != null ? product.brand!.image : '',
              height: 32,
              width: 32,
              isNetworkImage: false,
              overlayColor: dark ? TColors.white : TColors.black,
            ),
            TBrandTitleWithVerification(
              title: product.brand!.name,
              brandTextSizes: TextSizes.medium,
            )
          ],
        )
      ],
    );
  }
}
