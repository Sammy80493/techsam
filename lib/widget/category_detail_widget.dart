// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/widget/outline_btn_widget.dart';
import 'package:techsam/widget/text_widget.dart';

class category_detail_widget extends StatelessWidget {
  const category_detail_widget({
    super.key,
    required this.getCategoryDetails,
  });

  final List<Products> getCategoryDetails;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9 / 1,
        mainAxisSpacing: 9 / 1,
        childAspectRatio: 6 / 9,
      ),
      itemCount: getCategoryDetails.length,
      itemBuilder: (BuildContext context, int index) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Theme.of(context).colorScheme.primary.withOpacity(0.1),
          ),
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              AspectRatio(
                aspectRatio: 7 / 6,
                child: CachedNetworkImage(
                  imageUrl: getCategoryDetails[index].image,
                  errorWidget: (context, url, error) => Center(
                    child: Constants.showLoader(size: 20),
                  ),
                  placeholder: (context, url) => Constants.showLoader(size: 20),
                ),
              ),
              TextWidget(
                textAlign: TextAlign.center,
                maxLines: 1,
                fontsize: 16,
                txt: getCategoryDetails[index].name,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textOverflow: TextOverflow.clip,
              ),
              TextWidget(
                fontsize: 15,
                txt: '\$${getCategoryDetails[index].price}',
                color: Colors.black,
              ),
              OutlineBtnWidget(
                btnTitle: 'BUY',
                onPressed: () {},
              )
            ],
          ),
        );
      },
    );
  }
}
