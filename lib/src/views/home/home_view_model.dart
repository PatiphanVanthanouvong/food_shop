import 'package:flutter/material.dart';

import '../../viewmodels/base_view_model.dart';

class HomeViewModel extends BaseViewModel {
  // List<Product> productList = [];
  final TextEditingController textController = TextEditingController();
  // final ProductRepository productRepository = ProductRepository();

  String get keyword => textController.text.trim();

  Future<void> searchProductList() async {
    isBusy = true;
    final results = await Future.wait([
      // productRepository.searchProductList(keyword),
      Future.delayed(const Duration(milliseconds: 555)),
    ]);
    // productList = results[0];
    isBusy = false;
  }
}
