import 'package:blog_app/Controller/BottomNavController/BottomNavController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Constants/Color Constant/ColorConstant.dart';

class BottomNav extends StatelessWidget {
  BottomNav({super.key});

  @override
  Widget build(BuildContext context) {
    var widthh = MediaQuery.of(context).size.width * 1;
    return GetBuilder<BottomNavController>(
        init: BottomNavController(),
        builder: (bottomNavController) {
          return Scaffold(
              backgroundColor: App_Colors.app_background_color,
              body:
                  bottomNavController.screens[bottomNavController.currentIndex],
              bottomNavigationBar: BottomNavigationBar(
                elevation: 5,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.white,
                selectedItemColor: Colors.black,
                showUnselectedLabels: false,
                currentIndex: bottomNavController.currentIndex,
                onTap: bottomNavController.changeIndex,
                items: [
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.home),
                    icon: Icon(
                      Icons.home_outlined,
                      color: Colors.black,
                    ),
                    label: "Home",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.favorite),
                    icon: Icon(
                      Icons.favorite_border_outlined,
                      color: Colors.black,
                    ),
                    label: "Favorite",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Image(
                      width: widthh * 0.07,
                      image: AssetImage(
                          "assets/images/create blog in black background.png"),
                      color: Colors.black,
                    ),
                    icon: Image(
                      width: widthh * 0.07,
                      image: AssetImage("assets/images/create blog.png"),
                      color: Colors.black,
                    ),
                    label: "Create Blog",
                  ),
                  BottomNavigationBarItem(
                    activeIcon: Icon(Icons.person),
                    icon: Icon(
                      Icons.person_2_outlined,
                      color: Colors.black,
                    ),
                    label: "Profile",
                  ),
                ],
              ));
        });
  }
}
