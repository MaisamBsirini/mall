import 'package:get/get.dart';

import '../../shared/navigation/main_nav_routes.dart';
import '../models/floor_model.dart';
import '../models/floor_badge_model.dart';
import '../repositories/floors_repository.dart';

class FloorsController extends GetxController {
  FloorsController(this._repository);

  final FloorsRepository _repository;

  final isLoading = true.obs;
  final floors = <FloorModel>[].obs;
  final interstitialBadges = <FloorBadgeModel>[].obs;

  static const navIndex = 1;

  @override
  void onInit() {
    super.onInit();
    loadFloors();
  }

  Future<void> loadFloors() async {
    isLoading.value = true;
    try {
      final content = await _repository.getFloorsContent();
      floors.assignAll(content.floors);
      interstitialBadges.assignAll(content.interstitialBadges);
    } finally {
      isLoading.value = false;
    }
  }

  void onFilterTap() {}

  void onNavTap(int index) => MainNavRoutes.goToTab(index);
}
