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
    final product = Provider.of<Products>(context,listen: false).findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
    );
  }
}
