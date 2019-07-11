import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products_provider.dart';

class ProductDetail extends StatelessWidget {
  static final String routeName = "ProductDetailsScreen";

  @override
  Widget build(BuildContext context) {
    //We get the id where we want to show from tapped page
    final productId = ModalRoute.of(context).settings.arguments as String;

    // Get data from provider Listen:false , will not let flutter rebuild the widget because we dont need to
    final product =
        Provider.of<Products>(context, listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 300,
            width: double.infinity,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 20,
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(product.description, textAlign: TextAlign.left,style: TextStyle(fontSize: 19),softWrap: true,),
          ),

        ],
      ),
    );
  }
}
