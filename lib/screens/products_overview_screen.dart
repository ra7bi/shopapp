import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';

enum FilterOptions { Favorites, All }

// I convert it to StatefulWidget because i dont want to affect other screen with this changes so i dont need notifier

//This screen now will not intract with the provider or notifier  , Grid widget will do that .
class ProductOverviewScreen extends StatefulWidget {
  @override
  _ProductOverviewScreenState createState() => _ProductOverviewScreenState();
}

void filterData(BuildContext conx) {}

class _ProductOverviewScreenState extends State<ProductOverviewScreen> {
  var _showOnlyFavoritesData = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("MyShop"),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
                if (selectedValue == FilterOptions.Favorites) {
                  _showOnlyFavoritesData = true;
                } else {
                  _showOnlyFavoritesData = false;
                }
              });
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

                  //Consumer will rebuild the following widget only without parent tree 
                  Consumer<Cart>(
                    //TODO:: Explain how consumer works 
                    //All which inside Builder will rebuilt 
                    //ch will be automaticaly passed to the builder by flutter in our case IconButton 
                    // will be passed in ch 

                    // In general im passing IconButton to Badge widget with new cartObj
                    // IconButton is static would not rebuilt again .
                    builder: (_, cartObj, ch) =>
                    Badge(
                      value: cartObj.itemCount.toString(), 
                      child: Icon(Icons.shopping_cart),
                      ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () {

                      },
                    ),
                  )

        ],
        
      ),
      body: ProductGrid(_showOnlyFavoritesData),
    );
  }
}
