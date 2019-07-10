import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './screens/products_overview_screen.dart';
import './screens/product_detail.dart';

//Provider 
import './providers/products_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    //Register to provider 
    return ChangeNotifierProvider(
      //This provide object of Products
        builder: (ctx)=>Products(),
        
        child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'MyShop',
        theme: ThemeData(
          primarySwatch: Colors.purple,
          accentColor: Colors.deepOrange,
          fontFamily: 'Lato'
        ),
        home: ProductOverviewScreen(),
        routes: {
          ProductDetail.routeName : (ctx) => ProductDetail(),

        },
      ),
    );
  }
}

