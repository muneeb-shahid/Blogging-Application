import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';

import '../../constants/Color Constant/ColorConstant.dart';
import '../../constants/FontConstant/FontConstant.dart';

class Favourite extends StatelessWidget {
  Favourite({
    super.key,
  });

  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
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
              "My Favourite",
              style: TextStyle(
                  color: App_Colors.app_black_color,
                  fontSize: FontsConstants.heading_font_size.sp,
                  fontFamily: FontsConstants.Philosopher,
                  wordSpacing: 1,
                  letterSpacing: 1),
            ),
          ),
        ),
      ),
      body: Obx(() {
        if (favouriteController.tempList.isEmpty) {
          return Center(
            child: Text(
              'No favorites added yet.',
              style: TextStyle(
                  color: App_Colors.app_red_theme,
                  fontSize: FontsConstants.text_font_size.sp,
                  fontFamily: FontsConstants.heading_font_family,
                  wordSpacing: 1,
                  letterSpacing: 1),
            ),
          );
        } else {
          return ListView.builder(
            itemCount: favouriteController.tempList.length,
            itemBuilder: (context, index) {
              dynamic favourite = favouriteController.tempList.elementAt(index);
              return Card(
                child: ListTile(
                  title: Text(
                    favourite["title"].toString(),
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  subtitle: Text(
                    favourite["content"].toString(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),
                  trailing: IconButton(
                    onPressed: () {
                      favouriteController.removeFavourite(favourite);
                    },
                    icon: Icon(Icons.favorite),
                    color: Colors.red,
                  ),
                ),
              );
            },
          );
        }
      }),
    );
  }
}
