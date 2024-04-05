import 'package:flutter/material.dart';
import 'package:techsam/model/product_model.dart';

class ShopProvider extends ChangeNotifier {
  bool isFav = false;
  // int itemNumber = 0;
  List<Products> productsItem = [];
  addCart(Products products) {
    productsItem.add(products);
    notifyListeners();
  }

  removeCart(Products products) {
    productsItem.remove(products);
    notifyListeners();
  }

  List<Products> get production => productsItem;
  isFavourite() {
    isFav = !isFav;
    notifyListeners();
  }

  itemAddition(int itemNumber) {
    if (itemNumber >= 1) {
      itemNumber++;
    }
    notifyListeners();
  }

  itemRemoval(int itemNumber) {
    if (itemNumber != 1) {
      itemNumber--;
    }
    notifyListeners();
  }
}
