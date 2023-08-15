import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:blog_app/Functions/Custom%20Button/customButton.dart';
import 'package:blog_app/functions/AppImage%20&%20Title/AppImage%20&%20Title.dart';
import 'package:blog_app/view/Login/login.dart';
import 'package:blog_app/view/SignUp/SignUp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;

    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      body: SingleChildScrollView(
        child: SafeArea(
          top: true,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
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
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Container(
                        child: const Image(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        "assets/images/Ellipse 1.png",
                      ),
                    )),
                    Positioned(
                        child: FittedBox(
                      child: Text.rich(
                        TextSpan(
                          text: 'Tell your',
                          style: TextStyle(
                              color: App_Colors.app_black_color,
                              fontSize: FontsConstants.heading_font_size.sp,
                              fontFamily: FontsConstants.Philosopher,
                              wordSpacing: 1,
                              letterSpacing: 0.5),
                          children: <TextSpan>[
                            TextSpan(
                                text: ' story',
                                style: TextStyle(
                                    fontSize:
                                        FontsConstants.heading_font_size.sp,
                                    fontWeight: FontWeight.bold,
                                    fontStyle: FontStyle.italic,
                                    fontFamily:
                                        FontsConstants.heading_font_family)),
                            TextSpan(
                              text: ' with us.',
                              style: TextStyle(
                                  color: App_Colors.app_black_color,
                                  fontSize: FontsConstants.heading_font_size.sp,
                                  fontFamily: FontsConstants.Philosopher,
                                  wordSpacing: 1,
                                  letterSpacing: 0.5),
                            )
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
                SizedBox(
                  height: heightt * 0.015,
                ),
                customButton(
                    nextScreen: LoginPage(),
                    innerColor: App_Colors.app_background_color,
                    textColor: App_Colors.app_black_color,
                    text: "Login"),
                SizedBox(
                  height: heightt * 0.03,
                ),
                Text(
                  "New here?",
                  style: TextStyle(
                    color: App_Colors.app_black_color,
                    fontSize: FontsConstants.text_font_size.sp,
                    fontFamily: FontsConstants.regular_font_family,
                  ),
                ),
                SizedBox(
                  height: heightt * 0.02,
                ),
                customButton(
                    nextScreen:  SignUpPage(),
                    innerColor: App_Colors.app_black_color,
                    textColor: App_Colors.app_white_color,
                    text: "Register"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
