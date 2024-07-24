import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/custom_shapes/containers/tbrand_card.dart';
import 'package:ecommerce/common/widgets/products/sortable_products.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class BrandProducts extends StatelessWidget {
  const BrandProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Nike',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(TSizes.defaultSpace),
          child: Column(
            children: [
              TBrandCard(showBorder: true),
              SizedBox(
                height: TSizes.spaceBtwItems,
              ),
              TSortableProducts(
                products: [],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
