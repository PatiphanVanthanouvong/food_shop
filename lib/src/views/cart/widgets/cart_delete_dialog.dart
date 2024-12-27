
import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import '../../../../themes/component/base_dialog.dart';
import '../../../../themes/component/button/button.dart';

class CartDeleteDialog extends StatelessWidget {
  const CartDeleteDialog({
    super.key,
    required this.onDeletePressed,
  });

  final void Function() onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return BaseDialog(
      title: 'Delete',
      content: Text(
        'Are you sure you want to delete?',
        style: context.typo.headline6,
      ),
      actions: [
        /// Delete
        Button(
          text:"Delete",
          width: double.infinity,
          color: context.color.onSecondary,
          backgroundColor: context.color.secondary,
          onPressed: () {
            Navigator.pop(context);
            onDeletePressed();
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
