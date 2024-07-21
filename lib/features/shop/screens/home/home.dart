import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/category_image_text_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/search_container.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/cart_menu_icon.dart';
import 'package:ecommerce/common/widgets/products/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:ecommerce/features/shop/screens/sub_category/sub_category.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          TTexts.homeAppbarTitle,
                          style: Theme.of(context)
                              .textTheme
                              .labelMedium!
                              .apply(color: TColors.grey),
                        ),
                        Text(
                          TTexts.homeAppbarSubTitle,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .apply(color: TColors.white),
                        ),
                      ],
                    ),
                    actions: const [
                      TCartCounterIcon(
                        iconColor: TColors.white,
                      )
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSearchContainer(
                    text: "Search in store",
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: TSizes.defaultSpace),
                    child: Column(
                      children: [
                        const TSectionHeader(
                          title: 'Popular categories',
                          showActionButton: false,
                          textColor: TColors.white,
                        ),
                        const SizedBox(
                          height: TSizes.spaceBtwItems,
                        ),
                        SizedBox(
                          height: 90,
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: 6,
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (_, index) {
                                return TVerticalImageText(
                                  image: TImages.shoeIcon,
                                  title: 'Shoes',
                                  onTap: () =>
                                      Get.to(() => const SubCategoriesScreen()),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  )
                ],
              ),
            ),
            //body
            //categories
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TPromoSlider(
                    banners: [
                      TImages.promoBanner1,
                      TImages.promoBanner2,
                      TImages.promoBanner3,
                    ],
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  TSectionHeader(
                    title: 'Popular Products',
                    onPressed: () {},
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  TGridLayout(
                    itemCount: 4,
                    itemBuilder: (BuildContext, int) =>
                        const TProductCardVertical(),
                  )
                ],
              ),
            ),

            //products
          ],
        ),
      ),
    );
  }
}
