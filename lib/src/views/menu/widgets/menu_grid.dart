import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_card.dart';
import 'package:s_shop_lao/themes/res/layout.dart';

class MenuGrid extends StatelessWidget {
  const MenuGrid(
    this.foodList, {
    super.key,
  });

  final List<MenuItem> foodList;

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.count(
      crossAxisCount: context.layout(
        2,
        tablet: 3,
        desktop: 4,
      ),
      mainAxisSpacing: 24,
      crossAxisSpacing: 16,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 32,
      ),
      itemCount: foodList.length,
      itemBuilder: (context, index) {
        final food = foodList[index];
        return MenuItemCard(menuItem: food);
      },
    );
  }
}
