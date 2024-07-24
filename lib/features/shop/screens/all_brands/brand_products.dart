import 'package:flutter/material.dart';
import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tbrand_card.dart';
import 'package:ecommerce/common/widgets/products/sortable_products.dart';
import 'package:ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key, required this.brand});
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          brand.name,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(
                showBorder: true,
                brand: brand,
              ),
              const SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              FutureBuilder<List<ProductModel>>(
                future: controller.getBrandsProducts(brandId: brand.id),
                builder: (context, snapshot) {
                  // Use the TCloudHelperFunctions to handle different states
                  final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );

                  // If the widget is not null, it means we're still loading or there's an error
                  if (widget != null) {
                    return widget;
                  }

                  // If we reach here, we have data
                  final brandProducts = snapshot.data!;
                  return TSortableProducts(
                    products: brandProducts,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
