import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/primary_header_container.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/profile_tile.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/setting_menu_tile.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tcircular_image.dart';
import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/utils/constants/colors.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TPrimaryHeaderContainer(
              child: Column(
                children: [
                  TAppBar(
                    title: Text(
                      "Account",
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium!
                          .apply(color: TColors.white),
                    ),
                  ),
                  const TUserProfileTile(),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(TSizes.defaultSpace),
              child: Column(
                children: [
                  const TSectionHeader(
                    title: "Account settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.safe_home,
                    title: 'My addresses',
                    subtitle: 'Set shipping deleviry address',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.shopping_bag,
                    title: 'My cart',
                    subtitle: 'add , remove products from cart',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.bag_tick,
                    title: 'My orders',
                    subtitle: 'see your orders',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.bank,
                    title: 'bank account',
                    subtitle: 'your bank details',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.discount_shape,
                    title: 'My coupouns',
                    subtitle: 'get discounts',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subtitle: 'Get notified',
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.security_card,
                    title: 'account privacy',
                    subtitle: 'account privacy',
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  const TSectionHeader(
                    title: "App settings",
                    showActionButton: false,
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwItems,
                  ),
                  const TSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Document upload',
                    subtitle: 'Document upload',
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geo location',
                    subtitle: 'Geo location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.security_user,
                    title: 'Safe mode',
                    subtitle: 'Safe mode',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  TSettingsMenuTile(
                    icon: Iconsax.image,
                    title: 'Hd image quality',
                    subtitle: 'Hd image quality',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  const SizedBox(
                    height: TSizes.spaceBtwSections,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                        onPressed: () {}, child: const Text("Logout")),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}