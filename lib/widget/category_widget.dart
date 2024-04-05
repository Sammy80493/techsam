// ignore_for_file: camel_case_types

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:techsam/model/category_model.dart';
import 'package:techsam/screen/home/category_item_detail.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/util/route.dart';

class categorie_item extends StatelessWidget {
  const categorie_item({
    super.key,
    required this.getCategoryItem,
  });

  final List<Categories> getCategoryItem;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getCategoryItem.length,
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () => Routes.push(
              CategoryItemDetail(categories: getCategoryItem[index]), context),
          child: Card.filled(
            elevation: 4,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 3),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: AspectRatio(
                aspectRatio: 1.4,
                child: CachedNetworkImage(
                  imageUrl: getCategoryItem[index].image,
                  placeholder: (context, url) => Constants.showLoader(size: 20),
                  filterQuality: FilterQuality.high,
                  fadeInCurve: Curves.easeInBack,
                  errorWidget: (context, url, error) => Center(
                    child: Constants.showLoader(size: 20),
                  ),
                  fadeOutCurve: Curves.easeInQuart,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
