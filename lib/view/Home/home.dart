import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';
import 'package:blog_app/controller/HomeController/HomeController.dart';
import 'package:blog_app/controller/ProfileController/ProfileController.dart';
import 'package:blog_app/controller/SignUpController/SignUpController.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../functions/Custom Button/Login&signupButton.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Blog");

    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    HomeController homeController = Get.put(HomeController());

    var heightt = MediaQuery.of(context).size.height * 1;

    return Scaffold(
        backgroundColor: App_Colors.app_background_color,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
            child: Column(children: [
              TextFormField(
                keyboardType: TextInputType.text,
                controller: homeController.SearchTextEditingController,
                style: TextStyle(
                  color: Colors.black,
                ),
                validator: (value) {
                  return value!.isEmpty ? "Enter blog title to search" : null;
                },
                onChanged: (value) {
                  homeController.search = value;
                },
                decoration: InputDecoration(
                  hintText: 'Search with title blog',
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(30),
                    borderSide: BorderSide(
                      width: 1,
                      color: Colors.black,
                    ),
                  ),
                  border: OutlineInputBorder(
                     borderRadius: BorderRadius.circular(30),
                      borderSide: BorderSide(color: Colors.black)),
                  prefixIcon: Icon(Icons.search, color: Colors.black),
                ),
              ),
              SizedBox(
                height: heightt * 0.01,
              ),
              Expanded(
                  child: StreamBuilder(
                      stream: ref.onValue,
                      builder: (
                        context,
                        AsyncSnapshot<DatabaseEvent> snapshot,
                      ) {
                        try {
                          Map<dynamic, dynamic> map =
                              snapshot.data?.snapshot.value as dynamic;
                          List<dynamic> list = [];
                          list.clear();
                          list = map.values.toList();

                          return ListView.builder(
                            itemCount: snapshot.data!.snapshot.children.length,
                            itemBuilder: (context, index) {
                              String tempTitle = list[index]["title"];
                              if (homeController
                                  .SearchTextEditingController.text.isEmpty) {
                                return Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(BlogFullPost(
                                        blogData: list[index],
                                      ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Card(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    list[index]["title"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                        wordSpacing: 2,
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .heading_font_family,
                                                        fontSize: 16.sp),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        list[index]['date']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: App_Colors
                                                                .app_black_color,
                                                            fontFamily:
                                                                FontsConstants
                                                                    .regular_font_family,
                                                            fontSize:
                                                                FontsConstants
                                                                    .text_font_size
                                                                    .sp),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          Map<String, dynamic>
                                                              selectedBlog =
                                                              Map.from(
                                                                  list[index]);
                                                          if (favouriteController
                                                              .tempList
                                                              .any((item) =>
                                                                  item[
                                                                      "title"] ==
                                                                  selectedBlog[
                                                                      "title"])) {
                                                            favouriteController
                                                                .removeFavourite(
                                                                    selectedBlog);
                                                          } else {
                                                            favouriteController
                                                                .addToFavourite(
                                                                    selectedBlog);
                                                          }
                                                        },
                                                        icon: Obx(() => Icon(
                                                              Icons.favorite,
                                                              color: favouriteController
                                                                      .tempList
                                                                      .any((item) =>
                                                                          item[
                                                                              "title"] ==
                                                                          list[index]
                                                                              [
                                                                              "title"])
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    list[index]["content"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .regular_font_family,
                                                        fontSize: 13.sp),
                                                  ),
                                                  SizedBox(
                                                    height: heightt * 0.03,
                                                  ),
                                                  customLogin_SignupButton(
                                                      innerColor: App_Colors
                                                          .app_black_color,
                                                      textColor: App_Colors
                                                          .app_white_color,
                                                      text: "Read more",
                                                      func: () =>
                                                          Get.to(BlogFullPost(
                                                            blogData:
                                                                list[index],
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
                              } else if (tempTitle.toLowerCase().contains(
                                  homeController
                                      .SearchTextEditingController.text
                                      .toString())) {
                                return Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(BlogFullPost(
                                        blogData: list[index],
                                      ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Card(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    list[index]["title"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                        wordSpacing: 2,
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .heading_font_family,
                                                        fontSize: 16.sp),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        list[index]['date']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: App_Colors
                                                                .app_black_color,
                                                            fontFamily:
                                                                FontsConstants
                                                                    .regular_font_family,
                                                            fontSize:
                                                                FontsConstants
                                                                    .text_font_size
                                                                    .sp),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          Map<String, dynamic>
                                                              selectedBlog =
                                                              Map.from(
                                                                  list[index]);
                                                          if (favouriteController
                                                              .tempList
                                                              .any((item) =>
                                                                  item[
                                                                      "title"] ==
                                                                  selectedBlog[
                                                                      "title"])) {
                                                            favouriteController
                                                                .removeFavourite(
                                                                    selectedBlog);
                                                          } else {
                                                            favouriteController
                                                                .addToFavourite(
                                                                    selectedBlog);
                                                          }
                                                        },
                                                        icon: Obx(() => Icon(
                                                              Icons.favorite,
                                                              color: favouriteController
                                                                      .tempList
                                                                      .any((item) =>
                                                                          item[
                                                                              "title"] ==
                                                                          list[index]
                                                                              [
                                                                              "title"])
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    list[index]["content"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .regular_font_family,
                                                        fontSize: 13.sp),
                                                  ),
                                                  SizedBox(
                                                    height: heightt * 0.03,
                                                  ),
                                                  customLogin_SignupButton(
                                                      innerColor: App_Colors
                                                          .app_black_color,
                                                      textColor: App_Colors
                                                          .app_white_color,
                                                      text: "Read more",
                                                      func: () =>
                                                          Get.to(BlogFullPost(
                                                            blogData:
                                                                list[index],
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
                              } else {
                                return Container(
                                  child: GestureDetector(
                                    onTap: () {
                                      Get.to(BlogFullPost(
                                        blogData: list[index],
                                      ));
                                    },
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Card(
                                        color:
                                            Color.fromARGB(255, 255, 255, 255),
                                        child: Container(
                                          alignment: Alignment.center,
                                          child: ListTile(
                                            title: Padding(
                                              padding: EdgeInsets.fromLTRB(
                                                  5, 5, 5, 5),
                                              child: Column(
                                                children: [
                                                  Text(
                                                    list[index]["title"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 1,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        letterSpacing: 2,
                                                        wordSpacing: 2,
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .heading_font_family,
                                                        fontSize: 16.sp),
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        list[index]['date']
                                                            .toString(),
                                                        style: TextStyle(
                                                            color: App_Colors
                                                                .app_black_color,
                                                            fontFamily:
                                                                FontsConstants
                                                                    .regular_font_family,
                                                            fontSize:
                                                                FontsConstants
                                                                    .text_font_size
                                                                    .sp),
                                                      ),
                                                      IconButton(
                                                        onPressed: () {
                                                          Map<String, dynamic>
                                                              selectedBlog =
                                                              Map.from(
                                                                  list[index]);
                                                          if (favouriteController
                                                              .tempList
                                                              .any((item) =>
                                                                  item[
                                                                      "title"] ==
                                                                  selectedBlog[
                                                                      "title"])) {
                                                            favouriteController
                                                                .removeFavourite(
                                                                    selectedBlog);
                                                          } else {
                                                            favouriteController
                                                                .addToFavourite(
                                                                    selectedBlog);
                                                          }
                                                        },
                                                        icon: Obx(() => Icon(
                                                              Icons.favorite,
                                                              color: favouriteController
                                                                      .tempList
                                                                      .any((item) =>
                                                                          item[
                                                                              "title"] ==
                                                                          list[index]
                                                                              [
                                                                              "title"])
                                                                  ? Colors.red
                                                                  : Colors
                                                                      .black,
                                                            )),
                                                      ),
                                                    ],
                                                  ),
                                                  Divider(
                                                    thickness: 2,
                                                    color: Colors.grey,
                                                  ),
                                                  Text(
                                                    list[index]["content"]
                                                        .toString(),
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    softWrap: true,
                                                    maxLines: 3,
                                                    style: TextStyle(
                                                        color: App_Colors
                                                            .app_black_color,
                                                        fontFamily: FontsConstants
                                                            .regular_font_family,
                                                        fontSize: 13.sp),
                                                  ),
                                                  SizedBox(
                                                    height: heightt * 0.03,
                                                  ),
                                                  customLogin_SignupButton(
                                                      innerColor: App_Colors
                                                          .app_black_color,
                                                      textColor: App_Colors
                                                          .app_white_color,
                                                      text: "Read more",
                                                      func: () =>
                                                          Get.to(BlogFullPost(
                                                            blogData:
                                                                list[index],
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
                              }
                            },
                          );
                        } catch (e) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Center(
                                child: CircularProgressIndicator(
                                    color: App_Colors.app_green_color),
                              ),
                            ],
                          );
                        }
                      }))
            ]),
          ),
        ));
  }
}
