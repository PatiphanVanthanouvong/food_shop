import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import '../../../../themes/component/asset_icon.dart';
import '../../../../themes/component/counter_button.dart';
import '../../../models/cart_item.dart';

class CartItemTile extends StatelessWidget {
  const CartItemTile({
    super.key,
    required this.cartItem,
    required this.onPressed,
    required this.onCountChanged,
  });

  final CartItem cartItem;
  final void Function() onPressed;
  final void Function(int count) onCountChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Stack(
              children: [
                /// Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(cartItem.menuItem.imageUrl.toString(),
                      width: 100,
                      height: 100,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          const Center(
                            child: Icon(
                              Icons.error,
                              color: Colors.red,
                            ),
                          )),
                ),

                /// Check icon
                AssetIcon(
                  cartItem.isSelected ? 'check' : 'uncheck',
                  color: cartItem.isSelected
                      ? context.color.primary
                      : context.color.inactive,
                  size: 32,
                ),
              ],
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  /// Name
                  Text(
                    cartItem.menuItem.name.toString(),
                    style: context.typo.headline5,
                  ),

                  const SizedBox(height: 12),

                  Row(
                    children: [
                      /// Price
                      Text(
                        "price",
                        style: context.typo.subtitle1.copyWith(
                          color: context.color.subtext,
                        ),
                      ),
                      const Spacer(),

                      /// CounterButton
                      CounterButton(
                        count: cartItem.count,
                        onChanged: onCountChanged,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
