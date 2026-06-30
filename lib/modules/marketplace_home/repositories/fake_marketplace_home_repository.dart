import '../models/home_content_model.dart';
import '../services/marketplace_home_service.dart';
import 'marketplace_home_repository.dart';

class FakeMarketplaceHomeRepository implements MarketplaceHomeRepository {
  final MarketplaceHomeService _service;

  FakeMarketplaceHomeRepository(this._service);

  @override
  Future<HomeContentModel> getHomeContent() async {
    final json = await _service.fetchHomeContent();
    return HomeContentModel.fromJson(json);
  }
}
