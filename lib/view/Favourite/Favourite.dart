import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';

class Favourite extends StatelessWidget {
  Favourite({
    super.key,
  });

  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (favouriteController.tempList.isEmpty) {
          return Center(
            child: Text(
              'No favorites added yet.',
              style: TextStyle(color: Colors.red),
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
