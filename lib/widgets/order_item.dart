import 'package:flutter/material.dart';
import '../providers/orders.dart' as ord;

import 'dart:math';

class OrderItemW extends StatefulWidget {
  final ord.OrdersItems order;
  OrderItemW(this.order);

  @override
  _OrderItemWState createState() => _OrderItemWState();
}

class _OrderItemWState extends State<OrderItemW> {
  var _expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text("\$ ${widget.order.amount}"),
            subtitle: Text("Date ${widget.order.datetime}"),
            trailing: IconButton(
                icon: Icon(_expanded ? Icons.expand_more : Icons.expand_less),
                onPressed: () {
                  setState(() {
                    _expanded = !_expanded;
                  });
                }),
          ),
          if (_expanded)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
              height: min(widget.order.products.length * 20.0 + 50, 100),
              child: ListView(
                  children: widget.order.products
                      .map((prod) => Row(
                            children: <Widget>[
                              Text(
                                prod.title,
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                ' ${prod.quantity} x \$${prod.price}',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.grey,
                                ),
                              )
                            ],
                          ))
                      .toList()),
            )
        ],
      ),
    );
  }
}
