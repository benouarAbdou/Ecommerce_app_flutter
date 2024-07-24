import 'package:cached_network_image/cached_network_image.dart';
import 'package:capped_progress_indicator/capped_progress_indicator.dart';
import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
import 'package:ecommerce/common/widgets/icons/tcircular_icon.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TProductImageSlider extends StatelessWidget {
  const TProductImageSlider({
    super.key,
    required this.product,
  });

  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);

    return TCurvedEdgeWidget(
      child: Container(
        color: dark ? TColors.darkGrey : TColors.light,
        child: Stack(
          children: [
            SizedBox(
              height: 400,
              child: Padding(
                padding: const EdgeInsets.all(TSizes.productImageRadius * 2),
                child: Center(
                    child: CachedNetworkImage(
                  imageUrl: product.thumbnail,
                  progressIndicatorBuilder: (context, url, progress) =>
                      CircularCappedProgressIndicator(
                    value: progress.progress,
                    color: TColors.primary,
                  ),
                )),
              ),
            ),
            /*Positioned(
              right: 0,
              bottom: 30,
              left: TSizes.defaultSpace,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, int index) => TRoundedImage(
                    imageUrl: TImages.productImage8,
                    width: 80,
                    backgroundColor: dark ? TColors.dark : TColors.white,
                    padding: const EdgeInsets.all(TSizes.sm),
                    border: Border.all(color: TColors.primary),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(
                    width: TSizes.spaceBtwItems,
                  ),
                  itemCount: 6,
                ),
              ),
            ),*/
            const TAppBar(
              showBackArrow: true,
              actions: [
                TCircularIcon(
                  icon: Iconsax.heart,
                  color: Colors.red,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
