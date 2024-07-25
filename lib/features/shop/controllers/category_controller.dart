import 'package:ecommerce/data/repositories/categories/category_repo.dart';
import 'package:ecommerce/data/repositories/product/product_repo.dart';
import 'package:ecommerce/features/shop/models/category_model.dart';
import 'package:ecommerce/features/shop/models/product_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CategoryController extends GetxController {
  static CategoryController get instance => Get.find();
  final isLoading = false.obs;
  final categoryRepo = Get.put(CategoryRepository());
  RxList<CategoryModel> allCategories = <CategoryModel>[].obs;
  RxList<CategoryModel> featuredCategories = <CategoryModel>[].obs;
//load categories
  @override
  void onInit() {
    // TODO: implement onInit
    fetchCategories();
    super.onInit();
  }

  /// Load category data
  Future<void> fetchCategories() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final categories = await categoryRepo.getAllCategories();

      // Update the categories list
      allCategories.assignAll(categories);

      // Filter featured categories
      featuredCategories.assignAll(
        allCategories
            .where(
                (category) => category.isFeatured && category.parentId.isEmpty)
            .take(8)
            .toList(),
      );
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }

//load category
  Future<List<CategoryModel>> getSubCategories(
    String categoryId,
  ) async {
    try {
      final subCategories = await categoryRepo.getSubCategories(categoryId);
      return subCategories;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      return [];
    }
  }
//sub category

  Future<List<ProductModel>> getCategoryProducts(
      {required String categoryId, int limit = 4}) async {
    try {
      final products = await ProductRepository.instance
          .getProductsForCategory(categoryId: categoryId, limit: limit);
      return products;
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
      print(e.toString());
      return [];
    }
  }
}
