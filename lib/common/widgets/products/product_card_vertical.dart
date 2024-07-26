import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:ecommerce/common/widgets/icons/favourite_icon.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';
import 'package:ecommerce/common/widgets/texts/product_title.dart';
import 'package:ecommerce/common/widgets/texts/tbrand_title_with_verification.dart';
import 'package:ecommerce/features/shop/controllers/product_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/product_card_add_to_cart_button.dart';
import 'package:ecommerce/features/shop/screens/product_details/product_details.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TProductCardVertical extends StatelessWidget {
  const TProductCardVertical({super.key, required this.product});

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = ProductController.instance;
    final salePrct =
        controller.calculateSalePercentage(product.price, product.salePrice);

    return product.title.isEmpty
        ? const SizedBox.shrink()
        : GestureDetector(
            onTap: () => Get.to(() => ProductDetails(
                  product: product,
                )),
            child: Container(
              width: 180,
              padding: const EdgeInsets.all(1),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(TSizes.productImageRadius),
                  color: dark ? TColors.darkerGrey : TColors.white),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //thumbnail
                  TRoundedContainer(
                    height: 180,
                    padding: const EdgeInsets.all(TSizes.sm),
                    backgroundColor: dark ? TColors.dark : TColors.light,
                    child: Stack(children: [
                      TRoundedImage(
                        width: double.infinity,
                        backgroundColor: dark ? TColors.dark : TColors.light,
                        imageUrl: product.thumbnail,
                        isNetworkImage: true,
                        applyImageRadius: true,
                      ),
                      Positioned(
                        top: 10,
                        child: TRoundedContainer(
                          radius: TSizes.sm,
                          backgroundColor: TColors.secondary.withOpacity(0.8),
                          padding: const EdgeInsets.symmetric(
                              horizontal: TSizes.sm, vertical: TSizes.xs),
                          child: Text(
                            '$salePrct%',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .apply(color: TColors.black),
                          ),
                        ),
                      ),
                      //fav
                      Positioned(
                        top: 0,
                        right: 0,
                        child: TFavouriteIcon(
                          productId: product.id,
                        ),
                      ),
                    ]),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems / 2,
                  ),

                  //details
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.sm),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TProductTitleText(
                          title: product.title,
                          smallSize: true,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems / 2,
                        ),
                        TBrandTitleWithVerification(
                          title: product.brand!.name,
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (product.salePrice > 0)
                              Padding(
                                  padding:
                                      const EdgeInsets.only(left: TSizes.sm),
                                  child: Text(
                                    "\$${product.price}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .apply(
                                            decoration:
                                                TextDecoration.lineThrough),
                                  )),
                            Padding(
                              padding: const EdgeInsets.only(left: TSizes.sm),
                              child: TProductPriceText(
                                price: controller.getProductPrice(product),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ProductCardAddToCartButton(
                        product: product,
                      )
                    ],
                  )
                ],
              ),
            ),
          );
  }
}
