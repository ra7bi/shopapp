import 'package:flutter/material.dart';
import '../screens/order_screen.dart';

class MyAppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text("Hello friends!"),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Shop"),
            onTap: (){
              //Back to root screen
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
           Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text("Orders"),
            onTap: (){
              //Back to root screen
              Navigator.of(context).pushReplacementNamed(OrderScreen.routeName);
            }
          )
        ],
      ),
    );
  }
}
