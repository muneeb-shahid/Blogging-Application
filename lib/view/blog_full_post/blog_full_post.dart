import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../constants/color_constant/color_constant.dart';

class BlogFullPost extends StatelessWidget {
  final dynamic blogData;
  BlogFullPost({
    required this.blogData,
  });

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
    return Scaffold(
      backgroundColor: AppColors.appBackgroundColor,
      appBar: AppBar(
        backgroundColor: AppColors.appBackgroundColor,
        elevation: 0,
        leading: InkWell(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onTap: () {
            Get.back();
          },
        ),
      ),
      body: SafeArea(
        top: true,
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
            child: Column(
              children: [
                Text(
                  blogData["title"].toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2,
                      wordSpacing: 2,
                      color: AppColors.appBlackColor,
                      fontFamily: FontsConstants.heading_font_family,
                      fontSize: 16.sp),
                ),
                SizedBox(
                  height: heightt * 0.02,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      blogData['date'].toString(),
                      style: TextStyle(
                          color: AppColors.appBlackColor,
                          fontFamily: FontsConstants.regular_font_family,
                          fontSize: FontsConstants.text_font_size.sp),
                    ),
                  ],
                ),
                Divider(
                  thickness: 2,
                  color: Colors.grey,
                ),
                Text(
                  blogData["content"].toString(),
                  style: TextStyle(
                      color: AppColors.appBlackColor,
                      fontFamily: FontsConstants.regular_font_family,
                      fontSize: 13.sp),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
