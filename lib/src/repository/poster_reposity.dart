import 'package:dio/dio.dart';
import 'package:s_shop_lao/src/models/poster.dart';

class PosterRepository {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://10.0.2.2:8090/api/collections/poster/records';

  Future<List<Poster>> fetchPosters() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['items'];
        return data.map((json) => Poster.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load posters');
      }
    } catch (e) {
      throw Exception('Failed to load posters: $e');
    }
  }
}
