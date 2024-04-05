import 'package:flutter/material.dart';
import 'package:techsam/util/constants.dart';
import 'package:techsam/widget/text_widget.dart';

class OutlineBtnWidget extends StatelessWidget {
  final Function()? onPressed;
  final String btnTitle;
  final Color backgroundColor;
  final Color titleColor;
  const OutlineBtnWidget({
    super.key,
    this.onPressed,
    required this.btnTitle,
    this.backgroundColor = Constants.white,
    this.titleColor = Constants.generalBg,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(backgroundColor: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextWidget(
          txt: btnTitle,
          fontsize: 17,
          color: titleColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
