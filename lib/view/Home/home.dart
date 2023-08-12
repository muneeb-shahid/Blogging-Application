import 'package:blog_app/Constants/Color%20Constant/ColorConstant.dart';
import 'package:blog_app/view/BlogFullPost/BlogFullPost.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ref = FirebaseDatabase.instance.ref("Blog");

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
