import 'package:flutter/material.dart';
import 'package:techsam/widget/text_widget.dart';


class BtnWidget extends StatelessWidget {
  final String btnTitle;
  final Function()? onPressed;
  const BtnWidget({
    super.key,
    this.onPressed,
    required this.btnTitle,
  });

  @override
  Widget build(BuildContext context) {
    var sw = MediaQuery.of(context).size.width;
    var sh = MediaQuery.of(context).size.height;
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        fixedSize: Size(sw, sh * 0.06),
        shape: const RoundedRectangleBorder(),
      ),
      child: TextWidget(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontsize: 22,
        txt: btnTitle,
      ),
    );
  }
}
