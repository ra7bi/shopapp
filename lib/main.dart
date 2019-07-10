import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail.dart';
import './screens/cart_screen.dart';

//Provider
import './providers/products_provider.dart';
import './providers/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Register to providers
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Products(),
        ),
        ChangeNotifierProvider.value(value: Cart())
      ],
      //All child's will be able to access all providers at the top

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
            textTheme: TextTheme(
              title: TextStyle(
                color: Colors.white,
                fontFamily: 'Lato',
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
              body1: TextStyle(
                color: Colors.purple,
                fontSize: 14,
                fontFamily: 'Anton'
                
                ),
              
            ),
            primarySwatch: Colors.purple,
            accentColor: Colors.deepOrange,
            fontFamily: 'Lato'),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetail.routeName: (ctx) => ProductDetail(),
          CartScreen.routeName: (ctx) => CartScreen(),
        },
      ),
    );
  }
}
