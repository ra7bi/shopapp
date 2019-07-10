import 'package:flutter/material.dart';
import '../widgets/product_item.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductGrid extends StatelessWidget {

  final bool  favoriteItem;

  ProductGrid(this.favoriteItem);

  @override
  Widget build(BuildContext context) {
    // Listener , This mean we want to communicate with the provider
    final  productsData = Provider.of<Products>(context);
    final products = favoriteItem ? productsData.favoriteItems : productsData.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) => ChangeNotifierProvider.value(
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
