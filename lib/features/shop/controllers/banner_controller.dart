import 'package:ecommerce/data/repositories/banner/banner_repo.dart';
import 'package:ecommerce/features/shop/models/banner_model.dart';
import 'package:ecommerce/utils/popups/loaders.dart';
import 'package:get/get.dart';

class BannerController extends GetxController {
  static BannerController get instance => Get.find();
  final isLoading = false.obs;
  RxList<BannerModel> allBanners = <BannerModel>[].obs;

  Rx<int> currentCarousalIndex = 0.obs;
  void updateCarousalIndicator(index) {
    currentCarousalIndex.value = index;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    fetchBanners();
    super.onInit();
  }

  Future<void> fetchBanners() async {
    try {
      // Show Loader while loading categories
      isLoading.value = true;

      // Fetch categories from data source (Firestore, API, etc.)
      final bannerRepo = Get.put(BannerRepository());
      final banners = await bannerRepo.getAllBanners();
      allBanners.assignAll(banners);
    } catch (e) {
      TLoaders.errorSnackBar(title: "Oh Snap!", message: e.toString());
    } finally {
      // Remove Loader
      isLoading.value = false;
    }
  }
}
