import 'package:blog_app/View/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';
import '../../Controller/LoginController/LoginController.dart';
import '../../Functions/AppImage & Title/AppImage & Title.dart';
import '../../Functions/Email&PasswordValidation/Email_Password_Validation.dart';
import '../../controller/SignUpController/SignUpController.dart';
import '../../functions/Custom Button/Login&signupButton.dart';

class LoginPage extends StatelessWidget {
  final EmailPasswordValidation _emailPasswordValidation =
      Get.put(EmailPasswordValidation());
   LoginController _loginController = Get.put(LoginController());
  SignUpController _signUpController = Get.put(SignUpController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      body: SafeArea(
        top: true,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
          child: SingleChildScrollView(
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
                            text: 'W',
                            style: TextStyle(
                              fontSize: FontsConstants.heading_font_size.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontsConstants.Philosopher,
                            )),
                        TextSpan(
                          text: 'elcome',
                          style: TextStyle(
                              // color: App_Colors.app_black_color,
                              color: Colors.black,
                              fontSize: FontsConstants.heading_font_size.sp,
                              fontFamily: FontsConstants.Philosopher,
                              wordSpacing: 1,
                              letterSpacing: 2),
                        ),
                        TextSpan(
                            text: ' B',
                            style: TextStyle(
                              fontSize: FontsConstants.heading_font_size.sp,
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: FontsConstants.Philosopher,
                            )),
                        TextSpan(
                          text: 'ack',
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
                Form(
                  key: _loginController.formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextFormField(
                        controller: _signUpController.EmailTextEditingController
                            .clear(),
                        style: TextStyle(
                          color: Colors.black,
                        ),
                         
                        validator: _emailPasswordValidation.validateEmail,
                        onChanged: (value) {
                          _loginController.email = value;
                        },
                        decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: App_Colors.app_black_color,
                            )),
                            prefixIcon: const Icon(Icons.email),
                            prefixIconColor: App_Colors.app_black_color,
                            hintText: 'Email',
                            hintStyle: TextStyle()),
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      Obx(
                        // Use Obx to observe the _isObscured variable
                        () => TextFormField(
                           controller: _signUpController
                            .PasswordTextEditingController.clear(),
                          style: const TextStyle(
                            color: Colors.black,
                          ),
                          validator: _emailPasswordValidation.validatePassword,

                          onChanged: (value) {
                            _loginController.password = value;
                          },
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                              color: App_Colors.app_black_color,
                            )),
                            prefixIcon: const Icon(Icons.password),
                            prefixIconColor: App_Colors.app_black_color,
                            suffixIconColor: App_Colors.app_black_color,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                _loginController
                                    .toggleObscure(); // Call the _toggleObscure method
                              },
                              child: Icon(
                                _loginController.isObscured.value
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                              ),
                            ),
                            hintText: 'Password',
                          ),
                          obscureText: _loginController
                              .isObscured.value, // Use the value from the Obx
                        ),
                      ),
                      SizedBox(
                        height: heightt * 0.04,
                      ),
                      customLogin_SignupButton(
                          innerColor: App_Colors.app_black_color,
                          textColor: App_Colors.app_white_color,
                          text: "Login",
                          func: () => _loginController.onLogin()),
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
                                "Don't have an account?",
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
                                Get.to(() => SignUpPage());
                              },
                              child: FittedBox(
                                child: Text(
                                  "Sign Up",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
