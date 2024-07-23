import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:ecommerce/common/widgets/effects/shimmer_effect.dart';
import 'package:ecommerce/features/shop/controllers/banner_controller.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TPromoSlider extends StatelessWidget {
  const TPromoSlider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(BannerController());
    return Obx(() {
      if (controller.isLoading.value) {
        return const TShimmerEffect(width: double.infinity, height: 190);
      }
      if (controller.allBanners.isEmpty) {
        return const Center(
          child: Text("No banner found"),
        );
      } else {
        return Column(
          children: [
            CarouselSlider(
              items: controller.allBanners
                  .map((banner) => TRoundedImage(
                        imageUrl: banner.imageUrl,
                        isNetworkImage: true,
                        //onPressed: () => Get.toNamed(banner.targetScreen),
                      ))
                  .toList(),
              options: CarouselOptions(
                viewportFraction: 1,
                onPageChanged: (index, reason) =>
                    controller.updateCarousalIndicator(index),
              ),
            ),
            const SizedBox(
              height: TSizes.spaceBtwItems,
            ),
            Center(
              child: Obx(
                () => Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    for (int i = 0; i < controller.allBanners.length; i++)
                      TRoundedContainer(
                        width: 20,
                        height: 4,
                        margin: const EdgeInsets.only(right: 10),
                        backgroundColor:
                            controller.currentCarousalIndex.value == i
                                ? TColors.primary
                                : TColors.grey,
                      ),
                  ],
                ),
              ),
            )
          ],
        );
      }
    });
  }
}
