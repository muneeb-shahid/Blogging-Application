import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/Constants/FontConstant/FontConstant.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';
import 'package:blog_app/controller/ProfileController/ProfileController.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyBlog extends StatelessWidget {
  const MyBlog({super.key});

  @override
  Widget build(BuildContext context) {
    // final ref = FirebaseDatabase.instance.ref("Blog");
    // final FavouriteController favouriteController =
    //     Get.put(FavouriteController());

 final ref = FirebaseDatabase.instance.ref("Blog");
    final FavouriteController favouriteController = Get.put(FavouriteController());
    final User? user = FirebaseAuth.instance.currentUser;
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
                  "My Blog",
                  style: TextStyle(
                      color: App_Colors.app_black_color,
                      fontSize: FontsConstants.heading_font_size.sp,
                      fontFamily: FontsConstants.Philosopher,
                      wordSpacing: 1,
                      letterSpacing: 1),
                ),
              ),
            ),
            leading: InkWell(
              child: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.black,
              ),
              onTap: () {
                Get.back();
              },
            )),
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 20, 10, 0),

            child: Column(children: [
              Expanded(
                  child: StreamBuilder(
                      stream: ref.onValue,
                      builder: (
                        context,
                        AsyncSnapshot<DatabaseEvent> snapshot,
                      ) {
                        try {
                    Map<dynamic, dynamic> map = snapshot.data?.snapshot.value as dynamic;
                      List<dynamic> list = [];
                      list.clear();
                      list = map.values.toList();

                      List<dynamic> userPosts = list.where((post) => post['userId'] == user?.uid).toList();


                          return ListView.builder(
                             itemCount: userPosts.length,
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
                                        list[index]['id'].toString(),
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
