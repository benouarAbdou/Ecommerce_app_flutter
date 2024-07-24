import 'package:ecommerce/common/widgets/layouts/grid_layout.dart';
import 'package:ecommerce/common/widgets/products/product_card_vertical.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TSortableProducts extends StatelessWidget {
  const TSortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DropdownButtonFormField(
            decoration:
                const InputDecoration(prefixIcon: Icon(Iconsax.sort_copy)),
            items: const [
              'Name',
              'Higher price',
              'Lower price',
              'Sale',
              'Newest',
              'Popularity'
            ].map((e) => DropdownMenuItem(value: e, child: Text(e))).toList(),
            onChanged: (value) {}),
        const SizedBox(height: TSizes.spaceBtwSections),
        TGridLayout(
            itemCount: 8,
            itemBuilder: (_, index) => TProductCardVertical(
                  product: ProductModel.empty(),
                ))
      ],
    );
  }
}
