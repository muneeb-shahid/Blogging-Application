import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';

var mediaQueryData = Get.mediaQuery;

double screenHeight = mediaQueryData.size.height * 1;
double screenWidth = mediaQueryData.size.width * 1;

customButton(
    {var nextScreen,
    required var innerColor,
    required var textColor,
    required String text}) {
  return Column(children: <Widget>[
    MaterialButton(
      minWidth: screenWidth * 0.6,
      height: screenHeight * 0.06,
      onPressed: () {
        Get.off(nextScreen);
        
      },
      color: innerColor,
      shape: RoundedRectangleBorder(
          side: BorderSide(color: App_Colors.app_black_color, width: 2),
          borderRadius: BorderRadius.circular(10)),
      child: FittedBox(
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontSize: FontsConstants.sub_heading_font_size.sp,
              fontFamily: FontsConstants.heading_font_family,
              wordSpacing: 1,
              letterSpacing: 1),
        ),
      ),
    ),
  ]);
}
