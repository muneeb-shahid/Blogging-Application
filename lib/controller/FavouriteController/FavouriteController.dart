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
