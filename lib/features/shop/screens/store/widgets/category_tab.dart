import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_card_vertical.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/category_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/screens/all_products/all_products.dart';
import 'package:ecommerce/features/shop/screens/store/widgets/category_brands.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryTab extends StatelessWidget {
  const CategoryTab({super.key, required this.category});

  final CategoryModel category;

  @override
  Widget build(BuildContext context) {
    final controller = CategoryController.instance;
    return ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          Padding(
            padding: const EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                CategoryBrands(
                  category: category,
                ),
                FutureBuilder(
                    future:
                        controller.getCategoryProducts(categoryId: category.id),
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
                            title: 'You might like',
                            showActionButton: true,
                            onPressed: () => Get.to(() => AllProducts(
                                  title: category.name,
                                  futureMethod: controller.getCategoryProducts(
                                      categoryId: category.id, limit: -1),
                                )),
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems),
                          TGridLayout(
                              itemCount: products.length,
                              itemBuilder: (_, index) => TProductCardVertical(
                                    product: products[index],
                                  ))
                        ],
                      );
                    }),
              ],
            ),
          ),
        ]);
  }
}
