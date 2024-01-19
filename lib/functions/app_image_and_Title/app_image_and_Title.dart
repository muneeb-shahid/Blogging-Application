import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../Constants/Color Constant/ColorConstant.dart';
import '../../Constants/FontConstant/FontConstant.dart';

AppImage() {
  return
  const Center(child: Image(image: AssetImage("assets/images/BLOGD..png")));
}

AppSologan() {
  return
  Center(
    child: Text(
      "Personal Blogging Partner",
      style: TextStyle(
          color: App_Colors.app_black_color,
          fontSize: FontsConstants.text_font_size.sp,
          fontFamily: FontsConstants.regular_font_family,
          wordSpacing: 1,
          letterSpacing: 0.5),
    ),
  );
}
