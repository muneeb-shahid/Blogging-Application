// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';

// class FavouriteController extends GetxController {
//   // final RxSet<String> favorites = <String>{}.obs; // Change the type to String
//   // final String _favoritesKey = 'favorites';

//     final RxSet<int> favorites = <int>{}.obs; // Change the type to int
//   final dynamic
//    _favoritesKey = 'favorites';

//   @override
//   void onInit() {
//     super.onInit();
//     loadFavorites();
//   }

//   void loadFavorites() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     final favoritesList = prefs.getStringList(_favoritesKey);
//     if (favoritesList != null) {
//       favorites.value = Set.from(favoritesList);
//     }
//   }

//  void saveFavorites() async {
//   SharedPreferences prefs = await SharedPreferences.getInstance();
//   prefs.setStringList(
//       _favoritesKey, favorites.map((item) => item.toString()).toList());
// }


//   void toggleFavorite(String itemId) {
//     if (isFavorite(itemId)) {
//       favorites.remove(itemId);
//     } else {
//       favorites.add(itemId as dynamic);
//     }
//     saveFavorites();
//   }

//   bool isFavorite(String itemId) {
//     return favorites.contains(itemId);
//   }
// }











import 'package:get/get.dart';

class FavouriteController extends GetxController {
  // Use RxSet to store the list of favorite items
  final RxSet<dynamic> favorites = <dynamic>{}.obs;

  // Function to toggle the favorite status of an item
  void toggleFavorite(dynamic item) {
    if (isFavorite(item)) {
      favorites.remove(item);
    } else {
      favorites.add(item);
    }
  }

  // Check if an item is in the favorites list
  bool isFavorite(dynamic item) {
    return favorites.contains(item);
  }
}
