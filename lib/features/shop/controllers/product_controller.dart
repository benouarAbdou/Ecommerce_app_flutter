import 'package:ecommerce/data/repositories/product/product_repo.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class ProductController extends GetxController {
  static ProductController get instance => Get.find();

  final isLoading = false.obs;
  RxList<ProductModel> featuredProducts = <ProductModel>[].obs;

  final productRepo = Get.put(ProductRepository());

  @override
  void onInit() {
    // TODO: implement onInit
    fetchFeaturedProducts();
    super.onInit();
  }

  void fetchFeaturedProducts() async {
    try {
      isLoading.value = true;

      final products = await productRepo.getFeaturedProducts();

      featuredProducts.assignAll(products);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  String getProductPrice(ProductModel product) {
    return (product.salePrice > 0 ? product.salePrice : product.price)
        .toString();
  }

  String? calculateSalePercentage(double orgPrice, double? salePrice) {
    if (salePrice == null || salePrice <= 0.0) return null;
    if (orgPrice <= 0) return null;

    double prct = ((orgPrice - salePrice) / orgPrice) * 100;
    return prct.toStringAsFixed(0);
  }

  String getProductStockStatus(int stock) {
    return stock > 0 ? 'In stock' : "Out of stock";
  }
}
