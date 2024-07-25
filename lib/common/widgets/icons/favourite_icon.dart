import 'package:ecommerce/common/widgets/icons/tcircular_icon.dart';
import 'package:ecommerce/features/shop/controllers/favourite_controller.dart';
import 'package:ecommerce/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class TFavouriteIcon extends StatelessWidget {
  const TFavouriteIcon({
    super.key,
    required this.productId,
  });

  final String productId;

  @override
  Widget build(BuildContext context) {
    final dark = THelperFunctions.isDarkMode(context);
    final controller = Get.put(FavouriteController());

    return Obx(
      () => TCircularIcon(
        dark: dark,
        icon: controller.isFavourite(productId)
            ? Iconsax.heart
            : Iconsax.heart_copy,
        color: controller.isFavourite(productId) ? Colors.red : null,
        onPressed: () => controller.toggleFavouriteProduct(productId),
      ),
    );
  }
}
