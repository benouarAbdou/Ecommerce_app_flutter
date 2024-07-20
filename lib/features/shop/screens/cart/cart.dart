import 'package:ecommerce/common/widgets/appbar/appbar.dart';

import 'package:ecommerce/common/widgets/products/quantity_add_remove.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';

import 'package:ecommerce/features/shop/screens/cart/widgets/cart_item.dart';

import 'package:ecommerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(TSizes.defaultSpace),
        child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: (_, index) => const Column(
                  children: [
                    TCartItem(),
                    SizedBox(height: TSizes.spaceBtwItems),
                    Row(
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
            itemCount: 10),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(
            bottom: TSizes.defaultSpace,
            left: TSizes.defaultSpace,
            right: TSizes.defaultSpace),
        child: ElevatedButton(
            onPressed: () {}, child: const Text('Checkout \$255.0')),
      ),
    );
  }
}
