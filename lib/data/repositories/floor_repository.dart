import 'package:dio/dio.dart';
import '../../core/network/dio_client.dart';
import '../../core/constants/api_constants.dart';

class FloorRepository {
  final Dio dio = DioClient().dio;

  Future<List<dynamic>> getFloors() async {
    final response = await dio.get(ApiConstants.floors);
    return response.data;
  }

  Future<List<dynamic>> getAreas(int floorId) async {
    final response = await dio.get("${ApiConstants.areasInFloor}/$floorId");
    return response.data;
  }
}