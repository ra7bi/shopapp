import 'package:flutter/foundation.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.title,
      @required this.quantity,
      @required this.price});
}

class Cart with ChangeNotifier {

  //FIXME: YOU Must add {} to the map .
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items}; // Get a copy of _items map 
  }


  int get itemCount{

    return _items.length ;

  }
  double get totalAmount{
    var total = 0.0;
    _items.forEach((key, cartItem){
      total += cartItem.price * cartItem.quantity; 
    });
    return total;
  }


  void addItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      //Will get existingCartItem
      _items.update(
        productId,
        (existingCartItem) => CartItem(
            id: existingCartItem.id,
            title: existingCartItem.title,
            price: existingCartItem.price,
            quantity: existingCartItem.quantity + 1),
      );
    } else {
      _items.putIfAbsent(
          productId,
          () => CartItem(
              id: DateTime.now().toString(),
              title: title,
              price: price,
              quantity: 1));
    }
    print("Added");
    notifyListeners();
  }

  void deleteItem(String mapKey){
      _items.remove(mapKey);
      notifyListeners();

  }


}
