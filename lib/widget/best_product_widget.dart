// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:techsam/model/product_model.dart';
import 'package:techsam/widget/outline_btn_widget.dart';
import 'package:techsam/widget/text_widget.dart';

class best_product extends StatelessWidget {
  const best_product({
    super.key,
    required this.getProductList,
  });

  final List<Products> getProductList;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 9 / 1,
        mainAxisSpacing: 9 / 1,
        childAspectRatio: 6 / 9,
      ),
      itemCount: getProductList.length,
      itemBuilder: (BuildContext context, int index) {
        print(getProductList[index].imgPath);
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
                child: Image.network(getProductList[index].imgPath),
              ),
              TextWidget(
                textAlign: TextAlign.center,
                maxLines: 1,
                fontsize: 16,
                txt: getProductList[index].name,
                fontWeight: FontWeight.bold,
                color: Colors.black,
                textOverflow: TextOverflow.clip,
              ),
              TextWidget(
                fontsize: 15,
                txt: '\$${getProductList[index].price}',
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
