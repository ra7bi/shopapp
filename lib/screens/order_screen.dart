import 'package:flutter/material.dart';
import 'package:shop/providers/orders.dart';
import '../widgets/order_item.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';

class OrderScreen extends StatelessWidget {
  static final  routeName = "order-screen/";

  @override
  Widget build(BuildContext context) {

    final  _order = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Your Order"),
      ),
      drawer: MyAppDrawer(),
      body: Container(
        constraints: BoxConstraints.expand(),
        decoration: BoxDecoration(
          color: Color.fromARGB(255, 255, 255, 255),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              height: 130,
              margin: EdgeInsets.only(top: 94),
              child: ListView.builder(
                itemCount: _order.orders.length,
                itemBuilder: (context, index) => OrderItemW(_order.orders[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}