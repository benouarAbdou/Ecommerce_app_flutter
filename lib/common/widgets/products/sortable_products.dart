import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_card_vertical.dart';
import 'package:ecommerce/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
    required this.products,
  });

  final List<ProductModel> products;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    controller.assignProducts(products);
    return Column(
      children: [
        DropdownButtonFormField(
            value: controller.selectedSortOption.value,
            decoration:
                const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
            items: const [
              'Name',
              'Higher Price',
              'Lower Price',
              'Sale',
              //'Newest',
              //'Popularity'
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {
              controller.sortProducts(value!);
            }),
        const SizedBox(height: TSizes.spaceBtwSections),
        Obx(
          () => TGridLayout(
              itemCount: controller.products.length,
              itemBuilder: (_, index) => TProductCardVertical(
                    product: controller.products[index],
                  )),
        )
      ],
    );
  }
}
