import 'package:blog_app/controller/create_blog_controller/create_blog_controller.dart';
import 'package:blog_app/functions/custom_button/login_and_signup_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';

class CreateBlog extends StatelessWidget {
  const CreateBlog({super.key});

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    CreateBlogController _CreateBlogController =
        Get.put(CreateBlogController());

    return Scaffold(
      backgroundColor: App_Colors.app_background_color,
      appBar: AppBar(
          backgroundColor: App_Colors.app_background_color,
          centerTitle: true,
          elevation: 0,
          title: FittedBox(
            alignment: Alignment.center,
            child: Center(
              child: Text(
                "Write a Blog",
                style: TextStyle(
                    color: App_Colors.app_black_color,
                    fontSize: FontsConstants.heading_font_size.sp,
                    fontFamily: FontsConstants.Philosopher,
                    wordSpacing: 1,
                    letterSpacing: 1),
              ),
            ),
          ),
          leading: InkWell(
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
            onTap: () {
              Get.back();
            },
          )),
      body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
                    key: _CreateBlogController.formKey,
                    child: Column(
                      children: [
                        TextFormField(
                            controller: _CreateBlogController.titleController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _CreateBlogController.validateTitle,
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
                          height: heightt * 0.03,
                        ),
                        TextFormField(
                            controller: _CreateBlogController.contentController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            validator: _CreateBlogController.validateContent,
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
                  customLoginSignupButton(
                      innerColor: App_Colors.app_black_color,
                      textColor: App_Colors.app_white_color,
                      text: "Publish",
                      func: () => _CreateBlogController.publish()),
                ],
              ),
            ),
          )),
    );
  }
}
