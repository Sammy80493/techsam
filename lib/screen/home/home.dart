// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:techsam/helper/firebase_store_helper.dart';
import 'package:techsam/model/category_model.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/widget/best_product_widget.dart';
import 'package:techsam/widget/category_widget.dart';
import 'package:techsam/widget/searchbar_widget.dart';
import 'package:techsam/widget/text_widget.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //Controller for the search Bar
  final searchController = TextEditingController();

  //Fetch category item
  List<Categories> getCategoryItem = [];
  List<Products> getProductList = [];

  //Loaing boolean variable
  bool isLoading = false;

  @override
  void initState() {
    getCategory();
    super.initState();
  }

//Logic for fetching of category item
  void getCategory() async {
    setState(() {
      isLoading = true;
    });
    getCategoryItem =
        await FirebaseStoreHelper.firebaseStoreHelper.getCategoryList(context);
    getProductList =
        await FirebaseStoreHelper.firebaseStoreHelper.getProductList(context);
    getProductList.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var textScaler = MediaQuery.of(context).textScaler;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: isLoading
            ? Center(
                child: Constants.showLoader(size: 20),
              )
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const TextWidget(
                      txt: 'SamTex Accessories',
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    searchbar_widget(
                        searchController: searchController,
                        textScaler: textScaler),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          const TextWidget(
                            txt: 'Categories',
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            width: width,
                            height: height * 0.12,
                            child: getCategoryItem.isEmpty
                                ? Constants.showLoader(size: 20)
                                : categorie_item(
                                    getCategoryList: getCategoryItem,
                                  ),
                          ),
                          SizedBox(
                            height: height * 0.02,
                          ),
                          const TextWidget(
                            txt: 'Best Products',
                            fontWeight: FontWeight.bold,
                            fontsize: 20,
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          //For Products
                          Expanded(
                            child: getProductList.isEmpty
                                ? SizedBox(
                                    width: width,
                                    height: height * 0.5,
                                    child: Constants.showLoader(size: 20),
                                  )
                                : best_product(getProductList: getProductList),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
      ),
    );
  }
}
