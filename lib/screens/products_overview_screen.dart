import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../widgets/product_grid.dart';
import '../widgets/badge.dart';
import '../providers/cart.dart';
import '../screens/cart_screen.dart';
import '../widgets/app_drawer.dart';

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
            itemBuilder: (_) => [
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

          Consumer<Cart>(
            builder: (_, cartObj, ch) => Badge(
                  child: ch,
                  value: cartObj.itemCount.toString(),
                ),
            child: IconButton(
              icon: Icon(
                Icons.shopping_basket
                ),
                 onPressed: (){
                   Navigator.of(context).pushNamed(CartScreen.routeName);
                 },
            ),
          )
        ],
      ),
      drawer: MyAppDrawer(),
      body: ProductGrid(_showOnlyFavoritesData),
    );
  }
}
