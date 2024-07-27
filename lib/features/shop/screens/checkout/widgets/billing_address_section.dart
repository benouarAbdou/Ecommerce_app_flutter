import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/personalization/controllers/address_controller.dart';
import 'package:ecommerce/features/shop/models/order_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TBillingAddressSection extends StatelessWidget {
  const TBillingAddressSection({super.key, this.order});

  final OrderModel? order;

  @override
  Widget build(BuildContext context) {
    final addressController = AddressController.instance;
    final isDetails = order != null;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TSectionHeader(
          showActionButton: !isDetails,
          title: 'Shipping address',
          buttonTitle: 'Change',
          onPressed: () => addressController.selectNewAddressPopup(context),
        ),
        Obx(() {
          print(addressController.selectedAddress.value.id);
          if (addressController.selectedAddress.value.id.isNotEmpty ||
              isDetails) {
            final address = isDetails
                ? order!.address!
                : addressController.selectedAddress.value;
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  address.name,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.grey, size: 16),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Text(
                      address.phoneNumber,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
                const SizedBox(height: TSizes.spaceBtwItems / 2),
                Row(
                  children: [
                    const Icon(Icons.location_history,
                        color: Colors.grey, size: 16),
                    const SizedBox(width: TSizes.spaceBtwItems),
                    Expanded(
                      child: Text(
                        address.toString(),
                        style: Theme.of(context).textTheme.bodyMedium,
                        softWrap: true,
                      ),
                    ),
                  ],
                ),
              ],
            );
          } else {
            return Text(
              "Select address",
              style: Theme.of(context).textTheme.bodyMedium,
            );
          }
        }),
      ],
    );
  }
}
