import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/repository/food_repository.dart';
import 'package:s_shop_lao/src/viewmodels/base_view_model.dart';

class CategoryService extends BaseViewModel {
  CategoryService() {
    fetchCat();
  }
  List<MenuItem> menuItems = [];

  final TextEditingController textController = TextEditingController();
  final FoodRepository foodRepository = FoodRepository();

  String get keyword => textController.text.trim();

  Future<void> fetchCat() async {
    isBusy = true;
    notifyListeners();

    menuItems = await foodRepository.fetchCategories();

    isBusy = false;
    notifyListeners();
  }
}
