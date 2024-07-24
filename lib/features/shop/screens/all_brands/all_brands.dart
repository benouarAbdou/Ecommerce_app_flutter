import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tbrand_card.dart';
import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/controllers/brand_controller.dart';
import 'package:ecommerce/features/shop/screens/all_brands/brand_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = BrandController.instance;

    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Brands',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              const TSectionHeader(
                title: "Brands",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwItems),
              Obx(() {
                if (controller.allBrands.isEmpty) {
                  return const Center(
                    child: Text("No brands to show"),
                  );
                }
                return TGridLayout(
                    itemCount: controller.allBrands.length,
                    mainAxisEvent: 80,
                    itemBuilder: (_, index) {
                      final brand = controller.allBrands[index];
                      return TBrandCard(
                        showBorder: true,
                        brand: brand,
                        onTap: () => Get.to(() => BrandProducts(
                              brand: brand,
                            )),
                      );
                    });
              }),
            ],
          ),
        ),
      ),
    );
  }
}
