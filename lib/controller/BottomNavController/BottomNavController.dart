import 'package:blog_app/view/Favourite/Favourite.dart';
import 'package:blog_app/view/MyBlog/MyBlog.dart';
import 'package:blog_app/view/Profile/Profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../view/Home/home.dart';

class BottomNavController extends GetxController {
  
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Favourite(),
    MyBlog(),
    Profile(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
