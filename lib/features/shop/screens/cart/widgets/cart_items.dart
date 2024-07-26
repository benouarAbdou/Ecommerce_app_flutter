import 'package:ecommerce/common/widgets/products/quantity_add_remove.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';
import 'package:ecommerce/features/shop/controllers/cart_controller.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    super.key,
    this.showAddRemoveButtons = true,
  });

  final bool showAddRemoveButtons;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(
      () => ListView.separated(
          shrinkWrap: true,
          itemBuilder: (_, index) => Obx(() {
                final item = cartController.cartItems[index];
                return Column(
                  children: [
                    TCartItem(
                      cartItem: item,
                    ),
                    if (showAddRemoveButtons)
                      const SizedBox(height: TSizes.spaceBtwItems),
                    if (showAddRemoveButtons)
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              const SizedBox(
                                width: 70,
                              ),
                              QuantityAddRemove(
                                quantity: item.quantity,
                                add: () => cartController.addOneToCart(item),
                                remove: () =>
                                    cartController.removeOneFromCart(item),
                              ),
                            ],
                          ),
                          TProductPriceText(
                            price:
                                (item.price * item.quantity).toStringAsFixed(1),
                          )
                        ],
                      )
                  ],
                );
              }),
          separatorBuilder: (_, __) => const SizedBox(
                height: TSizes.spaceBtwSections,
              ),
          itemCount: cartController.cartItems.length),
    );
  }
}
