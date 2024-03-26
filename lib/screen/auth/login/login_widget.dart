// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sammyajax/helper/firebase_auth_helper.dart';
import 'package:sammyajax/provider/validation_provider.dart';
import 'package:sammyajax/screen/auth/sign_up/signup_widget.dart';
import 'package:sammyajax/screen/home/home.dart';
import 'package:sammyajax/util/route.dart';
import 'package:sammyajax/widget/btn_widget.dart';
import 'package:sammyajax/widget/input_widget.dart';
import 'package:sammyajax/widget/text_widget.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  _LoginWidgetState createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  //Controllers for working with the input text
  final userController = TextEditingController();
  final pwdController = TextEditingController();

  //For password Visiability setup
  bool obscureState = true;

  //Global key for Form Validation
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    userController.dispose();
    pwdController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: true,
      ),
      body: Consumer<Validations>(
        builder: (context, value, child) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TextWidget(
                      txt: 'Login',
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),
                    const TextWidget(
                      txt: 'Welcome back to the store',
                      fontsize: 23,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InputWidget(
                      controller: userController,
                      suffixIcon: null,
                      textInputType: TextInputType.text,
                      prefixIcon: Icons.email_outlined,
                      obscureText: false,
                      labelTitle: 'Email',
                      errorTitle: 'Email is Required',
                    ),
                    SizedBox(
                      height: height * 0.02,
                    ),
                    InputWidget(
                      controller: pwdController,
                      textInputType: TextInputType.text,
                      prefixIcon: Icons.password,
                      obscureText: obscureState,
                      suffixIcon: obscureState
                          ? Icons.visibility
                          : Icons.visibility_off,
                      onPressed: () {
                        setState(() {
                          obscureState = !obscureState;
                        });
                      },
                      labelTitle: 'Password',
                      errorTitle: 'Password is Required',
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    BtnWidget(
                      btnTitle: 'Login',
                      onPressed: () async {
                        final form = formKey.currentState!;
                        if (form.validate()) {
                          bool checks = value.loginValidators(
                              pwdController.text, userController.text, context);
                          if (checks) {
                            bool data = await FirebaseAuthOps.firebaseAuthOps
                                .login(userController.text, pwdController.text,
                                    context);
                            if (data) {
                              Routes.pushAndRemoveUntil(const Home(), context);
                            }
                            // Constants.alertMsg(
                            //     context,
                            //     'Success',
                            //     'Login Successfull',
                            //     ToastificationType.success);
                          }
                          form.reset();
                        }
                      },
                    ),
                    Container(
                      padding: const EdgeInsets.only(top: 15),
                      alignment: Alignment.center,
                      child: Column(
                        children: [
                          const TextWidget(
                            txt: "Don't have account?",
                            fontsize: 23,
                          ),
                          GestureDetector(
                            onTap: () {
                              Routes.push(const SignupWidget(), context);
                            },
                            child: TextWidget(
                              txt: 'Create account',
                              fontsize: 23,
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
