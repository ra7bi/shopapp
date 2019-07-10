import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String mapKey;


  CartItem({this.id, this.price, this.quantity, this.title,this.mapKey});

  @override
  Widget build(BuildContext context) {

    return Dismissible(
      key: ValueKey(id),
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(Icons.delete,size: 40,color: Colors.white,),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        //Same like the Card below
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        ),
        //Right to left swiping 
        direction: DismissDirection.endToStart,

        onDismissed: (direction){
          //False because we don't want to rebuild after notifying others 
          Provider.of<Cart>(context,listen: false).deleteItem(mapKey);

        },
        child: Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 4),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: ListTile(
            leading: Container(
                child: CircleAvatar(
              child: Padding(
                padding: const EdgeInsets.all(3),
                child: FittedBox(child: Text("\$ $price")),
              ),
            )),
            title: Text(title),
            subtitle: Text("Total:  \$${price * quantity}"),
            trailing: Text("X $quantity",style: TextStyle(fontSize: 10),),
          ),
        ),
      ),
    );
  }
}
