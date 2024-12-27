import 'menu_item.dart';

class OrderItem {
  final String id;
  final String orderId;
  final String menuItemId;
  final MenuItem? menuItem; // Expanded relationship
  final int quantity;
  final double price; // Price at the time of order

  OrderItem({
    required this.id,
    required this.orderId,
    required this.menuItemId,
    this.menuItem,
    required this.quantity,
    required this.price,
  });

  factory OrderItem.fromJson(Map<String, dynamic> json) {
    return OrderItem(
      id: json['id'],
      orderId: json['order'],
      menuItemId: json['menu_item'],
      menuItem: json['expand']?['menu_item'] != null
          ? MenuItem.fromJson(json['expand']['menu_item'])
          : null,
      quantity: json['quantity'],
      price: (json['price'] as num).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'order': orderId,
      'menu_item': menuItemId,
      'expand': {
        'menu_item': menuItem?.toJson(),
      },
      'quantity': quantity,
      'price': price,
    };
  }
}
