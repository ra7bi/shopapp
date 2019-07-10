import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../providers/products_provider.dart';

enum FilterOptions { Favorites, All }

class ProductOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final productContainer = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              if (selectedValue == FilterOptions.Favorites) {
                
                productContainer.showFavoritesOnly();
              } else {
                productContainer.showAll();
              }
              print(selectedValue);
            },
            itemBuilder: (context) => [
                  PopupMenuItem(
                    child: Text(
                      "Only Favorites",
                    ),
                    value: FilterOptions.Favorites,
                  ),
                  PopupMenuItem(
                    child: Text(
                      "Show all",
                    ),
                    value: FilterOptions.All,
                  ),
                ],
          ),
        ],
      ),
      body: ProductGrid(),
    );
  }
}
