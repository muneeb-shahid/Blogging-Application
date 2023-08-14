import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavouriteController extends GetxController {
  final RxList<Map<String, dynamic>> tempList = <Map<String, dynamic>>[].obs;

  void addToFavourite(Map<String, dynamic> value) {
    tempList.add(value);
  }

  void removeFavourite(Map<String, dynamic> value) {
    tempList.removeWhere((item) => item["title"] == value["title"]);
  }
}
