import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';

import '../../constants/Color Constant/ColorConstant.dart';
import '../../constants/FontConstant/FontConstant.dart';
import '../../controller/HomeController/HomeController.dart';
import '../../controller/ProfileController/ProfileController.dart';
import '../../controller/SignUpController/SignUpController.dart';
import '../../functions/Custom Button/Login&signupButton.dart';
import '../BlogFullPost/BlogFullPost.dart';

class Favourite extends StatelessWidget {
  Favourite({
    super.key,
  });

  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  HomeController homeController = Get.put(HomeController());
  final ProfileController _profileController = Get.put(ProfileController());
  final SignUpController _signUpController = Get.put(SignUpController());

  TextEditingController _searchTextEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var heightt = MediaQuery.of(context).size.height * 1;
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

              return Container(
                child: GestureDetector(
                  onTap: () {
                    Get.to(BlogFullPost(
                      blogData: favourite,
                    ));
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Card(
                      color: Color.fromARGB(255, 255, 255, 255),
                      child: Container(
                        alignment: Alignment.center,
                        child: ListTile(
                          title: Padding(
                            padding: EdgeInsets.fromLTRB(5, 5, 5, 5),
                            child: Column(
                              children: [
                                Text(
                                  favourite["title"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 1,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 2,
                                      wordSpacing: 2,
                                      color: App_Colors.app_black_color,
                                      fontFamily:
                                          FontsConstants.heading_font_family,
                                      fontSize: 16.sp),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      favourite['date'].toString(),
                                      style: TextStyle(
                                          color: App_Colors.app_black_color,
                                          fontFamily: FontsConstants
                                              .regular_font_family,
                                          fontSize:
                                              FontsConstants.text_font_size.sp),
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        favouriteController
                                            .removeFavourite(favourite);
                                      },
                                      icon: Icon(Icons.favorite),
                                      color: Colors.red,
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 2,
                                  color: Colors.grey,
                                ),
                                Text(
                                  favourite["content"].toString(),
                                  overflow: TextOverflow.ellipsis,
                                  softWrap: true,
                                  maxLines: 3,
                                  style: TextStyle(
                                      color: App_Colors.app_black_color,
                                      fontFamily:
                                          FontsConstants.regular_font_family,
                                      fontSize: 13.sp),
                                ),
                                SizedBox(
                                  height: heightt * 0.03,
                                ),
                                customLogin_SignupButton(
                                    innerColor: App_Colors.app_black_color,
                                    textColor: App_Colors.app_white_color,
                                    text: "Read more",
                                    func: () => Get.to(BlogFullPost(
                                          blogData: favourite,
                                        ))),
                                SizedBox(
                                  height: heightt * 0.01,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
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
