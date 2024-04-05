import 'package:flutter/material.dart';

class IconbtnWidget extends StatelessWidget {
  const IconbtnWidget({
    super.key,
    required this.onTap,
    required this.iconData,
    this.color = Colors.black,
  });
  final Function() onTap;
  final IconData iconData;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(iconData, color: color),
    );
  }
}
