import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

class MenuPreview extends StatelessWidget {
  const MenuPreview({
    super.key,
    required this.menuItems,
  });

  final MenuItem menuItems;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.color.surface,
        borderRadius: BorderRadius.circular(24),
        boxShadow: context.deco.shadow,
      ),
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.symmetric(horizontal: 32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Image
          AspectRatio(
            aspectRatio: 1 / 0.8,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(24),
              child: Image.network(
                menuItems.imageUrl!,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),

          const SizedBox(height: 16),

          /// Name
          Text(
            menuItems.name.toString(),
            style: context.typo.headline1.copyWith(
              fontWeight: context.typo.semiBold,
            ),
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              /// Brand
              Text(
                menuItems.categoryName ?? "",
                style: context.typo.subtitle1.copyWith(
                  fontWeight: context.typo.light,
                  color: context.color.subtext,
                ),
              ),

              const Spacer(),

              /// Price
              Text(
                menuItems.price.toString(),
                style: context.typo.headline6.copyWith(
                  color: context.color.primary,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
