import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:ecommerce/common/widgets/products/product_card_horizontal.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Sports',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              //banner
              const TRoundedImage(
                imageUrl: TImages.promoBanner2,
                width: double.infinity,
                applyImageRadius: true,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              Column(
                children: [
                  TSectionHeader(
                    title: "Sports shirts",
                    onPressed: () {},
                  ),
                  const SizedBox(height: TSizes.spaceBtwItems / 2),
                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          const TProductCardHorizontal(),
                      separatorBuilder: (context, index) => const SizedBox(
                        width: TSizes.spaceBtwItems,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
