import '../models/floors_content_model.dart';
import '../services/floors_service.dart';
import 'floors_repository.dart';

class FakeFloorsRepository implements FloorsRepository {
  final FloorsService _service;

  FakeFloorsRepository(this._service);

  @override
  Future<FloorsContentModel> getFloorsContent() async {
    final json = await _service.fetchFloorsContent();
    return FloorsContentModel.fromJson(json);
  }
}
