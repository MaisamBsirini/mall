import 'dart:convert';

import 'package:http/http.dart' as http;

import 'marketplace_home_service.dart';

/// REST service skeleton — wire Laravel base URL when backend is ready.
class HttpMarketplaceHomeService implements MarketplaceHomeService {
  final http.Client _client;
  final String baseUrl;

  HttpMarketplaceHomeService({
    required this.baseUrl,
    http.Client? client,
  }) : _client = client ?? http.Client();

  @override
  Future<Map<String, dynamic>> fetchHomeContent() async {
    final uri = Uri.parse('$baseUrl/home');
    final response = await _client.get(
      uri,
      headers: const {'Accept': 'application/json'},
    );

    if (response.statusCode != 200) {
      throw MarketplaceHttpException(
        'Failed to load home content (${response.statusCode})',
      );
    }

    return jsonDecode(response.body) as Map<String, dynamic>;
  }
}

class MarketplaceHttpException implements Exception {
  final String message;
  MarketplaceHttpException(this.message);

  @override
  String toString() => message;
}
