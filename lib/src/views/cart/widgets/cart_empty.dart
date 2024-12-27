import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

class CartEmpty extends StatelessWidget {
  const CartEmpty({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Cart is empty",
        style: context.typo.headline4.copyWith(
          color: context.color.inactive,
          fontWeight: context.typo.light,
        ),
      ),
    );
  }
}
