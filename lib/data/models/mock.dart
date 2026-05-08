import 'package:mall/data/models/area_model.dart';
import 'package:mall/data/models/service_model.dart';

final mockArea1 = AreaModel(
  id: 1,
  name: "Emerald Hall",
  number: 20,
  floorId: 3,
  category: "entertainment",
  maxCapacity: 300,
  usageType: "Reception",
  image:
      "https://images.unsplash.com/photo-1505691938895-1758d7feb511",
  pinX: 0.5,
  pinY: 0.6,
  services: [
    ServiceModel(
      id: 1,
      name: "Lumière Spa",

      image:
          "https://images.unsplash.com/photo-1556228720-195a672e8a03",
      rating: 4.5,
      isFavorite: false,
    ),
    ServiceModel(
      id: 2,
      name: "Hair Studio",
      image:
          "https://images.unsplash.com/photo-1522335789203-aabd1fc54bc9",
      rating: 4.2,
      isFavorite: false,
    ),
  ],
);

final mockArea2 = AreaModel(
  id: 2,
  name: "Golden Atrium",
  usageType: "Shopping",
  number: 20,
  floorId: 3,
  category: "entertainment",
  maxCapacity: 300,
  image:
      "https://images.unsplash.com/photo-1493809842364-78817add7ffb",
  pinX: 0.7,
  pinY: 0.5,
  services: [
    ServiceModel(
      id: 3,
      name: "Fashion Hub",
      image:
          "https://images.unsplash.com/photo-1445205170230-053b83016050",
      rating: 4.8,
      isFavorite: false,
    ),
  ],
);