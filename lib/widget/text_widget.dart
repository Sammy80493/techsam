import 'package:flutter/material.dart';
import 'package:sammyajax/util/constants.dart';

class TextWidget extends StatelessWidget {
  final String txt;
  final double fontsize;
  final FontWeight fontWeight;
  final String fontFamily;
  final int? maxLines;
  final TextOverflow? textOverflow;
  final Color color;
  final TextAlign? textAlign;
  const TextWidget({
    super.key,
    required this.txt,
    this.fontsize = 18,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = Constants.garamond_regular,
    this.maxLines,
    this.textOverflow,
    this.color = Colors.black,
    this.textAlign,
  });

  @override
  Widget build(BuildContext context) {
    var textScaler = MediaQuery.of(context).textScaler;
    return Text(
      maxLines: maxLines,
      txt,
      textAlign: textAlign,
      style: TextStyle(
        overflow: textOverflow,
        fontFamily: fontWeight != FontWeight.bold
            ? Constants.garamond_regular
            : Constants.garamond_bold,
        color: color,
        fontWeight: fontWeight,
        fontSize: textScaler.scale(fontsize),
      ),
    );
  }
}
