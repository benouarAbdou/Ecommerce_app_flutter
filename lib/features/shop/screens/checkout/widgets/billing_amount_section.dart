import 'package:ecommerce/features/shop/controllers/cart_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/pricing_calculator.dart';
import 'package:flutter/material.dart';

class TBillingAmountSection extends StatelessWidget {
  const TBillingAmountSection({super.key, this.order});
  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    final cartController = CartController.instance;
    final subTotal = order == null
        ? cartController.totalCartPrice.value
        : TPricingCalculator.calculateSubTotal(order!.totalAmount);
    final isDetails = order != null;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Subtotal",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$${subTotal.toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Shipping fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$${TPricingCalculator.calculateShippingCost(subTotal, 'US')}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tax fee",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$${TPricingCalculator.calculateTax(subTotal, 'US')}",
              style: Theme.of(context).textTheme.labelLarge,
            ),
          ],
        ),
        const SizedBox(height: TSizes.spaceBtwItems / 2),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Order total",
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            Text(
              "\$${TPricingCalculator.calculateTotalPrice(subTotal, 'US').toStringAsFixed(2)}",
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      ],
    );
  }
}
