import '../models/floors_content_model.dart';

abstract class FloorsRepository {
  Future<FloorsContentModel> getFloorsContent();
}
