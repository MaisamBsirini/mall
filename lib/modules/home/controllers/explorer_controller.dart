import 'package:get/get.dart';
import 'package:mall/data/models/area_model.dart';
import 'package:mall/data/models/mock.dart';

class ExplorerController extends GetxController {
  var currentArea = Rxn<AreaModel>();
  var isLoading = false.obs;

  /// mock بدل API حالياً
  @override
  void onInit() {
    loadInitialArea();
    super.onInit();
  }

  void loadInitialArea() {
    currentArea.value = mockArea1;
  }

  void changeArea(AreaModel newArea) async {
    isLoading.value = true;

    await Future.delayed(Duration(milliseconds: 400));

    currentArea.value = newArea;

    isLoading.value = false;
  }
}