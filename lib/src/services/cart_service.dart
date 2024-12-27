import 'package:flutter/material.dart';
import 'package:s_shop_lao/utility/helper/immu_helper..dart';

import '../models/cart_item.dart';

class CartService with ChangeNotifier {
  List<CartItem> cartItemList = const [];

  List<CartItem> get selectedCartItemList {
    return cartItemList.where((cartItem) => cartItem.isSelected).toImmutable();
  }

  void add(CartItem newCartItem) {
    cartItemList = [...cartItemList, newCartItem].toImmutable();
    notifyListeners();
  }

  void update(int selectedIndex, CartItem newCartItem) {
    cartItemList = cartItemList.asMap().entries.map((entry) {
      return entry.key == selectedIndex ? newCartItem : entry.value;
    }).toImmutable();
    notifyListeners();
  }

  void delete(List<CartItem> deleteList) {
    cartItemList = cartItemList.where((cartItem) {
      return !deleteList.contains(cartItem);
    }).toImmutable();
    notifyListeners();
  }
}
