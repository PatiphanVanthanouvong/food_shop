import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/repository/food_repository.dart';
import 'package:s_shop_lao/src/services/category_service.dart';
import 'package:s_shop_lao/src/viewmodels/menu_view_model.dart';
import 'package:s_shop_lao/src/viewmodels/poster_view_model.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryService>(
      builder: (context, viewModel, child) {
        if (viewModel.isBusy) {
          return const Center(child: CircularProgressIndicator());
        } else if (viewModel.menuItems.isEmpty) {
          return const Center(child: Text('No menuItems available.'));
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(
              width: 15,
            ),
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: viewModel.menuItems.length,
            itemBuilder: (context, index) {
              var category = viewModel.menuItems[index];
              return Chip(
                label: Text(category.categoryName ?? ""),
              );
            },
          );
        }
      },
    );
  }
}
