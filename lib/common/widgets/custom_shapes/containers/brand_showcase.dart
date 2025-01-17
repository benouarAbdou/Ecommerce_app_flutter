import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tbrand_card.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/screens/all_brands/brand_products.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBrandShowCase extends StatelessWidget {
  const TBrandShowCase({
    super.key,
    required this.images,
    required this.brand,
  });

  final List<String> images;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.to(() => BrandProducts(brand: brand)),
      child: TRoundedContainer(
        padding: const EdgeInsets.all(TSizes.md),
        showBorder: true,
        borderColor: TColors.darkGrey,
        backgroundColor: Colors.transparent,
        margin: const EdgeInsets.only(bottom: TSizes.spaceBtwItems),
        child: Column(
          children: [
            TBrandCard(
              showBorder: false,
              brand: brand,
            ),
            Row(
                children: images
                    .map((e) => brandTopProductImageWidget(e, context))
                    .toList())
          ],
        ),
      ),
    );
  }

  Widget brandTopProductImageWidget(String image, context) {
    return Expanded(
      child: TRoundedContainer(
        height: 100,
        backgroundColor: THelperFunctions.isDarkMode(context)
            ? TColors.darkGrey
            : TColors.light,
        margin: const EdgeInsets.only(right: TSizes.sm),
        padding: const EdgeInsets.all(TSizes.sm),
        child: CachedNetworkImage(imageUrl: image),
      ),
    );
  }
}
