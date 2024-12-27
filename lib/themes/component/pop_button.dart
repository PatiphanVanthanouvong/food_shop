
import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import 'button/button.dart';

class PopButton extends StatelessWidget {
  const PopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Button(
      icon: 'arrow-left',
      color: context.color.text,
      type: ButtonType.flat,
      onPressed: () => Navigator.pop(context),
    );
  }
}
