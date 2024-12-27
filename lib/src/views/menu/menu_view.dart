import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_bottom_sheet.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_desc.dart';
import 'package:s_shop_lao/src/views/menu/widgets/menu_preview.dart';

import '../../../themes/component/cart_button.dart';
import '../../../themes/component/pop_button.dart';
import '../../viewmodels/base_view.dart';
import '../../viewmodels/menu_view_model.dart';
import 'widgets/menu_layout.dart';

class MenuView extends StatelessWidget {
  const MenuView({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: MenuViewModel(
        menuItems: menuItem,
        cartService: context.read(),
      ),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          title: const Text("Menu Detail"),
          leading: const PopButton(),
          titleSpacing: 0,
          actions: const [
            CartButton(),
          ],
        ),
        body: MenuLayout(
          productInfo: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            child: Wrap(
              runSpacing: 32,
              alignment: WrapAlignment.center,
              children: [
                MenuPreview(menuItems: menuItem),
                MenuDescription(menuItem: menuItem),
              ],
            ),
          ),
          productBottomSheet: MenuBottomSheet(
            count: viewModel.count,
            menuItem: menuItem,
            onCountChanged: viewModel.onCountChanged,
            onAddToCartPressed: viewModel.onAddToCartPressed,
          ),
        ),
      ),
    );
  }
}
