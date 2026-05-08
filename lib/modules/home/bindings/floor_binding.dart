import 'package:get/get.dart';
import '../controllers/floor_controller.dart';

class FloorBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FloorController>(() => FloorController());
  }
}