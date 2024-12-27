import 'order_item.dart';
import 'user.dart';

class Order {
  final String id;
  final String userId;
  final User? user; // Expanded user relationship
  final List<OrderItem> orderItems; // Related order items
  final double totalPrice;
  final bool isDelivery; // true for delivery, false for pickup
  final String? deliveryAddress;
  final String? pickupTime; // For pickup orders
  final String status; // e.g., "Pending", "Confirmed", "Delivered", etc.
  final DateTime createdAt;

  Order({
    required this.id,
    required this.userId,
    this.user,
    required this.orderItems,
    required this.totalPrice,
    required this.isDelivery,
    this.deliveryAddress,
    this.pickupTime,
    required this.status,
    required this.createdAt,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      userId: json['user'],
      user: json['expand']?['user'] != null
          ? User.fromJson(json['expand']['user'])
          : null,
      orderItems: (json['expand']?['order_items'] ?? [])
          .map<OrderItem>((item) => OrderItem.fromJson(item))
          .toList(),
      totalPrice: (json['totalPrice'] as num).toDouble(),
      isDelivery: json['isDelivery'],
      deliveryAddress: json['deliveryAddress'],
      pickupTime: json['pickupTime'],
      status: json['status'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': userId,
      'expand': {
        'user': user?.toJson(),
        'order_items': orderItems.map((item) => item.toJson()).toList(),
      },
      'totalPrice': totalPrice,
      'isDelivery': isDelivery,
      'deliveryAddress': deliveryAddress,
      'pickupTime': pickupTime,
      'status': status,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
