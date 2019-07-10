import 'package:flutter/foundation.dart';
//TODO::Here is how to use Provider

//1- This class will tell all subscribers about any change on it (Notifier)

//2- Now i should go to the place where im interested about the change and put listeners

// On this case product_item need to know if i mark this as favorite //TODO::Go to Product_item

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final double price;
  final String imageUrl;
  bool isFavorite;
  int totalCard = 0;
  

  Product({
    @required this.id,
    @required this.title,
    @required this.description,
    @required this.price,
    @required this.imageUrl,
    this.isFavorite = false,
  });

  void toggleFavoritesStatus(){
    isFavorite = !isFavorite;
    print("Changed ===> ${isFavorite}");
    //Tell all Listeners if the object changed 
    notifyListeners();
  }

}
