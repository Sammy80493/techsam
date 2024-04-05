// ignore_for_file: use_build_context_synchronously

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:techsam/model/category_model.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/util/constants.dart';
import 'package:toastification/toastification.dart';

class FirebaseStoreHelper {
  //Instance of Firebase Helper
  static FirebaseStoreHelper firebaseStoreHelper = FirebaseStoreHelper();
  //Instance of FirebaseFirestore
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

//This get method returns the category list from the firebase cloud database
  Future<List<Categories>> getCategoryList(BuildContext context) async {
    try {
      //instance of QuerySnapshot
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collection('categories').get();
      List<Categories> categorieItem =
          querySnapshot.docs.map((e) => Categories.fromMap(e.data())).toList();

      return categorieItem;
    } catch (e) {
      Constants.alertMsg(
          context, 'Error', e.toString(), ToastificationType.error);
      return [];
    }
  }

  //This get method returns the product list from the firebase cloud database
  Future<List<Products>> getProductList(BuildContext context) async {
    try {
      //instance of QuerySnapshot
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore.collectionGroup('products').get();
      List<Products> productsItems =
          querySnapshot.docs.map((e) => Products.fromMap(e.data())).toList();
      return productsItems;
    } catch (e) {
      Constants.alertMsg(
          context, 'Error', e.toString(), ToastificationType.error);
      return [];
    }
  }

  Future<List<Products>> getCategoryListDetails(
      BuildContext context, String id) async {
    try {
      //instance of QuerySnapshot
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await firebaseFirestore
              .collection('categories')
              .doc(id)
              .collection('products')
              .get();
      List<Products> productsItems =
          querySnapshot.docs.map((e) => Products.fromMap(e.data())).toList();
      return productsItems;
    } catch (e) {
      Constants.alertMsg(
          context, 'Error', e.toString(), ToastificationType.error);
      return [];
    }
  }
}
