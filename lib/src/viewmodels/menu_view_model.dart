import 'package:s_shop_lao/src/models/menu_item.dart';
import 'package:s_shop_lao/src/viewmodels/base_view_model.dart';

import '../models/cart_item.dart';
import '../services/cart_service.dart';

class MenuViewModel extends BaseViewModel {
  MenuViewModel({
    required this.cartService,
    required this.menuItems,
  });

  final CartService cartService;

  /// 선택한 상품
  final MenuItem menuItems;

  /// 선택한 수량
  int count = 1;

  /// 선택한 색상

  /// 수량 업데이트 이벤트 함수
  void onCountChanged(int newCount) {
    count = newCount;
    notifyListeners();
  }

  /// 색상 업데이트 이벤트 함수


  /// 카트에 상품 추가
  void onAddToCartPressed() {
    final CartItem newCartItem = CartItem(
      menuItem: menuItems,
      count: count,
      isSelected: true,
    );
    cartService.add(newCartItem);
    // Toast.show(S.current.productAdded(product.name));
  }
}
