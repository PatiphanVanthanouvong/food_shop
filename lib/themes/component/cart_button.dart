import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:s_shop_lao/src/views/cart/cart_view.dart';
import 'package:s_shop_lao/themes/component/counter_badge.dart';

import '../../src/services/cart_service.dart';
import 'button/button.dart';

class CartButton extends StatelessWidget {
  const CartButton({super.key});

  @override
  Widget build(BuildContext context) {
    // int count = context.watch<CartService>().cartItemList.length;
    var count = 1;
    return CounterBadge(
      label: "$count",
      isShow: count > 0,
      child: Button(
        icon: 'basket',
        type: ButtonType.flat,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartView(),
              ));
        },
      ),
    );
  }
}
