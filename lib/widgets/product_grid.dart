import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductGrid extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // Listener , This mean we want to communicate with the provider
    final  productsData = Provider.of<Products>(context);
    
    final products = productsData.items;

    print("-------->${products.length}");

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: productsData.items.length,

      //TODO:: Need to setup a provider for each product in the Grid (Listener)
      // Listen for any change in any object created from Product with ChangeNotifier
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
            // Setup listenr for each product in products list 
            value: products[index],
            child: ProductItem(),
          ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
