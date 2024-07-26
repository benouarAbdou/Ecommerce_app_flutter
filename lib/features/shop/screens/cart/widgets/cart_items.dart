
import 'package:ecommerce/common/widgets/products/quantity_add_remove.dart';
import 'package:ecommerce/common/widgets/texts/product_price.dart';
import 'package:ecommerce/features/shop/controllers/cart_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_item.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartItems extends StatelessWidget {
  const CartItems({
    Key? key,
    this.showAddRemoveButtons = true,
    this.order,
  }) : super(key: key);

  final bool showAddRemoveButtons;
  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;

    return Obx(() {
      bool h = cartController.isDetails.value;

      return ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final item = order != null
              ? order!.items[index]
              : cartController.cartItems[index];
          return Column(
            children: [
              Obx(() {
                bool h = cartController.isDetails.value;
                return TCartItem(
                  cartItem: item,
                );
              }),
              if (showAddRemoveButtons)
                const SizedBox(height: TSizes.spaceBtwItems),
              if (showAddRemoveButtons)
                Obx(() {
                  bool h = cartController.isDetails.value;

                  return Row(
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
                        price: (item.price * item.quantity).toStringAsFixed(1),
                      )
                    ],
                  );
                }),
            ],
          );
        },
        separatorBuilder: (_, __) => const SizedBox(
          height: TSizes.spaceBtwSections,
        ),
        itemCount: order != null
            ? order!.items.length
            : cartController.cartItems.length,
      );
    });
  }
}
