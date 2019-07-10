import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//Import only Cart class not CartItem from cart.dart
import '../providers/cart.dart' show Cart;
import '../widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static final routeName = 'cart/';

  @override
  Widget build(BuildContext context) {
    //Get the provider
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your cart"),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text("Total Amount :  ",
                      style: Theme.of(context).textTheme.body1),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text("\$ ${cart.totalAmount}",
                        style: TextStyle(
                            color: Theme.of(context).textTheme.title.color,
                            fontSize: 20)),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  FlatButton(
                    child: Text("Order now"),
                    onPressed: () {
                      print("ORDER NOW");
                    },
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: cart.itemCount,
                itemBuilder: (ctx, index) {
                  return CartItem(
                      id: cart.items.values.toList()[index].id,
                      title: cart.items.values.toList()[index].title,
                      price: cart.items.values.toList()[index].price,
                      quantity: cart.items.values.toList()[index].quantity,
                      //Passing the key of the map not the value
                      mapKey: cart.items.keys.toList()[index],
                      );
                }),
          ),
        ],
      ),
    );
  }
}
