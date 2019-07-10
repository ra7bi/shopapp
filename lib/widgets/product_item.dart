import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../screens/product_detail.dart';
import 'package:provider/provider.dart';
import '../providers/product.dart';

class ProductItem extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {

    // Get object but i dont care about the change
   final Product _product = Provider.of<Product>(context);

   // I dont want to change on this widgets  i want only to add , 
   // cart widget should change not this
   final Cart _cart = Provider.of<Cart>(context, listen: false);    
    // Rounded Border
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: GestureDetector(
            child: Image.network(
              _product.imageUrl,
              fit: BoxFit.cover,
            ),
            onTap: () => {
                  Navigator.of(context)
                      .pushNamed(ProductDetail.routeName, arguments: _product.id)
                },
          ),
        ),
        header: Text("\$${_product.price}"),
        footer: GridTileBar(
            backgroundColor: Colors.black87,
            //Here i care about the change so i used consumer of Product notifier 
            leading: Consumer<Product>(
              builder: (context,product,_)=>IconButton(
                //The icon get changed when provider send change notification 
                icon: Icon(product.isFavorite ? Icons.favorite : Icons.favorite_border),
                color: Theme.of(context).accentColor,
                onPressed: () 
                {
                 product.toggleFavoritesStatus();
                },
              ),
            ),
            trailing: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
             
                _cart.addItem(_product.id,_product.price,_product.title);
              },
              color: Theme.of(context).accentColor,
            ),
            title: FittedBox(
                          child: Text(
                " - ${_product.title}",
                textAlign: TextAlign.center,
              ),
            )),
      ),
    );
  }
}
