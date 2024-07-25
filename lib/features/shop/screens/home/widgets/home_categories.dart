import 'package:ecommerce/common/widgets/custom_shapes/containers/category_image_text_container.dart';
import 'package:ecommerce/common/widgets/effects/shimmer_effect.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class THomeCategories extends StatelessWidget {
  const THomeCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(CategoryController());
    return Obx(() {
      if (controller.isLoading.value) {
        return SizedBox(
          height: 90,
          child: Row(
            children: List.generate(4, (index) {
              return const Row(
                children: [
                  Column(
                    children: [
                      TShimmerEffect(
                        width: 55,
                        height: 55,
                        radius: 55,
                      ),
                      SizedBox(
                        height: TSizes.spaceBtwItems / 2,
                      ),
                      TShimmerEffect(width: 55, height: 8),
                    ],
                  ),
                  SizedBox(width: TSizes.spaceBtwItems),
                ],
              );
            }),
          ),
        );
      }
      if (controller.featuredCategories.isEmpty) {
        return Center(
          child: Text(
            "No data for now",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .apply(color: TColors.white),
          ),
        );
      }
      return SizedBox(
        height: 90,
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: controller.featuredCategories.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (_, index) {
            final category = controller.featuredCategories[index];
            return TVerticalImageText(
                image: category.image,
                title: category.name,
                onTap: () => Get.to(() => SubCategoriesScreen(
                      category: category,
                    )));
          },
        ),
      );
    });
  }
}
