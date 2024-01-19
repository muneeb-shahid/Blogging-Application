import 'package:get/get.dart';

class FavouriteController extends GetxController {
  final RxList<Map<String, dynamic>> tempList = <Map<String, dynamic>>[].obs;

  void addToFavourite(Map<String, dynamic> value) {
    tempList.add(value);
  }

  void removeFavourite(Map<String, dynamic> value) {
    tempList.removeWhere((item) => item["title"] == value["title"]);
  }
}
