import 'package:get/get.dart';
import 'package:mall/modules/home/controllers/explorer_controller.dart';

class ExplorerBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExplorerController>(() => ExplorerController());
  }
}