import 'package:flutter/foundation.dart';
import './cart.dart';

class OrdersItems {
  final String id;
  final double amount;
  final List<CartItem> products;
  final DateTime datetime;

  OrdersItems({
    @required this.id,
    @required this.amount,
    @required this.products,
    @required this.datetime,
  });
}



class Orders with ChangeNotifier {
  List<OrdersItems> _orders = [];

  List<OrdersItems> get orders {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrdersItems(
          id: DateTime.now().toString(),
          amount: total,
          datetime: DateTime.now(),
          products: cartProducts),
    );
    notifyListeners() ;

  }

  void removeItem(String productId){
    _orders.remove(productId);
    notifyListeners();
  }


  
}
