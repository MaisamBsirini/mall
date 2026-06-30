import '../models/home_content_model.dart';

abstract class MarketplaceHomeRepository {
  Future<HomeContentModel> getHomeContent();
}
