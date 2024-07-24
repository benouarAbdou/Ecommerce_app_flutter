import 'package:ecommerce/common/widgets/custom_shapes/containers/brand_showcase.dart';
import 'package:ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';

class CategoryBrands extends StatelessWidget {
  const CategoryBrands({super.key, required this.category});
  final CategoryModel category;
  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return FutureBuilder(
        future: controller.getBrandsForCategory(category.id),
        builder: (context, snapshot) {
          final widget = TCloudHelperFunctions.checkMultiRecordState(
              snapshot: snapshot,
              loader: const Center(
                child: CircularProgressIndicator(),
              ));
          if (widget != null) return widget;

          final brands = snapshot.data!;

          return ListView.builder(
            itemBuilder: (_, index) {
              final brand = brands[index];
              return FutureBuilder(
                  future:
                      controller.getBrandsProducts(brandId: brand.id, limit: 3),
                  builder: (context, snapshot) {
                    final widget = TCloudHelperFunctions.checkMultiRecordState(
                        snapshot: snapshot,
                        loader: const Center(
                          child: CircularProgressIndicator(),
                        ));
                    if (widget != null) return widget;

                    final products = snapshot.data!;
                    return TBrandShowCase(
                      images: products.map((e) => e.thumbnail).toList(),
                      brand: brand,
                    );
                  });
            },
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: brands.length,
          );
        });
  }
}
