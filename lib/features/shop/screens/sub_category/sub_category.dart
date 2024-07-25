import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_image_container.dart';
import 'package:ecommerce/common/widgets/products/product_card_horizontal.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          category.name,
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
              FutureBuilder(
                  future: controller.getSubCategories(category.id),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const Center(
                          child: CircularProgressIndicator(),
                        ));
                    if (widget != null) return widget;

                    final subCategories = snapshot.data!;
                    return ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: subCategories.length,
                        itemBuilder: (context, index) {
                          final subCategory = subCategories[index];
                          return FutureBuilder(
                              future: controller.getCategoryProducts(
                                  categoryId: subCategory.id),
                              builder: (context, snapshot) {
                                final widget =
                                    TCloudHelperFunctions.checkMultiRecordState(
                                        snapshot: snapshot,
                                        loader: const Center(
                                          child: CircularProgressIndicator(),
                                        ));
                                if (widget != null) return widget;

                                final products = snapshot.data!;
                                return Column(
                                  children: [
                                    TSectionHeader(
                                      title: subCategory.name,
                                      onPressed: () => Get.to(() => AllProducts(
                                            title: subCategory.name,
                                            futureMethod:
                                                controller.getCategoryProducts(
                                                    categoryId: subCategory.id,
                                                    limit: -1),
                                          )),
                                    ),
                                    const SizedBox(
                                        height: TSizes.spaceBtwItems / 2),
                                    SizedBox(
                                      height: 120,
                                      child: ListView.separated(
                                        itemCount: products.length,
                                        scrollDirection: Axis.horizontal,
                                        itemBuilder: (context, index) =>
                                            TProductCardHorizontal(
                                          product: products[index],
                                        ),
                                        separatorBuilder: (context, index) =>
                                            const SizedBox(
                                          width: TSizes.spaceBtwItems,
                                        ),
                                      ),
                                    )
                                  ],
                                );
                              });
                        });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
