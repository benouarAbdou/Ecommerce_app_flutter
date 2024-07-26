import 'package:ecommerce/common/widgets/texts/section_heading.dart';
import 'package:ecommerce/features/shop/models/payement_method_model.dart';
import 'package:ecommerce/features/shop/screens/checkout/widgets/payement_tile.dart';
import 'package:ecommerce/utils/constants/image_strings.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CheckoutController extends GetxController {
  static CheckoutController get instance => Get.find();

  final Rx<PayementMethodModel> selectedPayementMethod =
      PayementMethodModel.empty().obs;

  @override
  void onInit() {
    // TODO: implement onInit
    selectedPayementMethod.value =
        PayementMethodModel(image: TImages.paypal, name: "Paypal");
    super.onInit();
  }

  Future<dynamic> selectPaymentMethod(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      builder: (context) => SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(TSizes.lg),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const TSectionHeader(
                title: "Select Payment Method",
                showActionButton: false,
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              TPaymentTile(
                paymentMethod: PayementMethodModel(
                  name: 'Paypal',
                  image: TImages.paypal,
                ),
              ),

              TPaymentTile(
                paymentMethod: PayementMethodModel(
                  name: 'Google pay',
                  image: TImages.googlePay,
                ),
              ),

              TPaymentTile(
                paymentMethod: PayementMethodModel(
                  name: 'Apple pay',
                  image: TImages.applePay,
                ),
              ),

              TPaymentTile(
                paymentMethod: PayementMethodModel(
                  name: 'Master card',
                  image: TImages.masterCard,
                ),
              ),

              TPaymentTile(
                paymentMethod: PayementMethodModel(
                  name: 'Visa',
                  image: TImages.visa,
                ),
              ),

              // Add more payment methods here
            ],
          ),
        ),
      ),
    );
  }
}
