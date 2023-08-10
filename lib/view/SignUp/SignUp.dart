import 'package:blog_app/View/Login/login.dart';
import 'package:blog_app/constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/controller/ToggleObscured/ToggleObscured.dart';
import 'package:blog_app/functions/AppImage%20&%20Title/AppImage%20&%20Title.dart';
import 'package:blog_app/functions/Email&PasswordValidation/Email_Password_Validation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../constants/FontConstant/FontConstant.dart';
import '../../controller/SignUpController/SignUpController.dart';
import '../../functions/Custom Button/Login&signupButton.dart';


class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final ToggleObscured _toggleObscured = Get.put(ToggleObscured());
  final SignUpController _signUpController = Get.put(SignUpController());
  final EmailPasswordValidation _emailPasswordValidation =
      Get.put(EmailPasswordValidation());

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      appBar: AppBar(
          backgroundColor: App_Colors.app_background_color,
          elevation: 0,
          leading: InkWell(
            child: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            },
          )),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 40),
          child: Column(
            children: [
              AppImage(),
              SizedBox(
                height: heightt * 0.02,
              ),
              AppSologan(),
              SizedBox(
                height: heightt * 0.05,
              ),
              FittedBox(
                child: Text.rich(
                  TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: 'C',
                          style: TextStyle(
                            fontSize: FontsConstants.heading_font_size.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontsConstants.Philosopher,
                          )),
                      TextSpan(
                        text: 'reate',
                        style: TextStyle(
                            // color: App_Colors.app_black_color,
                            color: Colors.black,
                            fontSize: FontsConstants.heading_font_size.sp,
                            fontFamily: FontsConstants.Philosopher,
                            wordSpacing: 1,
                            letterSpacing: 2),
                      ),
                      TextSpan(
                          text: ' A',
                          style: TextStyle(
                            fontSize: FontsConstants.heading_font_size.sp,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontFamily: FontsConstants.Philosopher,
                          )),
                      TextSpan(
                        text: 'ccount',
                        style: TextStyle(
                            // color: App_Colors.app_black_color,
                            color: Colors.black,
                            fontSize: FontsConstants.heading_font_size.sp,
                            fontFamily: FontsConstants.Philosopher,
                            wordSpacing: 1,
                            letterSpacing: 2),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: heightt * 0.05,
              ),
              Lottie.asset(
                "assets/images/login-signup.json",
                repeat: true,
                reverse: false,
                animate: true,
              ),
              SizedBox(
                height: heightt * 0.05,
              ),
              Obx(
                () => Form(
                  key: _signUpController.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller: _signUpController.EmailTextEditingController
                            .clear(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: App_Colors.app_black_color,
                            )),
                            prefixIcon: const Icon(Icons.email),
                            prefixIconColor: App_Colors.app_black_color,
                            hintText: 'Email',
                            hintStyle: const TextStyle()),
                        validator: _emailPasswordValidation.validateEmail,
                        onSaved: (input) {
                          _signUpController.email.value = input!;
                        },
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      TextFormField(
                        controller: _signUpController
                            .PasswordTextEditingController.clear(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                          focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                            color: App_Colors.app_black_color,
                          )),
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: App_Colors.app_black_color,
                          hintText: 'Password',
                          suffixIcon: GestureDetector(
                              onTap: () {
                                _toggleObscured.toggleObscure();
                              },
                              child: IconButton(
                                onPressed: () {
                                  _toggleObscured.toggleObscure();
                                },
                                icon: Icon(
                                    _toggleObscured.isObscured
                                        ? Icons.visibility
                                        : Icons.visibility_off,
                                    color: Colors.black),
                              )),
                        ),
                        obscureText: _toggleObscured.isObscured,
                        validator: _emailPasswordValidation.validatePassword,
                        onSaved: (input) {
                          _signUpController.password.value = input!;
                        },
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      customLogin_SignupButton(
                          innerColor: App_Colors.app_black_color,
                          textColor: App_Colors.app_white_color,
                          text: "Sign Up",
                          func: () => _signUpController.register()),
                      SizedBox(
                        height: heightt * 0.02,
                      ),
                      
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            FittedBox(
                              child: Text(
                                "Already have an account?",
                                style: TextStyle(
                                  color: App_Colors.app_black_color,
                                  fontSize: FontsConstants.text_font_size.sp,
                                  fontFamily:
                                      FontsConstants.regular_font_family,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(() =>  LoginPage());
                              },
                              child: FittedBox(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: App_Colors.app_black_color,
                                    fontSize: FontsConstants.text_font_size.sp,
                                    fontFamily:
                                        FontsConstants.regular_font_family,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                  
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}