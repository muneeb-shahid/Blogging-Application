import 'package:blog_app/view/Favourite/Favourite.dart';
import 'package:blog_app/view/create_blog/create_blog.dart';
import 'package:get/get.dart';

import '../../view/Home/home.dart';
import '../../view/Profile/Profile.dart';

class BottomNavController extends GetxController {
  
  int currentIndex = 0;
  final screens = [
    HomePage(),
    Favourite(),
    CreateBlog(),
    Profile(),
  ];

  void changeIndex(int index) {
    currentIndex = index;
    update();
  }
}
