import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/features/shop/controllers/cart_controller.dart';

import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/checkout.dart';
import 'package:ecommerce/navigation_menu.dart';
import 'package:ecommerce/utils/constants/colors.dart';

import 'package:ecommerce/utils/constants/sizes.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CartController.instance;
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Cart',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: Obx(() {
        return controller.cartItems.isEmpty
            ? Center(
                child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("There is no item in the cart"),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  SizedBox(
                    width: 150,
                    child: ElevatedButton(
                        onPressed: () => Get.off(() => const NavigationMenu()),
                        child: Text("Add item",
                            style:
                                Theme.of(context).textTheme.bodyMedium!.apply(
                                      color: TColors.white,
                                    ))),
                  )
                ],
              ))
            : const SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(TSizes.defaultSpace),
                  child: CartItems(),
                ),
              ); //;
      }),
      bottomNavigationBar: controller.cartItems.isEmpty
          ? const SizedBox()
          : Padding(
              padding: const EdgeInsets.only(
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: (() => Get.to(() => const CheckoutScreen())),
                  child: Obx(() => Text(
                      'Checkout \$${controller.totalCartPrice.value.toStringAsFixed(1)}'))),
            ),
    );
  }
}
