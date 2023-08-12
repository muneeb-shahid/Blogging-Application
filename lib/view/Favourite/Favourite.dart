import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:blog_app/controller/FavouriteController/FavouriteController.dart';

class Favourite extends StatelessWidget {
  final FavouriteController favouriteController =
      Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Favorites'),
      ),
      body: Obx(() {
        if (favouriteController.favorites.isEmpty) {
          return Center(
            child: Text('No favorites added yet.',style: TextStyle(color: Colors.red),),
          );
        } else {
          return ListView.builder(
            itemCount: favouriteController.favorites.length,
            itemBuilder: (context, index) {
              dynamic item = favouriteController.favorites.elementAt(index);
              return Card(
                child: ListTile(
                  title: Text(
                    item["title"], // Use your data structure here
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                  subtitle: Text(
                    item["content"], // Use your data structure here
                    maxLines: 2,

                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                  ),

                  trailing: IconButton(
                    onPressed: () {
                      // Remove item from favorites when un-favorite button is pressed
                      favouriteController.toggleFavorite(item);
                    },
                    icon: Icon(Icons.favorite),
                    color: Colors.red,
                  ),

                  // trailing: IconButton(
                  //   onPressed: () {
                  //     favouriteController.toggleFavorite(item);
                  //   },
                  //   icon: Icon(Icons.favorite),
                  //   color: Colors.red,
                  // ),
 

                ),
              );
            },
          );
        }
      }),
    );
  }
}
