import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/themes/res/layout.dart';

import '../../../../themes/component/bottom_sheet/base_bottom_sheet.dart';
import '../../../../themes/component/button/button.dart';
import '../../../../themes/component/counter_button.dart';

class MenuBottomSheet extends StatelessWidget {
  const MenuBottomSheet({
    super.key,
    required this.count,
    required this.menuItem,
    required this.onCountChanged,
    required this.onAddToCartPressed,
  });

  final int count;
  final MenuItem menuItem;
  final void Function(int count) onCountChanged;
  final void Function() onAddToCartPressed;

  @override
  Widget build(BuildContext context) {
    return BaseBottomSheet(
      isRoundAll: context.layout(false, desktop: true),
      padding: EdgeInsets.only(
        top: context.layout(32, desktop: 16),
        bottom: 16,
        left: 16,
        right: 16,
      ),
      child: Wrap(
        runSpacing: 16,
        children: [
          Row(
            children: [
              Text(
                'Quantity',
                style: context.typo.headline3,
              ),
              const Spacer(),

              /// CounterButton
              CounterButton(
                count: count,
                onChanged: onCountChanged,
              ),
            ],
          ),

          Row(
            children: [
              Text(
                "Total Price",
                style: context.typo.headline3,
              ),
              const Spacer(),

              /// 금액
              Text(
                "\$${menuItem.price * count}",
                style: context.typo.headline3.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),

          /// 카트에 담기
          Button(
            width: double.infinity,
            size: ButtonSize.large,
            text: "Add to Cart",
            onPressed: onAddToCartPressed,
          ),
        ],
      ),
    );
  }
}
