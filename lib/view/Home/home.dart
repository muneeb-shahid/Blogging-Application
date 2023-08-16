import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';
import 'package:blog_app/controller/HomeController/HomeController.dart';
import 'package:blog_app/controller/ProfileController/ProfileController.dart';
import 'package:blog_app/controller/SignUpController/SignUpController.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:blog_app/view/CreateBlog/CreateBlog.dart';
import 'package:blog_app/view/MyBlog/MyBlog.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../functions/ListTile/ListTile.dart';

class HomePage extends StatelessWidget {
  HomePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Blog");
  final User _user = FirebaseAuth.instance.currentUser!;


    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    HomeController homeController = Get.put(HomeController());
    final ProfileController _profileController = Get.put(ProfileController());
    final SignUpController _signUpController = Get.put(SignUpController());

    var heightt = MediaQuery.of(context).size.height * 1;
    var widthh = MediaQuery.of(context).size.width * 1;

    return Scaffold(
        backgroundColor: App_Colors.app_background_color,
        appBar: AppBar(
          backgroundColor: App_Colors.app_background_color,
          elevation: 0,
          iconTheme: IconThemeData(color: App_Colors.app_black_color),
        ),
        drawer: Drawer(
          backgroundColor: App_Colors.app_black_color,
          child: SafeArea(
            top: true,
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20, 0, 20, 0),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          child: GetBuilder<ProfileController>(
                            builder: (_) => _profileController.imageFile == null
                                ? Image(
                                    color: App_Colors.app_white_color,
                                    image: AssetImage(
                                      'assets/images/Profile-modified.png',
                                    ))
                                : ClipRRect(
                                    borderRadius: BorderRadius.circular(150.0),
                                    child: Image.file(
                                      _profileController.imageFile!,
                                      height: heightt * 0.2,
                                      width: widthh * 0.4,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                          ),
                        ),
                        Positioned(
                            child: IconButton(
                                onPressed: () =>
                                    _profileController.selectAndCropImage(),
                                icon: const Icon(
                                  Icons.camera_alt,
                                  color: Colors.white,
                                  size: 50,
                                ))),
                      ],
                    ),
                    SizedBox(
                      height: heightt * 0.05,
                    ),

                    // StreamBuilder(
                    //     stream: nameEmail.onValue,
                    //     builder: (
                    //       context,
                    //       AsyncSnapshot<DatabaseEvent> snapshot,
                    //     ) {
                    //   try {
                    //         Map<dynamic, dynamic> map =
                    //             snapshot.data?.snapshot.value as dynamic;
                    //         List<dynamic> list = [];
                    //         list.clear();
                    //         list = map.values.toList();

                    //         return ListView.builder(
                    //           itemCount:
                    //               snapshot.data!.snapshot.children.length,
                    //           itemBuilder: (context, index) {
                    //             return ListTile(
                    //               title: Text(
                    //                 list[index]["name"].toString(),
                    //                 style: TextStyle(
                    //                     color: Colors.red, fontSize: 14),
                    //               ),
                    //               subtitle: Text(
                    //                 list[index]["email"].toString(),
                    //                 style: TextStyle(
                    //                     color: Colors.black, fontSize: 12),
                    //               ),
                    //             );
                    //           },
                    //         );
                    //       } catch (e) {
                    //       return  Column(
                    //           mainAxisAlignment: MainAxisAlignment.center,
                    //           children: [
                    //             Center(
                    //               child: CircularProgressIndicator(
                    //                   color: App_Colors.app_green_color),
                    //             ),
                    //           ],
                    //         );
                    //       }
                    //     }),

                //     ListTile(
                //       leading: Icon(
                //         Icons.person_2_outlined,
                //         color: App_Colors.app_white_color,
                //       ),
                //       title: Text(
                //  _user.displayName ?? _signUpController.name.value.toUpperCase(),
                //         style: TextStyle(
                //             color: App_Colors.app_white_color,
                //             fontSize: FontsConstants.text_font_size.sp,
                //             fontFamily: FontsConstants.regular_font_family,
                //             wordSpacing: 1,
                //             letterSpacing: 1),
                //       ),
                //     ),
                    ListTile(
                      leading: Icon(
                        Icons.email_outlined,
                        color: App_Colors.app_white_color,
                      ),
                      title: Text(
                       _user.email ?? _signUpController.email.value.toLowerCase(),
                        style: TextStyle(
                            color: App_Colors.app_white_color,
                            fontSize: FontsConstants.text_font_size.sp,
                            fontFamily: FontsConstants.regular_font_family,
                            wordSpacing: 1,
                            letterSpacing: 1),
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: App_Colors.app_white_color,
                    ),
                    Drawer_Function.drawer_list_function(
                      func: () => Get.to(CreateBlog()),
                      iconn: Icons.add_box_outlined,
                      text: "Add new article",
                    ),
                    Drawer_Function.drawer_list_function(
                      func: () => Get.to(MyBlog()),
                      iconn: Icons.article_outlined,
                      text: "Your article",
                    ),
                    Drawer_Function.drawer_list_function(
                      func: _profileController.signOutUser,
                      iconn: Icons.logout_outlined,
                      text: "Log out",
                    ),
                    SizedBox(
                      height: heightt * 0.1,
                    ),
                    CircleAvatar(
                      radius: 25,
                      backgroundColor: App_Colors.app_white_color,
                      child: IconButton(
                        icon: Center(
                          child: Icon(
                            Icons.close_sharp,
                            // size: 90,
                            color: App_Colors.app_black_color,
                          ),
                        ),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            child: Column(children: [
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
                              return Container(
                                height: 100,
                                child: GestureDetector(
                                  onTap: () {
                                    Get.to(BlogFullPost(
                                      blogData: list[index],
                                    ));
                                  },
                                  child: Card(
                                    child: ListTile(
                                      trailing: IconButton(
                                        onPressed: () {
                                          Map<String, dynamic> selectedBlog =
                                              Map.from(list[index]);
                                          if (favouriteController.tempList.any(
                                              (item) =>
                                                  item["title"] ==
                                                  selectedBlog["title"])) {
                                            favouriteController
                                                .removeFavourite(selectedBlog);
                                          } else {
                                            favouriteController
                                                .addToFavourite(selectedBlog);
                                          }
                                        },
                                        icon: Obx(() => Icon(
                                              Icons.favorite,
                                              color: favouriteController
                                                      .tempList
                                                      .any((item) =>
                                                          item["title"] ==
                                                          list[index]["title"])
                                                  ? Colors.red
                                                  : Colors.black,
                                            )),
                                      ),
                                      leading: Text(
                                        list[index]['date'].toString(),
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
                                      ),
                                      title: Text(
                                        list[index]["title"].toString(),
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
                                      ),
                                      subtitle: Text(
                                        list[index]["content"].toString(),
                                        overflow: TextOverflow.ellipsis,
                                        softWrap: true,
                                        maxLines: 3,
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 12),
                                      ),
                                    ),
                                  ),
                                ),
                              );
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
