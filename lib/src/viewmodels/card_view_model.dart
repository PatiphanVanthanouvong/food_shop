import 'package:s_shop_lao/src/services/cart_service.dart';

import '../models/cart_item.dart';
import 'base_view_model.dart';

class CartViewModel extends BaseViewModel {
  CartViewModel({
    required this.cartService,
  }) {
    cartService.addListener(notifyListeners);
  }

  final CartService cartService;

  @override
  void dispose() {
    cartService.removeListener(notifyListeners);
    super.dispose();
  }

  /// 전체 CartItem
  List<CartItem> get cartItemList => cartService.cartItemList;

  /// 선택한 CartItem 목록
  List<CartItem> get selectedCartItemList => cartService.selectedCartItemList;

  /// 최종 가격
  int get totalPriceCalculation {
    if (selectedCartItemList.isEmpty) return 0;

    return selectedCartItemList.fold<int>(0, (prev, curr) {
      return prev + (curr.count * curr.menuItem.price);
    });
  }

  /// Format total price for display
  String get totalPrice {
    return totalPriceCalculation.toStringAsFixed(2);
  }

  /// 선택한 CartItem 삭제
  void onDeletePressed() {
    cartService.delete(cartService.selectedCartItemList);
    // Toast.show(S.current.deleteDialogSuccessToast);
  }

  /// CartItem 클릭
  void onCartItemPressed(int index) {
    final cartItem = cartItemList[index];
    cartService.update(
      index,
      cartItem.copyWith(
        isSelected: !cartItem.isSelected,
      ),
    );
  }

  /// CartItem 개수 변경
  void onCountChanged(int index, int count) {
    cartService.update(
      index,
      cartItemList[index].copyWith(
        count: count,
      ),
    );
  }

  // /// 선택한 CartItem 결제
  void onCheckoutPressed() {
    cartService.delete(cartService.selectedCartItemList);
    // Toast.show(S.current.checkoutDialogSuccessToast);
  }
}
