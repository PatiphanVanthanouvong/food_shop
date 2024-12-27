
import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import '../../../../themes/component/base_dialog.dart';
import '../../../../themes/component/button/button.dart';

class CartCheckoutDialog extends StatelessWidget {
  const CartCheckoutDialog({
    super.key,
    required this.onCheckoutPressed,
  });

  final void Function() onCheckoutPressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: "Checkout",
      content: Text(
        "Are you sure you want to checkout?",
        style: context.typo.headline6,
      ),
      actions: [
        /// Checkout
        Button(
          text: "Checkout",
          width: double.infinity,
          color: context.color.onPrimary,
          backgroundColor: context.color.primary,
          onPressed: () {
            Navigator.pop(context);
            onCheckoutPressed();
          },
        ),
        const SizedBox(height: 12),

        /// Cancel
        Button(
          text: "Cancel",
          width: double.infinity,
          color: context.color.text,
          borderColor: context.color.hint,
          type: ButtonType.outline,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ],
    );
  }
}
