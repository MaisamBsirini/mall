import 'package:get/get.dart';

import '../controllers/floors_controller.dart';
import '../repositories/fake_floors_repository.dart';
import '../repositories/floors_repository.dart';
import '../services/fake_floors_service.dart';
import '../services/floors_service.dart';

class FloorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FloorsService>(() => FakeFloorsService());
    Get.lazyPut<FloorsRepository>(
      () => FakeFloorsRepository(Get.find<FloorsService>()),
    );
    Get.lazyPut<FloorsController>(
      () => FloorsController(Get.find<FloorsRepository>()),
    );
  }
}
