
import 'package:flutter/material.dart';
import 'package:sammyajax/widget/text_widget.dart';

class OutlineBtnWidget extends StatelessWidget {
  final Function()? onPressed;
  final String btnTitle;
  const OutlineBtnWidget({
    super.key,
    this.onPressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextWidget(
          txt: btnTitle,
          fontsize: 17,
          color: Theme.of(context).colorScheme.primary,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
