import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/data/models/store_model.dart';

class StorePreviewController extends GetxController {
  final PageController pageController = PageController(
    viewportFraction: 0.62,
  );

  RxInt selectedStoreIndex = 0.obs;

  RxList<StoreModel> stores = <StoreModel>[].obs;

  RxString selectedCategory = "Hair".obs;

  @override
  void onInit() {
    loadMockStores();
    super.onInit();
  }

  void changeStore(int index) {
    selectedStoreIndex.value = index;
  }

  StoreModel get currentStore =>
      stores[selectedStoreIndex.value];

  void selectCategory(String category) {
    selectedCategory.value = category;
  }

  void loadMockStores() {
    stores.value = [
      StoreModel(
        id: 1,
        name: "Velvet Hair Studio",
        image:
            "https://images.unsplash.com/photo-1521590832167-7bcbfaa6381f",
        rating: 4.8,
        isOpen: true,
        mapX: 0.45,
        mapY: 0.58,
        category: "Hair",
      ),

      StoreModel(
        id: 2,
        name: "Lumière Spa",
        image:
            "https://images.unsplash.com/photo-1515377905703-c4788e51af15",
        rating: 4.7,
        isOpen: true,
        mapX: 0.28,
        mapY: 0.60,
        category: "Spa",
      ),

      StoreModel(
        id: 3,
        name: "The Brow Bar",
        image:
            "https://images.unsplash.com/photo-1524504388940-b1c1722653e1",
        rating: 4.6,
        isOpen: false,
        mapX: 0.72,
        mapY: 0.56,
        category: "Brows",
      ),
    ];
  }
}