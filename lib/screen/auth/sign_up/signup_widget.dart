// ignore_for_file: library_private_types_in_public_api, use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sammyajax/helper/firebase_auth_helper.dart';
import 'package:sammyajax/provider/validation_provider.dart';
import 'package:sammyajax/screen/auth/login/login_widget.dart';
import 'package:sammyajax/screen/home/home.dart';
import 'package:sammyajax/util/constants.dart';
import 'package:sammyajax/util/route.dart';
import 'package:sammyajax/widget/btn_widget.dart';
import 'package:sammyajax/widget/input_widget.dart';
import 'package:sammyajax/widget/text_widget.dart';
import 'package:toastification/toastification.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({super.key});

  @override
  _SignupWidgetState createState() => _SignupWidgetState();
}

class _SignupWidgetState extends State<SignupWidget> {
  //Controllers for getting our input from the user
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final pwdController = TextEditingController();

//Passoerd visibility
  bool obscureState = true;

  //Global key for Form Validation
  final formKey = GlobalKey<FormState>();

  //Clear textformfield
  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    phoneController.dispose();
    pwdController.dispose();
    super.dispose();
  }

//Focus node use to control the textformfield focus
  final FocusNode name = FocusNode();
  final FocusNode email = FocusNode();
  final FocusNode phone = FocusNode();
  final FocusNode pwd = FocusNode();

//For
  @override
  void initState() {
    super.initState();
    name.dispose();
    email.dispose();
    phone.dispose();
    pwd.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    // var width = MediaQuery.of(context).size.width;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        automaticallyImplyLeading: false,
      ),
      body: Consumer<Validations>(
        builder: (context, value, child) => SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    const TextWidget(
                      txt: 'Create Account',
                      fontWeight: FontWeight.bold,
                      fontsize: 25,
                    ),
                    const TextWidget(
                      txt: 'Welcome to DoshTex',
                      fontsize: 23,
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InputWidget(
                      controller: nameController,
                      suffixIcon: null,
                      textInputType: TextInputType.text,
                      prefixIcon: Icons.person_2_outlined,
                      obscureText: false,
                      labelTitle: 'Name',
                      errorTitle: 'Name is Required',
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InputWidget(
                      controller: emailController,
                      suffixIcon: null,
                      textInputType: TextInputType.emailAddress,
                      prefixIcon: Icons.email_outlined,
                      obscureText: false,
                      labelTitle: 'Email',
                      errorTitle: 'Email is Required',
                    ),
                    SizedBox(
                      height: height * 0.025,
                    ),
                    InputWidget(
                      controller: phoneController,
                      suffixIcon: null,
                      textInputType: TextInputType.number,
                      prefixIcon: Icons.phone,
                      obscureText: false,
                      labelTitle: 'Phone',
                      errorTitle: 'Phone No is Required',
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
                      btnTitle: 'Create Account',
                      onPressed: () async {
                        final form = formKey.currentState!;
                        if (form.validate()) {
                          if (value.signupValidators(
                              nameController.text,
                              emailController.text,
                              phoneController.text,
                              pwdController.text,
                              context)) {
                            bool data = await FirebaseAuthOps.firebaseAuthOps
                                .sign(emailController.text, pwdController.text,
                                    context);
                            if (data) {
                              Constants.alertMsg(
                                  context,
                                  'Success',
                                  'Login Successfull',
                                  ToastificationType.success);
                              Routes.pushAndRemoveUntil(const Home(), context);
                            }
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
                            txt: "Already have account?",
                            fontsize: 23,
                          ),
                          GestureDetector(
                            onTap: () {
                              Routes.push(const LoginWidget(), context);
                            },
                            child: TextWidget(
                              txt: 'Login',
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
