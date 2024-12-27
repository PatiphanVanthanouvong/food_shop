import 'package:flutter/material.dart';

import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';

import '../../../../themes/component/rating.dart';

class MenuDescription extends StatelessWidget {
  const MenuDescription({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          /// Title
          Row(
            children: [
              Expanded(
                child: Text(
                "Description",
                  style: context.typo.headline4.copyWith(
                    fontWeight: context.typo.semiBold,
                  ),
                ),
              ),

              /// Rating
              // Rating(rating: menuItem.rating),
            ],
          ),

          const SizedBox(height: 24),

          /// Content
          Text(
            menuItem.description.toString(),
            style: context.typo.headline6.copyWith(
              color: context.color.subtext,
            ),
          ),
        ],
      ),
    );
  }
}
