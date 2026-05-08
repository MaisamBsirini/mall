import 'package:get/get.dart';
import 'package:mall/data/models/area_model.dart';
import 'package:mall/data/models/floor_model.dart';

class FloorController extends GetxController {
  var selectedFloorIndex = 0.obs;

  var floors = <FloorModel>[].obs;
  var areas = <AreaModel>[].obs;

  late List<AreaModel> allAreas;

  @override
  void onInit() {
    loadMockFloors();
    loadMockAreas();
    super.onInit();
  }

  void loadMockFloors() {
    floors.value = [
      FloorModel(id: 1, name: "Floor 1", number: 1, mallId: 1),
      FloorModel(id: 2, name: "Floor 2", number: 2, mallId: 1),
      FloorModel(id: 3, name: "Floor 3", number: 3, mallId: 1),
      FloorModel(id: 4, name: "Floor 4", number: 4, mallId: 1),
      FloorModel(id: 5, name: "Floor 5", number: 5, mallId: 1),
    ];
  }

  void loadMockAreas() {
    allAreas = [
      AreaModel(
        id: 1,
        name: "Entertainment Hub",
        number: 20,
        floorId: 3,
        usageType: "service",
        category: "entertainment",
        maxCapacity: 300,
        pinX: 0.1,
        pinY: 0.1,
         image:
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb",
        services: List.empty(),
      ),
      AreaModel(
        id: 2,
        name: "Beauty & Wellness Alley",
        number: 21,
        floorId: 3,
        usageType: "store",
        category: "beauty",
        maxCapacity: 8,
        pinX: 0.2,
        pinY: 0.2,
         image:
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb",
        services: List.empty(),
      ),
      AreaModel(
        id: 3,
        name: "Kids Play Corner",
        number: 22,
        floorId: 2,
        usageType: "service",
        category: "family",
        maxCapacity: 40,
        pinX: 0.1,
        pinY: 0.1,
         image:
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb",
        services: List.empty(),
      ),
    ];

    loadMockAreasForFloor(0);
  }

  void changeFloor(int index) {
    selectedFloorIndex.value = index;
    loadMockAreasForFloor(index);
  }

  void loadMockAreasForFloor(int floorIndex) {
    final floorId = floors[floorIndex].id;

    areas.value =
        allAreas.where((a) => a.floorId == floorId).toList();
  }
}