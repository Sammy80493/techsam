// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:techsam/helper/firebase_store_helper.dart';
import 'package:techsam/model/category_model.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/widget/category_detail_widget.dart';
import 'package:techsam/widget/text_widget.dart';

class CategoryItemDetail extends StatefulWidget {
  final Categories categories;
  const CategoryItemDetail({
    super.key,
    required this.categories,
  });

  @override
  _CategoryItemDetailState createState() => _CategoryItemDetailState();
}

class _CategoryItemDetailState extends State<CategoryItemDetail> {
  //Fetch category item
  List<Products> getCategoryDetails = [];

  //Loaing boolean variable
  bool isLoading = false;

  @override
  void initState() {
    getCategory();
    super.initState();
  }

//Logic for fetching of category details
  getCategory() async {
    setState(() {
      isLoading = true;
    });
    getCategoryDetails = await FirebaseStoreHelper.firebaseStoreHelper
        .getCategoryListDetails(context, widget.categories.id);

    getCategoryDetails.shuffle();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: TextWidget(
          txt: widget.categories.name,
          fontsize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      body: isLoading
          ? Constants.showLoader(size: 20)
          : Padding(
              padding: const EdgeInsets.all(20),
              child: getCategoryDetails.isEmpty
                  ? const Center(
                      child: TextWidget(
                        txt: 'No Item',
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  : category_detail_widget(
                      getCategoryDetails: getCategoryDetails),
            ),
    );
  }
}
