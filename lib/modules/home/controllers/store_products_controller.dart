import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mall/data/models/product_model.dart';


class StoreProductsController extends GetxController {
  final PageController pageController =
      PageController(
    viewportFraction: 0.72,
  );

  RxInt selectedIndex = 0.obs;

  RxString selectedSize = "100ml".obs;

  RxList<ProductModel> products =
      <ProductModel>[].obs;

  @override
  void onInit() {
    loadMockProducts();
    super.onInit();
  }

  ProductModel get currentProduct =>
      products[selectedIndex.value];

  void changeProduct(int index) {
    selectedIndex.value = index;

    selectedSize.value =
        products[index].selectedSize;
  }

  void selectSize(String size) {
    selectedSize.value = size;
  }

  void loadMockProducts() {
    products.value = [
      ProductModel(
        id: 1,
        name: "Velvet Repair Serum",

        imagePng:
            "https://pngimg.com/d/perfume_PNG10220.png",

        price: 280,

        rating: 4.8,

        isFavorite: true,

        sizes: [
          "50ml",
          "100ml",
          "150ml",
        ],

        selectedSize: "100ml",

        category: "Hair",
      ),

      ProductModel(
        id: 2,
        name: "Golden Skin Oil",

        imagePng:
            "https://pngimg.com/d/perfume_PNG10221.png",

        price: 320,

        rating: 4.9,

        isFavorite: false,

        sizes: [
          "50ml",
          "100ml",
          "150ml",
        ],

        selectedSize: "100ml",

        category: "Spa",
      ),

      ProductModel(
        id: 3,
        name: "Royal Essence",

        imagePng:
            "https://pngimg.com/d/perfume_PNG10218.png",

        price: 410,

        rating: 4.7,

        isFavorite: true,

        sizes: [
          "50ml",
          "100ml",
          "150ml",
        ],

        selectedSize: "100ml",

        category: "Luxury",
      ),
    ];
  }
}