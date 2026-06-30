/// Data source contract — [HttpMarketplaceHomeService] will use the http package.
abstract class MarketplaceHomeService {
  Future<Map<String, dynamic>> fetchHomeContent();
}
