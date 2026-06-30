import 'package:get/get.dart';

import '../controllers/marketplace_home_controller.dart';
import '../repositories/fake_marketplace_home_repository.dart';
import '../repositories/marketplace_home_repository.dart';
import '../services/fake_marketplace_home_service.dart';
import '../services/marketplace_home_service.dart';

class MarketplaceHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MarketplaceHomeService>(
      () => FakeMarketplaceHomeService(),
    );
    Get.lazyPut<MarketplaceHomeRepository>(
      () => FakeMarketplaceHomeRepository(Get.find<MarketplaceHomeService>()),
    );
    Get.lazyPut<MarketplaceHomeController>(
      () => MarketplaceHomeController(Get.find<MarketplaceHomeRepository>()),
    );
  }
}
