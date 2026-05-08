import 'package:dio/dio.dart';
import '../constants/api_constants.dart';

class DioClient {
  static final DioClient _instance = DioClient._internal();
  late Dio dio;

  factory DioClient() => _instance;

  DioClient._internal() {
    dio = Dio(
      BaseOptions(
        baseUrl: "http://72.62.42.213:8010/api",
        connectTimeout: Duration(seconds: 15),
        receiveTimeout: Duration(seconds: 25),
      ),
    );
  }
}
