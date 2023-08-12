import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
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

    return Scaffold(
        backgroundColor: App_Colors.app_background_color,
        body: SafeArea(
          top: true,
          child: Padding(
            padding: EdgeInsets.fromLTRB(10, 40, 10, 0),
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
                                    Get.to(BlogFullPost(blogData: list[index]));
                                  },
                                  child: Card(
                                    child: ListTile(
                                      // trailing: IconButton(
                                      //   onPressed: () {
                                      //     // Add or remove the item from favorites list when the button is pressed
                                      //     favouriteController
                                      //         .toggleFavorite(list[index]);
                                      //   },
                                      //   icon: Obx(() {
                                      //     // Use Obx to reactively update the icon based on the item's favorite status
                                      //     return Icon(Icons.favorite,
                                      //         color: favouriteController
                                      //                 .isFavorite(list[index])
                                      //             ? Colors.red
                                      //             : null);
                                      //   }),
                                      // ),

                                      trailing: IconButton(
                                        onPressed: () {
                                          favouriteController
                                              .toggleFavorite(list[index]);
                                        },
                                        icon: Obx(() {
                                          return Icon(
                                            favouriteController
                                                    .isFavorite(list[index])
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color: favouriteController
                                                    .isFavorite(list[index])
                                                ? Colors.red
                                                : null,
                                          );
                                        }),
                                      ),
 

                                      leading: Text(
                                        list[index]['id'].toString(),
                                        style: TextStyle(
                                            color: Colors.green, fontSize: 14),
                                      ),
                                      title: Text(
                                        list[index]["title"],
                                        style: TextStyle(
                                            color: Colors.red, fontSize: 14),
                                      ),
                                      subtitle: Text(
                                        list[index]["content"],
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
