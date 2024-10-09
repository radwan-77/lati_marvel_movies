import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:lati_marvel_movies/helper/function_helper.dart';
import 'package:lati_marvel_movies/widget/custome_text_field.dart';
import 'package:lati_marvel_movies/widget/label_widget.dart';
import 'package:lati_marvel_movies/widget/main_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController genderController = TextEditingController();
  TextEditingController dofController = TextEditingController();
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LabelWidget(label: "register Screen"),
                    Image.asset(
                      "assets/logo/marvelLogo.png",
                      width: getSize(context).width * 0.8,
                    ),
                    TextFieldWidget(
                        controller: emailController,
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return "Email is required";
                          }
                          if (validator.length < 2) {
                            return "Email must be at least 2 characters long";
                          }
                          return null;
                        },
                        hint: "email",
                        label: "email_label"),
                    TextFieldWidget(
                        controller: phoneController,
                        validator: (validator) {
                          if (validator!.isEmpty) {
                            return "Phone is required";
                          }
                          if (validator.length < 10) {
                            return "Phone must be at least 10 characters long";
                          }
                          return null;
                        },
                        hint: "hint",
                        label: "label"),
                    MainButton(
                        text: "create",
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            print("form is valid");
                          }
                        })
                  ]),
            ),
          ),
        ),
      ),
    );
  }
}
