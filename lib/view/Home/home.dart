import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';
import 'package:blog_app/controller/ProfileController/ProfileController.dart';
import 'package:blog_app/controller/SignUpController/SignUpController.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Blog");
    final FavouriteController favouriteController =
        Get.put(FavouriteController());

    final ProfileController _profileController = Get.put(ProfileController());

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
          child: Column(
            children: [
              SafeArea(
                top: true,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Stack(
                              alignment: Alignment.bottomRight,
                              children: [
                                Container(
                                  child: GetBuilder<ProfileController>(
                                    builder: (_) => _profileController
                                                .imageFile ==
                                            null
                                        ? Image(
                                            color: App_Colors.app_white_color,
                                            image: AssetImage(
                                              'assets/images/Profile-modified.png',
                                            ))
                                        : ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(150.0),
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
                                        onPressed: () => _profileController
                                            .selectAndCropImage(),
                                        icon: const Icon(
                                          Icons.camera_alt,
                                          color: Colors.white,
                                          size: 50,
                                        ))),
                              ],
                            ),
                         

                            SizedBox(
                              height: heightt * 0.3,
                            ),
                            // ElevatedButton(
                            //     onPressed: _profileController.signOutUser,
                            //     child:  Text("logout")),
                            // SizedBox(
                            //   height: heightt * 0.3,
                            // ),
                            // CircleAvatar(
                            //   backgroundColor: App_Colors.app_white_color,
                            //   child: IconButton(
                            //     icon: Icon(
                            //       Icons.close_sharp,
                            //       color: App_Colors.app_black_color,
                            //     ),
                            //     onPressed: () {
                            //       Get.back();
                            //     },
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
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
