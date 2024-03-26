// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:sammyajax/widget/text_widget.dart';
import 'package:toastification/toastification.dart';

class Constants {
  //For fonts
  static const garamond_bold = 'Garamond Bold';
  static const garamond_regular = 'Garamond Regular';

  //ImgUrl
  static const logo = 'lib/assets/images/5.png';

  //Default app color
  static Color generalBg = const Color.fromARGB(255, 226, 20, 20);
  //Shop name
  static const shopName = 'DoshTex';

  //For Succes Alert
  static void alertMsg(BuildContext context, String titleMsg, String descMsg,
          ToastificationType toastificationType) =>
      Toastification().show(
        context: context,
        type: toastificationType,
        title: TextWidget(
          txt: titleMsg,
          fontsize: 19,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
        alignment: Alignment.center,
        showProgressBar: true,
        autoCloseDuration: const Duration(seconds: 2),
        closeButtonShowType: CloseButtonShowType.always,
        description: Column(
          children: <Widget>[
            TextWidget(
              txt: descMsg,
              fontsize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            )
          ],
        ),
        style: ToastificationStyle.fillColored,
        progressBarTheme: const ProgressIndicatorThemeData(
            linearTrackColor: Colors.transparent, color: Colors.white),
      );

  //For Loading
  static showLoader({double size = 50}) => SpinKitChasingDots(
        color: generalBg,
        size: size,
      );

//Auth alert msg method
  static signUpEmailPwd(String errorMsg) {
    switch (errorMsg) {
      case 'network-request-failed':
        return 'No Internet Connection';
      case 'ERROR_INVALID_EMAIL':
        return 'Please enter the correct password';
      case 'user-not-found':
        return 'Email not found';
      case 'ERROR_TOO_MANY_REQUESTS':
        return 'Too many attempts please try later';
      case 'unknown':
        return 'Email and Password Fields are required';
      case 'user-disabled':
        return 'Account is disabled';
      case 'ERROR_USER_DISABLED':
        return 'Account is disabled';
      case 'ERROR_EMAIL_ALREADY_IN_USE':
        return 'Email has been used';
      case 'ERROR_ACCOUNT_EXISTS_WITH_DIFFERENT_CREDENTIAL':
        return 'Email has been used';
      case 'ERROR_INVALID_CREDENTIAL':
        return 'Invalid Credential';
      case 'weak_password':
        return 'Password is weak';
      case 'USER_NOT_FOUND':
        return 'User not register';
      case 'ERROR_WRONG_PASSWORD':
        return 'Wrong Password';

      default:
        return 'An Error Encountered';
    }
  }
}
