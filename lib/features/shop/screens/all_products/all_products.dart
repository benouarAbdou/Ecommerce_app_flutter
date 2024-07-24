import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce/common/widgets/appbar/appbar.dart';
import 'package:ecommerce/common/widgets/products/sortable_products.dart';
import 'package:ecommerce/features/shop/controllers/all_products_controller.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/constants/sizes.dart';
import 'package:ecommerce/utils/helpers/cloud_helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AllProducts extends StatelessWidget {
  const AllProducts(
      {super.key, required this.title, this.query, this.futureMethod});

  final String title;
  final Query? query;
  final Future<List<ProductModel>>? futureMethod;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(AllProductsController());
    return Scaffold(
      appBar: TAppBar(
        showBackArrow: true,
        title: Text(
          'Popular Products',
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(TSizes.defaultSpace),
          child: FutureBuilder<List<ProductModel>>(
              future: futureMethod ?? controller.fetchProductsByQuery(query),
              builder: (context, snapshot) {
                final widget = TCloudHelperFunctions.checkMultiRecordState(
                    snapshot: snapshot,
                    loader: const Center(
                      child: CircularProgressIndicator(),
                    ));
                if (widget != null) return widget;

                final allFeaturedProducts = snapshot.data!;
                return TSortableProducts(
                  products: allFeaturedProducts,
                );
              }),
        ),
      ),
    );
  }
}
