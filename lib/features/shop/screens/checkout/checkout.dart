import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/rounded_container.dart';
import 'package:ecommerce/common/widgets/products/coupon_code.dart';
import 'package:ecommerce/features/shop/controllers/cart_controller.dart';
import 'package:ecommerce/features/shop/controllers/order_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/features/shop/screens/cart/widgets/cart_items.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_address_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_amount_section.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/billing_payement_section.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:ecommerce/utils/helpers/pricing_calculator.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key, this.order});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final cartController = CartController.instance;
    final subTotal = cartController.totalCartPrice.value;
    final orderController = Get.put(OrderController());
    final totalAmount = TPricingCalculator.calculateTotalPrice(subTotal, "US");
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Checkout',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              CartItems(
                showAddRemoveButtons: false,
                order: order,
              ),
              order == null
                  ? const SizedBox(height: TSizes.spaceBtwSections)
                  : const SizedBox.shrink(),
              order == null ? const TCouponCode() : const SizedBox.shrink(),
              const SizedBox(height: TSizes.spaceBtwSections),
              TRoundedContainer(
                padding: const EdgeInsets.all(TSizes.md),
                showBorder: true,
                backgroundColor: dark ? TColors.black : TColors.white,
                child: Column(
                  children: [
                    TBillingAmountSection(order: order),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const Divider(),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    TBillingPayementSection(order: order),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const TBillingAddressSection()
                  ],
                ),
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: order == null
          ? Padding(
              padding: const EdgeInsets.only(
                  bottom: TSizes.defaultSpace,
                  left: TSizes.defaultSpace,
                  right: TSizes.defaultSpace),
              child: ElevatedButton(
                  onPressed: subTotal > 0
                      ? () => orderController.processOrder(totalAmount)
                      : TLoaders.warningSnackBar(
                          title: 'Empty Cart',
                          message: "Add items to the cart"),
                  child: Text('Checkout \$${totalAmount.toStringAsFixed(2)}')),
            )
          : null,
    );
  }
}
