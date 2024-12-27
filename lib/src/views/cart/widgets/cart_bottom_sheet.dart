
import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/themes/res/layout.dart';

import '../../../../themes/component/bottom_sheet/base_bottom_sheet.dart';
import '../../../../themes/component/button/button.dart';
import '../../../models/cart_item.dart';

class CartBottomSheet extends StatelessWidget {
  const CartBottomSheet({
    super.key,
    required this.totalPrice,
    required this.selectedCartItemList,
    required this.onCheckoutPressed,
  });

  final String totalPrice;
  final List<CartItem> selectedCartItemList;
  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    /// Bottom Sheet
    return BaseBottomSheet(
      isRoundAll: context.layout(false, desktop: true),
      padding: EdgeInsets.only(
        top: context.layout(32, desktop: 16),
        left: 16,
        right: 16,
        bottom: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          /// Selected Items
          Row(
            children: [
              Text(
               "Selected Items",
                style: context.typo.headline3,
              ),
              const Spacer(),
              Text(
                "${selectedCartItemList.length} items",
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// Total Price
          Row(
            children: [
              Text(
                "Total Price",
                style: context.typo.headline3,
              ),
              const Spacer(),
              Text(
                totalPrice,
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// Checkout
          Button(
            text: "Checkout",
            width: double.infinity,
            size: ButtonSize.large,
            isInactive: selectedCartItemList.isEmpty,
            onPressed: onCheckoutPressed,
          ),
        ],
      ),
    );
  }
}
