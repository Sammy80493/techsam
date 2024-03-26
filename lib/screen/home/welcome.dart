import 'package:flutter/material.dart';
import 'package:sammyajax/screen/auth/login/login_widget.dart';
import 'package:sammyajax/screen/auth/sign_up/signup_widget.dart';
import 'package:sammyajax/util/constants.dart';
import 'package:sammyajax/util/route.dart';
import 'package:sammyajax/widget/btn_widget.dart';
import 'package:sammyajax/widget/text_widget.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const TextWidget(
                  txt: 'Welcome',
                  fontWeight: FontWeight.bold,
                  fontsize: 25,
                ),
                const TextWidget(
                  txt: 'Buy your groceries from SamTex',
                  fontsize: 23,
                ),
                SizedBox(
                  height: height * 0.01,
                ),
                Image.asset(
                  Constants.logo,
                  fit: BoxFit.contain,
                  filterQuality: FilterQuality.high,
                  width: double.infinity,
                  height: height * 0.4,
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BtnWidget(
                  btnTitle: 'Login',
                  onPressed: () {
                    Routes.pushAndRemoveUntil(const LoginWidget(), context);
                  },
                ),
                SizedBox(
                  height: height * 0.02,
                ),
                BtnWidget(
                  btnTitle: 'Sign up',
                  onPressed: () {
                    Routes.pushAndRemoveUntil(const SignupWidget(), context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
