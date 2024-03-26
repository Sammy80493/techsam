import 'package:flutter/cupertino.dart';

class Routes {
  static Future<dynamic> pushAndRemoveUntil(
      Widget widget, BuildContext context) {
    return Navigator.pushAndRemoveUntil(
        context, CupertinoPageRoute(builder: (_) => widget), (route) => false);
  }

  static Future<dynamic> push(Widget widget, BuildContext context) {
    return Navigator.push(
      context,
      CupertinoPageRoute(builder: (_) => widget),
    );
  }

  static Future<dynamic> pushReplacement(Widget widget, BuildContext context) {
    return Navigator.pushReplacement(
      context,
      CupertinoPageRoute(builder: (_) => widget),
    );
  }

  static Future<dynamic> pop(BuildContext context) async {
    return Navigator.pop(context);
  }
}
