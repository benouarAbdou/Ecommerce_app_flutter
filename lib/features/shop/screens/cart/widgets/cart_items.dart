import 'package:ecommerce/common/widgets/products/quantity_add_remove.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (_, index) => Column(
              children: [
                const TCartItem(),
                if (showAddRemoveButtons)
                  const SizedBox(height: TSizes.spaceBtwItems),
                if (showAddRemoveButtons)
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 70,
                          ),
                          QuantityAddRemove(),
                        ],
                      ),
                      TProductPriceText(price: '155')
                    ],
                  )
              ],
            ),
        separatorBuilder: (_, __) => const SizedBox(
              height: TSizes.spaceBtwSections,
            ),
        itemCount: 2);
  }
}
