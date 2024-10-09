import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lati_marvel_movies/helper/consts.dart';
import 'package:lati_marvel_movies/helper/function_helper.dart';
import 'package:lati_marvel_movies/main.dart';
import 'package:lati_marvel_movies/provider/authentication_provider.dart';
import 'package:lati_marvel_movies/screen/auth_screen/register_screen.dart';
import 'package:lati_marvel_movies/widget/custome_text_field.dart';
import 'package:lati_marvel_movies/widget/label_widget.dart';
import 'package:lati_marvel_movies/widget/main_button.dart';

import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool hidePassword = false;

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthenticationProvider>(
      builder: (context, authConsumer, child) {
        return Scaffold(
          body: Center(
            child: SafeArea(
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      LabelWidget(label: "Login to See Movies!"),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 80),
                        child: Image.asset("assets/marvelLogo.png",
                            width: getSize(context).width * 0.8),
                      ),
                      TextFieldWidget(
                        controller: phoneController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Phone is Required!";
                          }
                          if (value.length != 10) {
                            return "Enter Valid Phone";
                          }
                          return null;
                        },
                        hint: 'Enter Phone Number',
                        label: 'Phone',
                      ),
                      TextFieldWidget(
                        suffix: GestureDetector(
                          onTap: () {
                            setState(() {
                              hidePassword = !hidePassword;
                            });
                          },
                          child: Icon(
                            hidePassword
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 16,
                          ),
                        ),
                        obSecure: hidePassword,
                        controller: passwordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Password is Required!";
                          }
                          if (value.length < 8) {
                            return "Password Must be 8 characters at least";
                          }
                          return null;
                        },
                        hint: 'Enter Password',
                        label: 'Password',
                      ),
                      SizedBox(
                        height: getSize(context).height * 0.2,
                      ),
                      MainButton(
                        text: "Login",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            Provider.of<AuthenticationProvider>(context,
                                    listen: false)
                                .login(
                              {
                                "phone": phoneController.text.toString(),
                                "password": passwordController.text.toString(),
                              },
                            ).then((loggedIn) {
                              if (loggedIn.first) {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    CupertinoPageRoute(
                                        builder: (context) => ScreenRouter()),
                                    (route) => false);
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text(loggedIn.last),
                                ));
                              }
                            });
                          }
                        },
                        inProgress: authConsumer.process,
                      ),
                      MainButton(
                        text: "Create Account",
                        txtColor: mainColor,
                        btnColor: Colors.white,
                        onPressed: () {
                          Navigator.push(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
