import 'package:mall/data/models/service_model.dart';

class AreaModel {
  final int id;
  final String name;
  final int number;
  final int floorId;
  final String usageType;
  final String category;
  final int maxCapacity;

  final double pinX;
  final double pinY;
  final String image;
  final List<ServiceModel> services;

  AreaModel({
    required this.id,
    required this.name,
    required this.number,
    required this.floorId,
    required this.usageType,
    required this.category,
    required this.maxCapacity,

    required this.pinX,
    required this.pinY,
    required this.image,
    required this.services,
  });

  factory AreaModel.fromJson(Map<String, dynamic> json) {
    return AreaModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      floorId: json['floorID'],
      usageType: json['usageType'],
      category: json['category'],
      maxCapacity: json['maxCapacity'],

      pinX: (json['pin_position_x'] ?? 0.5).toDouble(),
      pinY: (json['pin_position_y'] ?? 0.6).toDouble(),
      image: json['image_url'],
      services:
          (json['services'] as List? ?? [])
              .map((e) => ServiceModel.fromJson(e))
              .toList(),
    );
  }
}
