import 'package:flutter/material.dart';
import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/services/theme_service.dart';
import 'package:s_shop_lao/src/views/menu/menu_view.dart';
import '../../../../themes/component/rating.dart';

class MenuItemCard extends StatelessWidget {
  const MenuItemCard({
    super.key,
    required this.menuItem,
  });

  final MenuItem menuItem;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => MenuView(menuItem: menuItem)),
        );
      },
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: context.color.surface,
          boxShadow: context.deco.shadow,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Image
            if (menuItem.imageUrl != null)
              AspectRatio(
                aspectRatio: 1 / 1,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    menuItem.imageUrl!,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            const SizedBox(height: 4),

            /// Name
            Text(
              menuItem.name,
              style: context.typo.headline4.copyWith(
                fontWeight: context.typo.semiBold,
              ),
            ),
            const SizedBox(height: 4),

            /// Description
            Text(
              menuItem.description,
              style: context.typo.body2.copyWith(
                fontWeight: context.typo.light,
                color: context.color.subtext,
              ),
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                /// Price
                Expanded(
                  child: Text(
                    "\$${menuItem.price.toStringAsFixed(2)}",
                    style: context.typo.subtitle2,
                  ),
                ),

                /// Rating (assuming you have a rating field in MenuItem)
                // Rating(rating: menuItem.rating),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
