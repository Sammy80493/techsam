// ignore_for_file: camel_case_types, must_be_immutable

import 'package:flutter/material.dart';
import 'package:techsam/model/category_model.dart';

class categorie_item extends StatelessWidget {
  List<Categories> getCategoryList;
  final Function()? onTap;
  categorie_item({
    super.key,
    required this.getCategoryList,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: getCategoryList.length,
      itemBuilder: (BuildContext context, int index) {
        print(getCategoryList[index].imgPath);
        return GestureDetector(
          onTap: onTap,
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
                  child: Image.network(getCategoryList[index].imgPath)),
            ),
          ),
        );
      },
    );
  }
}
