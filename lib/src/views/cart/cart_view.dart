import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import '../../../themes/component/button/button.dart';
import '../../../themes/component/pop_button.dart';
import '../../viewmodels/base_view.dart';
import '../../viewmodels/card_view_model.dart';
import '../cart/widgets/cart_bottom_sheet.dart';
import '../cart/widgets/cart_empty.dart';
import '../cart/widgets/cart_item_tile.dart';
import '../cart/widgets/cart_layout.dart';
import 'widgets/cart_checkout_dialog.dart';
import 'widgets/cart_delete_dialog.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: CartViewModel(
        cartService: context.read(),
      ),
      builder: (context, viewModel) => Scaffold(
        appBar: AppBar(
          leadingWidth: 20,
          leading: const SizedBox(),
          title: const Text("Cart"),
          titleSpacing: 0,
          actions: [
            /// Delete Button
            Button(
              onPressed: () {
                /// Show delete dialog
                showDialog(
                  context: context,
                  builder: (context) {
                    return CartDeleteDialog(
                      onDeletePressed: viewModel.onDeletePressed,
                    );
                  },
                );
              },
              text: "Delete",
              type: ButtonType.flat,
              color: context.color.secondary,
              isInactive: viewModel.selectedCartItemList.isEmpty,
            ),
          ],
        ),
        body: CartLayout(
          /// CartItemList
          cartItemList: viewModel.cartItemList.isEmpty
              ? const CartEmpty()
              : ListView.builder(
                  itemCount: viewModel.cartItemList.length,
                  itemBuilder: (context, index) {
                    final cartItem = viewModel.cartItemList[index];
                    return CartItemTile(
                      cartItem: cartItem,
                      onPressed: () {
                        viewModel.onCartItemPressed(index);
                      },
                      onCountChanged: (count) {
                        viewModel.onCountChanged(index, count);
                      },
                    );
                  },
                ),

          /// CartBottomSheet
          cartBottomSheet: CartBottomSheet(
            totalPrice: viewModel.totalPrice,
            selectedCartItemList: viewModel.selectedCartItemList,
            onCheckoutPressed: () {
              /// Show checkout dialog
              showDialog(
                context: context,
                builder: (context) {
                  return CartCheckoutDialog(
                      onCheckoutPressed: viewModel.onCheckoutPressed);
                },
              );
            },
          ),
        ),
      ),
    );
  }
}
