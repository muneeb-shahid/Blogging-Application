import 'package:blog_app/controller/MyBlogController/MyBlogController.dart';
import 'package:blog_app/functions/Custom%20Button/Login&signupButton.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';

class MyBlog extends StatelessWidget {
  const MyBlog({super.key});

  @override
  Widget build(BuildContext context) {
    final databaseRef = FirebaseDatabase.instance.ref("Blog");
    var heightt = MediaQuery.of(context).size.height * 1;
    MyBlogController _myBlogController = Get.put(MyBlogController());

    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 40, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  FittedBox(
                    alignment: Alignment.center,
                    child: Center(
                      child: Text(
                        "Write a Blog",
                        style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: App_Colors.app_black_color,
                            fontSize: FontsConstants.heading_font_size.sp,
                            fontFamily: FontsConstants.Philosopher,
                            wordSpacing: 1,
                            letterSpacing: 0.5),
                      ),
                    ),
                  ),
                  Lottie.asset(
                    "assets/images/BlogPage.json",
                    repeat: true,
                    width: double.infinity,
                    reverse: false,
                    animate: true,
                  ),
                  SizedBox(
                    height: heightt * 0.05,
                  ),
                  Form(
                    key: _myBlogController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _myBlogController.titleController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _myBlogController.validateTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: App_Colors.app_black_color)),
                              hintText: 'Write a title of blog...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: App_Colors.app_black_color,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: heightt * 0.05,
                        ),
                        TextFormField(
                            controller: _myBlogController.contentController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _myBlogController.validateContent,
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: App_Colors.app_black_color)),
                              hintText: 'Write a blog content...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 2,
                                  color: App_Colors.app_black_color,
                                ),
                              ),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: heightt * 0.04,
                  ),
                  customLogin_SignupButton(
                      innerColor: App_Colors.app_black_color,
                      textColor: App_Colors.app_white_color,
                      text: "Publish",
                      func: () => _myBlogController.publish()),
                ],
              ),
            ),
          )),
    );
  }
}
