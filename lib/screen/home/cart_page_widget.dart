// ignore_for_file: library_private_types_in_public_api

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:techsam/provider/app_provider.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/widget/iconbtn_widget.dart';
import 'package:techsam/widget/text_widget.dart';
import 'package:toastification/toastification.dart';

class CartPageWidget extends StatefulWidget {
  const CartPageWidget({
    super.key,
  });

  @override
  _CartPageWidgetState createState() => _CartPageWidgetState();
}

class _CartPageWidgetState extends State<CartPageWidget> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const TextWidget(
          txt: 'Cart Page',
          fontWeight: FontWeight.bold,
          fontsize: 20,
        ),
      ),
      body: Consumer<ShopProvider>(
        builder: (BuildContext context, value, Widget? child) => value
                .productsItem.isEmpty
            ? const Center(
                child: TextWidget(txt: 'Cart is Empty'),
              )
            : ListView.builder(
                itemCount: value.production.length,
                itemBuilder: (BuildContext context, int index) => Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: Container(
                    height: height * 0.2,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Constants.generalBg),
                    ),
                    child: Row(
                      children: <Widget>[
                        Container(
                          padding: const EdgeInsets.all(5),
                          color: Constants.generalBg.withOpacity(0.1),
                          child: CachedNetworkImage(
                            imageUrl: value.productsItem[index].image,
                            height: height,
                            width: width * 0.3,
                            placeholder: (context, url) =>
                                Constants.showLoader(size: 20),
                            filterQuality: FilterQuality.high,
                            fadeInCurve: Curves.easeInBack,
                            errorWidget: (context, url, error) => Center(
                              child: Constants.showLoader(size: 20),
                            ),
                            fadeOutCurve: Curves.easeInQuart,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              const TextWidget(
                                txt: '',
                                // txt: value.productsItem[index].name,
                                fontWeight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              SizedBox(
                                height: height * 0.01,
                              ),
                              Row(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(3),
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
                                    padding: const EdgeInsets.all(3),
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
                              ),
                              SizedBox(
                                height: height * 0.02,
                              ),
                              const TextWidget(
                                txt: 'Add to wishlist',
                                color: Constants.generalBg,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            children: [
                              TextWidget(
                                txt:
                                    '\$${value.productsItem[index].price.toString()}',
                                fontWeight: FontWeight.bold,
                                fontsize: 16,
                              ),
                              const Spacer(),
                              Container(
                                padding: const EdgeInsets.all(5),
                                decoration: const BoxDecoration(
                                    color: Constants.generalBg,
                                    shape: BoxShape.circle),
                                child: IconbtnWidget(
                                  onTap: () {
                                    value.removeCart(value.production[index]);
                                    Constants.alertMsg(
                                        context,
                                        'Success',
                                        'Remove from Cart',
                                        ToastificationType.success);
                                  },
                                  iconData: Icons.delete,
                                  color: Constants.white,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
      ),
    );
  }
}
