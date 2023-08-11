import 'package:blog_app/controller/MyBlogController/MyBlogController.dart';
import 'package:blog_app/functions/Title&BlogValidation/Title&BlogValidation.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
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
    Title_BlogValidation _title_blogValidation =
        Get.put(Title_BlogValidation());

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
                               validator: _title_blogValidation.validateTitle,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: const Color.fromARGB(
                                          255, 122, 93, 93))),
                              hintText: 'Write a title of blog...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                            )),
                        SizedBox(
                          height: heightt * 0.03,
                        ),
                        TextFormField(
                            controller: _myBlogController.contentController,
                            style: TextStyle(
                              color: Colors.black,
                            ),
                            maxLines: 4,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.black)),
                              hintText: 'Write a blog content...',
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                                borderSide: BorderSide(
                                  width: 1,
                                  color: Colors.black,
                                ),
                              ),
                            )),

                      ],
                    ),
                  ),
                  
                        ElevatedButton(
                            onPressed: () {
                              databaseRef
                                  .child(DateTime.now()
                                      .millisecondsSinceEpoch
                                      .toString())
                                  .set({
                                "title": _myBlogController.titleController.text
                                    .toString(),
                                "content": _myBlogController
                                    .contentController.text
                                    .toString()
                              }).then((value) {
                                Get.snackbar(
                                  'Blog is published',
                                  "",
                                  icon: const Icon(Icons.publish,
                                      color: Colors.black),
                                  backgroundColor: App_Colors.app_white_color,
                                  colorText: Colors.black,
                                  snackPosition: SnackPosition.TOP,
                                );
                              }).onError((error, stackTrace) {});
                            },
                            child: Text("Post"))
                   

                  // TextFormField(
                  //     controller: _myBlogController.titleController,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(
                  //               color: const Color.fromARGB(255, 122, 93, 93))),
                  //       hintText: 'Write a title of blog...',
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     )),
                  // SizedBox(
                  //   height: heightt * 0.03,
                  // ),
                  // TextFormField(
                  //     controller: _myBlogController.contentController,
                  //     style: TextStyle(
                  //       color: Colors.black,
                  //     ),
                  //     maxLines: 4,
                  //     decoration: InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Colors.black)),
                  //       hintText: 'Write a blog content...',
                  //       focusedBorder: OutlineInputBorder(
                  //         borderRadius: BorderRadius.circular(5),
                  //         borderSide: BorderSide(
                  //           width: 1,
                  //           color: Colors.black,
                  //         ),
                  //       ),
                  //     )),
                  // ElevatedButton(
                  //     onPressed: () {
                  //       databaseRef
                  //           .child(DateTime.now()
                  //               .millisecondsSinceEpoch
                  //               .toString())
                  //           .set({
                  //         "title":
                  //             _myBlogController.titleController.text.toString(),
                  //         "content": _myBlogController.contentController.text
                  //             .toString()
                  //       }).then((value) {
                  //         Get.snackbar(
                  //           'Blog is published',
                  //           "",
                  //           icon:
                  //               const Icon(Icons.publish, color: Colors.black),
                  //           backgroundColor: App_Colors.app_white_color,
                  //           colorText: Colors.black,
                  //           snackPosition: SnackPosition.TOP,
                  //         );
                  //       }).onError((error, stackTrace) {});
                  //     },
                  //     child: Text("Post"))
                ],
              ),
            ),
          )),
    );
  }
}
