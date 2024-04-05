// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/provider/app_provider.dart';
import 'package:techsam/screen/home/cart_page_widget.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/util/route.dart';
import 'package:techsam/widget/iconbtn_widget.dart';
import 'package:techsam/widget/img_fetching_widget.dart';
import 'package:techsam/widget/outline_btn_widget.dart';
import 'package:techsam/widget/text_widget.dart';
import 'package:toastification/toastification.dart';

class ProductDetailsWidget extends StatefulWidget {
  final Products products;
  const ProductDetailsWidget({
    super.key,
    required this.products,
  });

  @override
  _ProductDetailsWidgetState createState() => _ProductDetailsWidgetState();
}

class _ProductDetailsWidgetState extends State<ProductDetailsWidget> {
  int qty = 1;
  @override
  void initState() {
    setState(() {
      qty = widget.products.qty;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: IconbtnWidget(
                onTap: () => Routes.push(const CartPageWidget(), context),
                iconData: Icons.shopping_cart),
          )
        ],
      ),
      body: Consumer<ShopProvider>(
        builder: (context, value, child) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ImgFetchingWidget(
                  imageUrl: widget.products.image,
                  aspectRatio: 1.2,
                ),
                Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: TextWidget(
                            txt: widget.products.name,
                            fontWeight: FontWeight.bold,
                            fontsize: 16,
                          ),
                        ),
                        IconbtnWidget(
                            onTap: () {
                              value.isFavourite();
                            },
                            iconData: value.isFav
                                ? Icons.favorite
                                : Icons.favorite_border_outlined)
                      ],
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    TextWidget(
                      txt: widget.products.description,
                      fontsize: 15,
                    ),
                    SizedBox(
                      height: height * 0.015,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Constants.generalBg,
                              shape: BoxShape.circle),
                          child: IconbtnWidget(
                            onTap: () {
                              // value.itemRemoval(qty);
                              if (qty != 1) {
                                setState(() {
                                  qty--;
                                });
                              }
                            },
                            iconData: Icons.remove,
                            color: Constants.white,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 5,
                          ),
                          width: width * 0.1,
                          child: TextWidget(
                            txt: qty.toString(),
                            fontWeight: FontWeight.bold,
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: const BoxDecoration(
                              color: Constants.generalBg,
                              shape: BoxShape.circle),
                          child: IconbtnWidget(
                            onTap: () {
                              // value.itemAddition(qty);
                              if (qty >= 1) {
                                setState(() {
                                  qty++;
                                });
                              }
                            },
                            iconData: Icons.add,
                            color: Constants.white,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                SizedBox(height: height * 0.05),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    OutlineBtnWidget(
                      btnTitle: 'ADD TO CART',
                      onPressed: () {
                        value.addCart(
                          widget.products.copyWith(qty: qty),
                        );
                        Constants.alertMsg(context, 'Success', 'Add to Cart',
                            ToastificationType.success);
                      },
                    ),
                    OutlineBtnWidget(
                      btnTitle: 'BUY',
                      backgroundColor: Constants.generalBg,
                      titleColor: Constants.white,
                      onPressed: () {},
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
