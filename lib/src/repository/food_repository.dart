import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';

// FoodRepository.dart
class FoodRepository {
  final Dio _dio = Dio();
  final String _baseUrl = 'http://10.0.2.2:8090/api/collections/menu/records';
  Future<List<MenuItem>> fetchCategories() async {
    try {
      final response = await _dio.get(_baseUrl);
      List<dynamic> data = response.data['items'];
      return data.map<MenuItem>((json) => MenuItem.fromJson(json)).toList();
    } catch (e, s) {
      log('Failed to fetch categories', error: e, stackTrace: s);
      rethrow;
    }
  }  Future<List<MenuItem>> searchProductList(String keyword) async {
    try {
      // Add expand parameter to include category details
      final response = await _dio.get(_baseUrl);

      List<dynamic> data = response.data['items'];
      List<MenuItem> menuItems = data.map<MenuItem>((json) {
        return MenuItem.fromJson(json);
      }).where((menuItem) {
        if (keyword.isEmpty) return true;

        final searchTerm = keyword.toLowerCase();
        // Check each field independently

        return menuItem.name.toLowerCase().contains(searchTerm) ||
            menuItem.description.toLowerCase().contains(searchTerm) ||
            (menuItem.categoryName ?? '').toLowerCase().contains(searchTerm);
      }).toList();

      return menuItems;
    } catch (e, s) {
      log('Failed to searchProductList', error: e, stackTrace: s);
      rethrow;
    }
  }
}
