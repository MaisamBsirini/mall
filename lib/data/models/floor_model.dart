class FloorModel {
  final int id;
  final String name;
  final int number;
  final int mallId;

  FloorModel({
    required this.id,
    required this.name,
    required this.number,
    required this.mallId,
  });

  factory FloorModel.fromJson(Map<String, dynamic> json) {
    return FloorModel(
      id: json['id'],
      name: json['name'],
      number: json['number'],
      mallId: json['mallID'],
    );
  }
}