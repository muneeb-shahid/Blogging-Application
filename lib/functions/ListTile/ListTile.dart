import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../constants/FontConstant/FontConstant.dart';

var mediaQueryData = Get.mediaQuery;

double screenHeight = mediaQueryData.size.height * 1;
double screenWidth = mediaQueryData.size.width * 1;

class Drawer_Function {
  static drawer_list_function(
      {required func, required iconn, required String text}) {
    return Column(
      children: [
        GestureDetector(
          onTap: func,
          child: ListTile(
            leading: Icon(
              iconn,
              color: App_Colors.app_white_color,
            ),
            title: Text(
              text,
              style: TextStyle(
                  color: App_Colors.app_white_color,
                  fontSize: FontsConstants.text_font_size.sp,
                  fontFamily: FontsConstants.regular_font_family,
                  wordSpacing: 1,
                  letterSpacing: 1),
            ),
          ),
        ),
        SizedBox(
          height: screenHeight * 0.002,
        ),
      ],
    );
  }
}
