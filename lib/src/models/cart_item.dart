import 'package:s_shop_lao/src/models/menu_item.dart';

class CartItem {
  final MenuItem menuItem;

  final int count;

  final bool isSelected;

  const CartItem({
    required this.menuItem,
    required this.count,
    required this.isSelected,
  });

  CartItem copyWith({
    MenuItem? menuItem,
    int? count,
    bool? isSelected,
  }) {
    return CartItem(
      menuItem: menuItem ?? this.menuItem,
      count: count ?? this.count,
      isSelected: isSelected ?? this.isSelected,
    );
  }
}
