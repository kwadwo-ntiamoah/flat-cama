import 'package:cama_mod/views/models/cart.dart';
import 'package:flutter/cupertino.dart';

import '../views/models/Item/item.dart';

class CartModel extends ChangeNotifier {
  final List<CartItem> _cartItems = [];
  double _cartTotalAmount = 0;

  int get cartLength => _cartItems.length;
  double get cartTotalAmount => _cartTotalAmount;
  List<CartItem> get cartItems => _cartItems;

  void addToCart(Item item, int quantity) {
    var cartItem = CartItem(quantity: quantity, item: item);
    _cartItems.add(cartItem);
    _getCartTotalAmount();

    notifyListeners();
  }

  void removeFromCart(int itemId) {
    List<CartItem> items =
        _cartItems.where((element) => element.item.id == itemId).toList();
    _cartItems.remove(items[0]);
    _getCartTotalAmount();

    notifyListeners();
  }

  void _getCartTotalAmount() {
    if (_cartItems.isEmpty) {
      _cartTotalAmount = 0;
    }
    else {
      for (var element in _cartItems) {
        _cartTotalAmount += element.item.price * element.quantity;
      }
    }
  }
}
