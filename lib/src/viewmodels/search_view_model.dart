import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/repository/food_repository.dart';
import 'package:s_shop_lao/src/viewmodels/base_view_model.dart';

import '../models/category.dart';

class SearchViewModel extends BaseViewModel {
  List<MenuItem> menuItems = [];
  String? selectedCategoryId;

  final TextEditingController textController = TextEditingController();
  final FoodRepository foodRepository = FoodRepository();

  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    isBusy = true;
    notifyListeners();

    menuItems = await foodRepository.searchProductList(
      keyword,
    );

    isBusy = false;
    notifyListeners();
  }
}
