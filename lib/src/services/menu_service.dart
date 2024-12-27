import 'package:dio/dio.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'dart:developer';

class MenuItemService {
  final Dio _dio = Dio();
  final String _baseUrl =
      'http://10.0.2.2:8090/api/collections/menu/records';

  Future<List<MenuItem>> fetchMenuItems() async {
    try {
      final response = await _dio.get(_baseUrl);
      if (response.statusCode == 200) {
        List<dynamic> data = response.data['items'];
        log('Fetch successful: ${response.data}');
        return data.map((json) => MenuItem.fromJson(json)).toList();
      } else {
        log('Failed to load menu items: ${response.statusCode}');
        throw Exception('Failed to load menu items');
      }
    } catch (e) {
      log('Failed to load menu items: $e');
      throw Exception('Failed to load menu items: $e');
    }
  }
}
