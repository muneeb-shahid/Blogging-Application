import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:blog_app/Functions/Email&PasswordValidation/Email_Password_Validation.dart';
import 'package:blog_app/View/Login/login.dart';
import 'package:blog_app/controller/signup_controller/signup_controller.dart';
import 'package:blog_app/controller/toggle_obscured/toggle_obscured.dart';
import 'package:blog_app/functions/custom_button/login_and_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Functions/AppImage & Title/AppImage & Title.dart';
import '../../constants/color_constant/color_constant.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ToggleObscured _toggleObscured = Get.put(ToggleObscured());

    final SignUpController _signUpController = Get.put(SignUpController());

    final EmailPasswordValidation _emailPasswordValidation =
        Get.put(EmailPasswordValidation());
    var heightt = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: AppColors.appAmberColor,
      appBar: AppBar(
          backgroundColor: AppColors.appAmberColor,
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
                height: heightt * 0.03,
              ),
              Lottie.asset(
                "assets/images/login-signup.json",
                repeat: true,
                reverse: false,
                animate: true,
              ),
              SizedBox(
                height: heightt * 0.03,
              ),
              Obx(
                () => Form(
                  key: _signUpController.formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        controller:
                            _signUpController.NameTextEditingController.clear(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.appBlackColor,
                            )),
                            prefixIcon: Icon(Icons.person),
                            prefixIconColor: AppColors.appBlackColor,
                            hintText: 'Name',
                            hintStyle: TextStyle()),
                        validator: _signUpController.validateName,
                        onSaved: (input) {
                          _signUpController.saveName(input!);
                        },
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      TextFormField(
                        controller: _signUpController.EmailTextEditingController
                            .clear(),
                        style: const TextStyle(
                          color: Colors.black,
                        ),
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: AppColors.appBlackColor,
                            )),
                            prefixIcon: const Icon(Icons.email),
                            prefixIconColor: AppColors.appBlackColor,
                            hintText: 'Email',
                            hintStyle: TextStyle()),
                        validator: _emailPasswordValidation.validateEmail,
                        onSaved: (input) {
                          _signUpController.saveEmail(input!);
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
                            color: AppColors.appBlackColor,
                          )),
                          prefixIcon: const Icon(Icons.password),
                          prefixIconColor: AppColors.appBlackColor,
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
                      customLoginSignupButton(
                          innerColor: AppColors.appBlackColor,
                          textColor: AppColors.appWhiteColor,
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
                                  color: AppColors.appBlackColor,
                                  fontSize: FontsConstants.text_font_size.sp,
                                  fontFamily:
                                      FontsConstants.regular_font_family,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                Get.offAll(() => LoginPage());
                              },
                              child: FittedBox(
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    decoration: TextDecoration.underline,
                                    color: AppColors.appBlackColor,
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
