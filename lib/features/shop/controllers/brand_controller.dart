import 'package:ecommerce/data/repositories/brand/brand_repo.dart';
import 'package:ecommerce/data/repositories/product/product_repo.dart';
import 'package:ecommerce/features/shop/models/brand_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BrandController extends GetxController {
  static BrandController get instance => Get.find();

  final isLoading = false.obs;
  final brandRepo = Get.put(BrandRepository());
  RxList<BrandModel> allBrands = <BrandModel>[].obs;
  RxList<BrandModel> featuredBrands = <BrandModel>[].obs;
//load brands
  @override
  void onInit() {
    // TODO: implement onInit
    getFeaturedBrands();
    super.onInit();
  }

  /// Load category data
  Future<void> getFeaturedBrands() async {
    try {
      // Show Loader while loading brands
      isLoading.value = true;

      // Fetch brands from data source (Firestore, API, etc.)
      final brands = await brandRepo.getAllBrands();

      // Update the brands list
      allBrands.assignAll(brands);

      // Filter featured brands
      featuredBrands.assignAll(
        allBrands.where((brand) => brand.isFeatured ?? false).take(4).toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

  Future<List<ProductModel>> getBrandsProducts(
      {required String brandId, int limit = -1}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForBrands(brandId: brandId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }

  Future<List<BrandModel>> getBrandsForCategory(String categoryId) async {
    try {
      final brands = await brandRepo.getBrandsForCategory(categoryId);
      return brands;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
}
